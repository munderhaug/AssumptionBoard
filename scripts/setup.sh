#!/usr/bin/env bash
# Sets up labels and a GitHub Project for the discovery board.
#
# Usage:    ./scripts/setup.sh <owner> <repo> [project title]
# Example:  ./scripts/setup.sh my-org acme-discovery "Discovery board"
#
# Requires GitHub CLI (gh) with the project scope:
#   gh auth refresh -s project
#
# The script always creates a NEW project, so run it once per board.
# Built-in workflows, column limits, sorting and grouping cannot be set through
# GitHub's API. Set them by hand afterwards (docs/setup.md, step 4), or copy a
# template project that already has them (TEMPLATE_PROJECT below).

# The GraphQL documents below use $variables that bash must not expand.
# shellcheck disable=SC2016
set -euo pipefail

# Optional: an already configured project to copy instead of building one from
# scratch, written as <owner>/<number>. Leave empty to build from scratch.
TEMPLATE_PROJECT="${TEMPLATE_PROJECT:-}"

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <owner> <repo> [project title]" >&2
  exit 1
fi

OWNER="$1"
REPO="$2"
TITLE="${3:-Discovery board}"
FULL_REPO="$OWNER/$REPO"

if [ -n "$TEMPLATE_PROJECT" ] && ! [[ "$TEMPLATE_PROJECT" =~ ^[^/]+/[0-9]+$ ]]; then
  echo "TEMPLATE_PROJECT must look like <owner>/<number>, for example my-org/3. Now: $TEMPLATE_PROJECT" >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) was not found. Install it from https://cli.github.com" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "You are not logged in. Run: gh auth login" >&2
  exit 1
fi

# --- GraphQL documents ------------------------------------------------------
# Option names, colours and descriptions are part of the method. They show on
# the board and in the field menus.

STATUS_OPTIONS='mutation($fieldId: ID!) {
  updateProjectV2Field(input: {fieldId: $fieldId, singleSelectOptions: [
    {name: "What we need to know", color: GRAY, description: "A genuine open question that matters for a decision ahead."},
    {name: "What we think we know", color: YELLOW, description: "A working belief or assumption, with or without indications. Not established understanding."},
    {name: "Prioritized", color: BLUE, description: "We have committed to reduce this uncertainty. Has people and a next checkpoint."},
    {name: "Investigating", color: ORANGE, description: "Learning is under way in the right tools. Keep this to three cards or fewer."},
    {name: "What we currently know", color: GREEN, description: "Our best current understanding, scoped to the evidence. Moved here in the weekly review."},
    {name: "Informed bet", color: PURPLE, description: "We proceed despite uncertainty, on purpose. Not knowledge."}
  ]}) { projectV2Field { ... on ProjectV2SingleSelectField { id } } }
}'

LENS_FIELD='mutation($projectId: ID!) {
  createProjectV2Field(input: {projectId: $projectId, dataType: SINGLE_SELECT, name: "Primary lens", singleSelectOptions: [
    {name: "People", color: PINK, description: "Users, roles, needs, goals, behaviour and work practice."},
    {name: "Business", color: ORANGE, description: "Value, workflows, governance, responsibilities, rules and organisational context."},
    {name: "Technology", color: BLUE, description: "Systems, data, architecture, integrations, constraints and which system is the source of truth."},
    {name: "Product", color: GREEN, description: "What the product is for, its capabilities, interaction, information and user experience."}
  ]}) { projectV2Field { ... on ProjectV2SingleSelectField { id } } }
}'

OUTCOME_FIELD='mutation($projectId: ID!) {
  createProjectV2Field(input: {projectId: $projectId, dataType: SINGLE_SELECT, name: "Outcome", singleSelectOptions: [
    {name: "Supported", color: GREEN, description: "The belief held within the scope of the evidence."},
    {name: "Refined", color: BLUE, description: "It held only in part, or the wording had to become narrower."},
    {name: "Did not hold", color: RED, description: "The evidence contradicted what we believed."},
    {name: "Inconclusive", color: GRAY, description: "The investigation did not give a usable answer."}
  ]}) { projectV2Field { ... on ProjectV2SingleSelectField { id } } }
}'

FIRST_VIEW='query($projectId: ID!) {
  node(id: $projectId) { ... on ProjectV2 { views(first: 1) { nodes { id } } } }
}'

UPDATE_VIEW='mutation($viewId: ID!, $name: String!, $layout: ProjectV2ViewLayout!) {
  updateProjectV2View(input: {viewId: $viewId, name: $name, layout: $layout}) { projectV2View { id } }
}'

CREATE_VIEW='mutation($projectId: ID!, $name: String!, $layout: ProjectV2ViewLayout!) {
  createProjectV2View(input: {projectId: $projectId, name: $name, layout: $layout}) { projectV2View { id } }
}'

SET_VIEW_FILTER='mutation($viewId: ID!, $filter: String!) {
  updateProjectV2View(input: {viewId: $viewId, filter: $filter}) { projectV2View { id } }
}'

# Creates a view and sets its filter. Views are a convenience: a failure is
# reported and the script continues, because the board works without them.
VIEW_PROBLEMS=0
create_view() {
  local name="$1" layout="$2" filter="$3" view_id
  if ! view_id=$(gh api graphql -f query="$CREATE_VIEW" -f projectId="$PROJECT_ID" \
      -f name="$name" -f layout="$layout" --jq '.data.createProjectV2View.projectV2View.id') \
      || [ -z "$view_id" ]; then
    echo "  Could not create the view «$name». Create it by hand (docs/setup.md, step 4)." >&2
    VIEW_PROBLEMS=1
    return 0
  fi
  if [ -n "$filter" ] && ! gh api graphql -f query="$SET_VIEW_FILTER" -f viewId="$view_id" \
      -f filter="$filter" --silent; then
    echo "  Created «$name», but could not set its filter. Set it by hand: $filter" >&2
    VIEW_PROBLEMS=1
    return 0
  fi
  echo "  View: $name"
}

# --- 1. Labels ----------------------------------------------------------------

echo "1/5 Creating labels in $FULL_REPO ..."
gh label create "question" --repo "$FULL_REPO" --color "1d76db" \
  --description "An open question the team needs to understand" --force
gh label create "belief" --repo "$FULL_REPO" --color "fbca04" \
  --description "A working belief, not yet established understanding" --force

# --- 2. Project ---------------------------------------------------------------

if [ -n "$TEMPLATE_PROJECT" ]; then
  echo "2/5 Copying the template project $TEMPLATE_PROJECT to \"$TITLE\" ..."
  if ! NUMBER=$(gh project copy "${TEMPLATE_PROJECT#*/}" --source-owner "${TEMPLATE_PROJECT%/*}" \
      --target-owner "$OWNER" --title "$TITLE" --format json --jq '.number'); then
    echo "Could not copy the template project. Can you read it, and does gh have the project scope? Run: gh auth refresh -s project" >&2
    exit 1
  fi
else
  echo "2/5 Creating the project \"$TITLE\" ..."
  if ! NUMBER=$(gh project create --owner "$OWNER" --title "$TITLE" --format json --jq '.number'); then
    echo "Could not create the project. Does gh have the project scope? Run: gh auth refresh -s project" >&2
    exit 1
  fi
fi

# From here on the project exists. If a step fails, say how to clean up, since
# running the script again would create a second project.
trap 'echo "Setup stopped after project $NUMBER was created. Delete it before trying again: gh project delete $NUMBER --owner $OWNER" >&2' ERR

# --- 3. Link ------------------------------------------------------------------

echo "3/5 Linking project $NUMBER to $FULL_REPO ..."
LINK_PROBLEM=0
if ! gh project link "$NUMBER" --owner "$OWNER" --repo "$REPO"; then
  echo "  Could not link the project to the repository. Link it by hand: gh project link $NUMBER --owner $OWNER --repo $REPO" >&2
  LINK_PROBLEM=1
fi

if [ -n "$TEMPLATE_PROJECT" ]; then
  echo "4/5 The states and fields come with the template project."
  echo "5/5 The views come with the template project."
else
  PROJECT_ID=$(gh project view "$NUMBER" --owner "$OWNER" --format json --jq '.id')

  # --- 4. States and fields ---------------------------------------------------

  echo "4/5 Setting the six states and creating the fields ..."
  STATUS_ID=$(gh project field-list "$NUMBER" --owner "$OWNER" --format json \
    --jq '.fields[] | select(.name == "Status") | .id')
  if [ -z "$STATUS_ID" ]; then
    echo "Project $NUMBER has no Status field, so the six states could not be set." >&2
    echo "Delete the project with: gh project delete $NUMBER --owner $OWNER" >&2
    exit 1
  fi
  gh api graphql -f query="$STATUS_OPTIONS" -f fieldId="$STATUS_ID" --silent
  gh api graphql -f query="$LENS_FIELD" -f projectId="$PROJECT_ID" --silent
  gh api graphql -f query="$OUTCOME_FIELD" -f projectId="$PROJECT_ID" --silent
  gh project field-create "$NUMBER" --owner "$OWNER" --name "Next checkpoint" --data-type "DATE" >/dev/null

  # --- 5. Views ---------------------------------------------------------------

  echo "5/5 Creating the views ..."
  if FIRST_VIEW_ID=$(gh api graphql -f query="$FIRST_VIEW" -f projectId="$PROJECT_ID" \
      --jq '.data.node.views.nodes[0].id') && [ -n "$FIRST_VIEW_ID" ] \
      && gh api graphql -f query="$UPDATE_VIEW" -f viewId="$FIRST_VIEW_ID" \
      -f name="Board" -f layout="BOARD_LAYOUT" --silent; then
    echo "  View: Board"
  else
    echo "  Could not turn the first view into «Board». Do it by hand (docs/setup.md, step 4)." >&2
    VIEW_PROBLEMS=1
  fi
  create_view "Learning now" "TABLE_LAYOUT" 'status:Prioritized,Investigating'
  create_view "Ready for action" "BOARD_LAYOUT" 'status:"What we currently know","Informed bet" -reason:"not planned"'
  create_view "Changed our mind" "TABLE_LAYOUT" 'outcome:"Did not hold",Refined'
  create_view "By milestone" "TABLE_LAYOUT" ''
  create_view "My learning" "TABLE_LAYOUT" 'assignee:@me is:open'
fi

trap - ERR

echo
if [ "$LINK_PROBLEM" -eq 0 ]; then
  echo "Done. Project $NUMBER is linked to $FULL_REPO."
else
  echo "Done. Project $NUMBER is NOT linked to $FULL_REPO yet."
fi
echo
echo "Still to do by hand (docs/setup.md, from step 4):"
if [ "$LINK_PROBLEM" -ne 0 ]; then
  echo "  - Link the project: gh project link $NUMBER --owner $OWNER --repo $REPO"
fi
if [ -n "$TEMPLATE_PROJECT" ]; then
  echo "  - Check that the states, fields, views, workflows and column limit came with the copy"
  echo "  - Turn on auto-add with the filter is:issue (it is never copied)"
else
  echo "  - Workflows: auto-add, item added, item closed, auto-close, item reopened and auto-archive;"
  echo "    turn the pull request workflows off"
  echo "  - Column limit: 3 on «Investigating»"
  echo "  - Sorting and grouping in «Learning now» and «By milestone», and the two columns in «Ready for action»"
  if [ "$VIEW_PROBLEMS" -ne 0 ]; then
    echo "  - The views reported above"
  fi
fi
echo "  - Give the team write access and stakeholders read access"
echo "  - Replace README.md with a short description of this board"
echo "  - Try it with one question and one belief"
