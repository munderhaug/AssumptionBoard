# Setup, step by step

From an empty repository to a board the team can use. Plan for about 30 minutes. Do the steps in order, since several build on the ones before.

GitHub renames menus now and then. If something does not match, look in the project's *Settings* and *Workflows*, and in GitHub's documentation for Projects.

## 1. Before you start

Once per machine:

1. Install [GitHub CLI](https://cli.github.com): `brew install gh` on macOS, `winget install --id GitHub.cli` on Windows.
2. Log in and give GitHub CLI access to Projects:
   ```bash
   gh auth login
   gh auth refresh -s project
   ```
3. On Windows, run the script in Git Bash or WSL.

**Decide who owns the repository.** Use one repository per product or client. If stakeholders should only read the board, the repository must be owned by an **organization** (a free one is enough). On a personal account, everyone you invite gets write access. Projects are owned by the same account as the repository.

## 2. Create the repository

1. Open the [template](https://github.com/munderhaug/AssumptionBoard) and choose *Use this template* → *Create a new repository*.
2. Choose the owner, a name such as `acme-discovery`, and **Private**.
3. Clone it:
   ```bash
   gh repo clone <owner>/<repo>
   cd <repo>
   ```

Or all in one command:

```bash
gh repo create <owner>/<repo> --template munderhaug/AssumptionBoard --private --clone
cd <repo>
```

## 3. Run the setup script

```bash
./scripts/setup.sh <owner> <repo> "Discovery board"
```

The project title at the end is optional. The script:

1. creates the labels `question` and `belief`,
2. creates a project and links it to the repository,
3. replaces the default Status options with the six states, with colours and descriptions,
4. creates the fields **Primary lens**, **Outcome** and **Next checkpoint**,
5. creates the views *Board*, *Learning now*, *Ready for action*, *Changed our mind*, *By milestone* and *My learning*, with their filters.

Run it only once per board: it creates a new project every time. If it stops with an error after the project was created, delete the half-finished project before trying again (`gh project list --owner <owner>`, then `gh project delete <number> --owner <owner>`). If only a view fails, the script says so and carries on; create that view by hand in step 4.

| Field | Values | Used for |
| --- | --- | --- |
| Status | What we need to know, What we think we know, Prioritized, Investigating, What we currently know, Informed bet | The six states |
| Primary lens | People, Business, Technology, Product | Orientation and filtering |
| Outcome | Supported, Refined, Did not hold, Inconclusive | Concluded beliefs. Feeds *Changed our mind* |
| Next checkpoint | Date | Prioritized and investigating cards, and informed bets |

Assignees, milestones, sub-issues and dependencies are GitHub's own features and need no setup.

## 4. Finish the project settings by hand

GitHub's API cannot set workflows, column limits, sorting or grouping. Open the project.

**Workflows** (project menu → *Workflows*):

| Workflow | Setting |
| --- | --- |
| Auto-add to project | On, for this repository, filter `is:issue` |
| Item added to project | Set Status to *What we need to know* |
| Item closed | Set Status to *What we currently know* |
| Auto-close issue | On, when Status changes to *What we currently know* |
| Item reopened | Set Status to *What we think we know*, if your project offers this workflow |
| Auto-archive items | On, filter `is:closed reason:"not planned"` |
| Pull request linked, Pull request merged, Code changes requested, Code review approved | Off |

Why: closing a card and moving it to *What we currently know* become the same action, from either direction. Duplicates and irrelevant cards are closed as not planned and archived, so they never show up as knowledge. On GitHub Free a project can only have one auto-add workflow, so it adds all issues; the repository is only used for cards. Auto-add does not pick up issues that existed before you turned it on.

**Column limit:** in *Board*, open the menu on *Investigating* → *Set limit* → 3. The limit only highlights; it does not block.

**Views** (open each one):

| View | Check or set |
| --- | --- |
| Board | Board layout with Status as columns. Show Labels, Assignees and Next checkpoint on the cards. |
| Learning now | Filter `status:Prioritized,Investigating`. Sort by Next checkpoint. Show Assignees and Next checkpoint. |
| Ready for action | Board, filter `status:"What we currently know","Informed bet" -reason:"not planned"`. Show Outcome. |
| Changed our mind | Filter `outcome:"Did not hold",Refined`. Show Outcome. |
| By milestone | Group by Milestone. |
| My learning | Filter `assignee:@me is:open`. |

Hide fields a view does not need (*Fields* in the view menu). Save each view after changing it.

## 5. Access

- **Repository:** *Settings* → *Collaborators* (or *Collaborators and teams* in an organization). The team gets write access. Stakeholders get read access, which only exists in organizations.
- **Project:** the project's *Settings* → *Manage access*. Give the same people the same level. A private repository's issues are only visible in the project to people who can read the repository.

## 6. Replace the README

Your repository inherited this template's README, which is about setting up a board. Replace it with a short description for the people who will read the board:

```markdown
# Discovery: <product or client>

This repository holds the team's shared map of learning: what we need to know, what we think we know, what we are investigating, what we currently know well enough to act on, and where we proceed as informed bets.

- **The board:** <link to the project>. Start with the views *Ready for action*, *Learning now* and *Changed our mind*.
- **How we work:** [docs/working-model.md](docs/working-model.md)
- **Cards in «What we currently know»** have titles that state the understanding and the evidence it rests on. Informed bets are deliberate choices to proceed without enough evidence.
```

## 7. Link to the delivery repository

1. Copy `templates/dev-repo/pull_request_template.md` to the delivery repository as `.github/pull_request_template.md`. Every pull request then names the learning it builds on, and whether that is current understanding or an informed bet.
2. When a delivery issue must wait for a question or belief to be resolved, mark it as *blocked by* the card. Use *Relationships* in the issue's sidebar, or GitHub CLI 2.94.0 or newer:
   ```bash
   gh issue edit <number> --repo <owner>/<delivery-repo> \
     --add-blocked-by https://github.com/<owner>/<discovery-repo>/issues/<number>
   ```
   Never block delivery on an informed bet. The bet is the decision to proceed.
3. Mention cards in delivery issues and decisions, for example «Informed by org/discovery#12». GitHub then shows the link on both sides.

## 8. Try it

1. *Issues* → *New issue* → **Question**. Check that the card gets the label `question` and appears in *What we need to know*.
2. *Issues* → *New issue* → **Belief**. Check that the title starts with «We believe», that it gets the label `belief`, and move it to *What we think we know*.
3. Give the belief an assignee and a Next checkpoint, and move it to *Prioritized*. Check that it shows in *Learning now*.
4. Rewrite its title as an understanding, set Outcome to *Did not hold* and close it. Check that it lands in *What we currently know* and shows in *Changed our mind*.
5. Close the question as *not planned*. Check that it is archived and does not show as knowledge.
6. Delete both test issues (*Delete issue* at the bottom of the issue's sidebar).

## 9. Start

- **A new project** starts with an empty board.
- **A project that is already running** starts with the current-state mapping in [working-model.md](working-model.md#where-to-start).

Then book the weekly review.

## Template project (for whoever maintains the template)

A template project is a fully configured project that `scripts/setup.sh` copies instead of building one. New boards then get the workflows, column limit, sorting and grouping without step 4. Set it up once:

1. Create a test repository from the template, run `scripts/setup.sh` against it and do step 4. Name the project «Discovery board template».
2. Make sure everyone who runs the script can read it. In an organization you can also run `gh project mark-template <number> --owner <organization>` so it shows under *New project*.
3. Run the script with `TEMPLATE_PROJECT=<owner>/<number> ./scripts/setup.sh <owner> <repo>`, or set the value at the top of `scripts/setup.sh` in your copy of the template.
4. Auto-add is never copied. Turn it on by hand in every new board.

According to GitHub's documentation on [copying projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/creating-projects/copying-an-existing-project), a copy gets the views, custom fields, workflows except auto-add, and insights, but not items, collaborators or repository links. The documentation does not say whether column limits are copied.

## Checklist

- [ ] GitHub CLI is installed and has the project scope
- [ ] The repository is private, and owned by an organization if stakeholders should only read
- [ ] The script ran: two labels, the six states, three fields, six views
- [ ] Workflows set as in step 4, and the pull request workflows are off
- [ ] Column limit of 3 on *Investigating*
- [ ] Views sorted and grouped as in step 4
- [ ] Team has write access, stakeholders read access, on both the repository and the project
- [ ] README replaced
- [ ] Pull request template copied to the delivery repository
- [ ] Test cards behaved as in step 8 and are deleted
- [ ] Weekly review booked

## Not yet verified against GitHub

As of 16 October 2026, the setup script has been tested offline only, with a fake `gh` command, and its GraphQL documents have been validated against GitHub's published schema. It has not run against a real project yet. Check these the first time:

- The Status options, fields and views are created as described in step 3. Creating views through the API is new (July 2026).
- *Board* uses Status as its columns after the script turns the first view into a board.
- The *Item reopened* workflow exists in your project. If it does not, move reopened cards by hand.
- *Auto-close issue* closes the issue when a card is dragged to *What we currently know*.
- The filters work as written, including `outcome:"Did not hold",Refined` and `assignee:@me`.
- Auto-archive with `is:closed reason:"not planned"` archives cards closed as not planned.
