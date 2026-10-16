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
3. On Windows, run the script in Git Bash. To use WSL instead, install GitHub CLI inside WSL and run `gh auth login` and `gh auth refresh -s project` there too.

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
| Next checkpoint | Date | When the team next looks at a prioritized or investigating card, and an informed bet's revisit date. Not a deadline |

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

Why: closing a card and moving it to *What we currently know* become the same action, from either direction. The reverse is not automatic: moving a card out of *What we currently know* does not reopen it, so reopen the issue first. *Item closed* also moves cards closed as not planned to *What we currently know*, and auto-archive is what removes them, so it must be on. Close duplicates as not planned too: a card closed with *Close as duplicate* is not archived. On GitHub Free a project can only have one auto-add workflow, so it adds all issues; the repository is only used for cards. Auto-add adds issues only when they are created or updated, so issues that existed before you turned it on appear only when someone next updates them. Add them by hand.

**Column limit:** in *Board*, open the menu next to *Investigating* → *Set column limit*, type 3 and click *Save*. The limit only highlights; it does not block.

**Views** (open each one):

| View | Check or set |
| --- | --- |
| Board | Board layout with Status as columns. Show Labels, Assignees and Next checkpoint on the cards. |
| Learning now | Filter `status:Prioritized,Investigating`. Sort by Next checkpoint. Show Assignees and Next checkpoint. |
| Ready for action | Board layout, filter `status:"What we currently know","Informed bet" -reason:"not planned"`. Show only the columns *What we currently know* and *Informed bet* (scroll to the right of the columns and click +). Show Outcome. |
| Changed our mind | Filter `outcome:"Did not hold",Refined`. Show Outcome. |
| By milestone | Group by Milestone. |
| My learning | Filter `assignee:@me is:open`. |

Hide fields a view does not need (*Fields* in the view menu). Save each view after changing it.

## 5. Access

- **Repository:** *Settings* → *Collaborators* (or *Collaborators and teams* in an organization). The team gets write access. Stakeholders get read access, which only exists in organizations.
- **Project:** the project's *Settings* → *Manage access*. Give the same people the same level. Add stakeholders here after they have accepted the repository invitation; until then GitHub cannot find them. A private repository's issues are only visible in the project to people who can read the repository.

## 6. Replace the README

Your repository inherited this template's README, which is about setting up a board. Replace it with a short description for the people who will read the board:

```markdown
# Discovery: <product or client>

This repository holds the team's shared map of learning: what we need to know, what we think we know, what we are investigating, what we currently know well enough to act on, and where we proceed as informed bets.

- **The board:** <link to the project>. Start with the views *Ready for action*, *Learning now* and *Changed our mind*.
- **How we work:** [docs/working-model.md](docs/working-model.md)
- **Cards in «What we currently know»** have titles that state the understanding and the evidence it rests on. Informed bets are deliberate choices to proceed without enough evidence.
- **Questioning a card?** Comment on it. The team takes it up in the weekly review.
```

The `LICENSE` file covers the template itself. Delete it in your board if it does not suit your project.

## 7. Link to the delivery repository

1. Copy `templates/dev-repo/pull_request_template.md` to the delivery repository as `.github/pull_request_template.md`. Every pull request then names the learning it builds on, and whether that is current understanding, an informed bet or not decided yet.
2. When a delivery issue must wait for a question or belief to be resolved, mark it as *blocked by* the card. Use *Relationships* in the issue's sidebar, or GitHub CLI 2.94.0 or newer:
   ```bash
   gh issue edit <number> --repo <owner>/<delivery-repo> \
     --add-blocked-by https://github.com/<owner>/<discovery-repo>/issues/<card-number>
   ```
   Never block delivery on an informed bet. The bet is the decision to proceed.
3. Mention cards in delivery issues and decisions, for example «Informed by org/discovery#12». GitHub then shows the link on both sides. Never close a card from the delivery repository: no «Closes», «Fixes», «Resolves» or any other closing keyword before a card in a pull request or commit message, and no pull request or branch linked in the card's *Development* sidebar. Merging would close the card and mark it as current understanding.

## 8. Try it

1. *Issues* → *New issue* → **Question**. Check that the card gets the label `question` and appears in *What we need to know*.
2. *Issues* → *New issue* → **Belief**. Check that the title starts with «We believe», that it gets the label `belief`, and move it to *What we think we know*.
3. Give the belief an assignee and a Next checkpoint, and move it to *Prioritized*. Check that it shows in *Learning now*.
4. Rewrite its title as an understanding, set Outcome to *Did not hold* and drag it to *What we currently know*. Check that the issue closes and shows in *Changed our mind*.
5. Reopen it. Check that it moves to *What we think we know*, if your project has *Item reopened*. Then close it from the issue page and check that it moves back to *What we currently know*.
6. Close the question with *Close as not planned*. Check that it is archived and does not show in *Ready for action*.
7. Delete both test issues (*Delete issue* in the issue's sidebar). In an organization this needs admin access, and an owner must first allow deleting issues. If you cannot delete them, reopen the belief and close it as not planned too, so both are archived.

## 9. Start

- **A new project** starts with an empty board.
- **A project that is already running** starts with the current-state mapping in [working-model.md](working-model.md#where-to-start).

Then book the weekly review. Cards move to *What we currently know* and *Informed bet* there, so the first review comes soon after the board starts.

## Template project (for whoever maintains the template)

A template project is a fully configured project that `scripts/setup.sh` copies instead of building one. New boards then get the views, fields, workflows except auto-add, and the sorting and grouping, so most of step 4 is done. Turn on auto-add and check the column limit by hand. Set it up once:

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
- [ ] Test cards behaved as in step 8, and are deleted or closed as not planned
- [ ] Weekly review booked

## Not yet verified against GitHub

As of 16 October 2026, the setup has been checked offline: the script has run against a fake `gh` command in every mode and failure case, its GraphQL documents validate against GitHub's published schema, the issue forms and `.claude/settings.json` validate against their published schemas, and every `gh` command and flag in this repository exists in GitHub CLI 2.89 (2.94 for blocked-by). It has not run against a real project yet, so the first board you set up is also the test. Step 8 checks the workflows. Check these too, and use the fallback if one does not hold:

| Check | Evidence so far | If it does not hold |
| --- | --- | --- |
| The Status options, fields and views are created as described in step 3. Creating views through the API is new (July 2026). | In GitHub's schema and changelog | The script names what failed. Create that view by hand from the table in step 4. If a field failed, the script stops and says how to delete the project before you try again. |
| *Board* uses Status as its columns after the script turns the first view into a board. | GitHub's docs: Status is the usual column field | In the view menu, set *Column field* to Status. |
| The *Item reopened* workflow exists in your project. | Seen in the workflow list, not in GitHub's docs | Move a reopened card by hand: a belief to *What we think we know*, a question to *What we need to know*. |
| *Auto-close issue* closes the issue when a card is dragged to *What we currently know*. | GitHub's docs on built-in automations | Close the issue by hand when the team moves the card in the review. |
| The filters work as written, including `outcome:"Did not hold",Refined` and `assignee:@me`. | GitHub's docs on filtering projects | Build the filter in the view's filter bar from its suggestions, and save the view. |
| Auto-archive with `is:closed reason:"not planned"` archives cards closed as not planned, soon after *Item closed* has moved them to *What we currently know*. | GitHub's docs on archiving automatically | Archive them by hand (the card's menu → *Archive*). *Ready for action* leaves them out either way. |
| *Ready for action* keeps only its two columns after you hide the others. | GitHub's docs on board layout | Hide them again. The filter still shows only the two states. |

When you have checked them, replace this section with the results and the date.
