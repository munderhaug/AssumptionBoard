# Discovery board

A GitHub template for a product team's shared map of learning. It makes visible what the team needs to know, what it thinks it knows, what it is investigating, what it currently knows well enough to act on, and where it proceeds on purpose despite uncertainty.

Each card is a question or a belief, never a task. The board shows the state of the team's understanding, not progress on work. Research, design and engineering happen in the tools that suit them. The board holds the conclusions and links back to the work.

It is built for teams that know kanban but are new to structured discovery, including teams in the middle of a project where some of what has been built rests on beliefs nobody has checked.

## The board

| What we need to know | What we think we know | Prioritized | Investigating | What we currently know | Informed bet |
| --- | --- | --- | --- | --- | --- |
| Open questions that matter for a decision ahead | Working beliefs, not yet established | Committed: has people and a next checkpoint | Learning under way, three cards at most | The best current understanding, scoped to the evidence | Proceeding despite uncertainty, on purpose |

- **Two ways in:** a **Question** («How do bookkeepers find missing invoices at month end?») or a **Belief** («We believe clients will upload invoices themselves»).
- **The card changes shape with its state.** It starts with a title, why it matters and a criterion: what would be enough to update our understanding. When it becomes *What we currently know*, its title is rewritten to state the understanding and the evidence it rests on.
- **Knowledge and action are separate.** *What we currently know* means the team knows enough within the current scope. *Informed bet* means it does not, and proceeds anyway, knowingly.
- **Changed minds are visible.** Concluded beliefs get an Outcome. The view *Changed our mind* shows the ones that did not hold or had to be refined.
- **A weekly review** of 20 to 30 minutes keeps the board alive. The team decides there what it is willing to call current understanding, and moves those cards.

The method is in [docs/working-model.md](docs/working-model.md). Good cards are in [docs/examples.md](docs/examples.md).

## Get started

The full setup, including installing GitHub CLI, is in [docs/setup.md](docs/setup.md). Plan for about 30 minutes.

1. **Create a repository from the template:** *Use this template* → *Create a new repository*, and make it private. Use one repository per product or client. If stakeholders should only read the board, the repository must be owned by an organization.
2. **Run the setup script** from a clone of the new repository. It needs [GitHub CLI](https://cli.github.com):
   ```bash
   gh auth refresh -s project
   ./scripts/setup.sh <owner> <repo>
   ```
   It creates the labels, a project with the six states, the fields *Primary lens*, *Outcome* and *Next checkpoint*, and six views, and links the project to the repository.
3. **Finish by hand:** workflows, the column limit, and sorting and grouping in the views ([docs/setup.md](docs/setup.md), step 4). GitHub's API cannot set these.
4. **Start.** A new project starts with an empty board. A project that is already running starts with a 90-minute mapping of what has been built and what it rests on ([Where to start](docs/working-model.md#where-to-start)).

## What is in the repository

```
.github/ISSUE_TEMPLATE/question.yml        The Question form
.github/ISSUE_TEMPLATE/belief.yml          The Belief form
.github/ISSUE_TEMPLATE/config.yml          Hides blank issues from readers
.github/copilot-instructions.md            Short rules for Copilot Chat on github.com
.gitattributes                             Keeps the setup script runnable on Windows
docs/working-model.md                      The method
docs/examples.md                           Example cards in each state
docs/setup.md                              Setup, step by step
scripts/setup.sh                           Creates labels, project, fields and views
templates/dev-repo/pull_request_template.md  For the delivery repository: which learning a change builds on
AGENTS.md                                  Instructions for AI assistants
.claude/skills/discovery-assistant/        The AI assistant's four jobs
.claude/settings.json                      Which GitHub commands Claude Code may run without asking
```

## The AI assistant (optional)

The board works without AI. If the team uses Claude Code or GitHub Copilot, the assistant in `.claude/skills/discovery-assistant/` has four jobs:

1. **Formulate:** turn a concern, idea or loose belief into a good question or belief card, and help map a running project.
2. **Challenge:** before a card becomes current understanding or an informed bet, question its scope, evidence and wording.
3. **Prepare the review:** draft the weekly review agenda from the board.
4. **Communicate:** draft the learning update for stakeholders.

It reads the board with GitHub CLI and writes to GitHub only after an explicit yes to the exact change. It never decides what the team knows, never sends anything, and never presents its own output as evidence. The rules are in [AGENTS.md](AGENTS.md).

- **Start it** with `/discovery-assistant` in Claude Code, or just ask, for example «we believe clients will upload invoices themselves: make a card».
- **Use it in a local session:** Claude Code in a terminal, Claude Desktop or VS Code, or GitHub Copilot's agent mode or CLI. From a browser or phone, reach your local session through [Remote Control](https://code.claude.com/docs/en/remote-control). Claude Code on the web cannot read the board's fields, so there it can only help draft cards.
- **Approve each write.** Claude Code asks before every board write, as set in `.claude/settings.json`. Copilot asks too, but do not choose *always allow*, *Allow all* or similar for board work. Never assign a card to Copilot: its cloud agent works without asking.
- **Copilot Chat on github.com** follows the short rules in `.github/copilot-instructions.md`. It can draft a card from the Question or Belief form for you to check and create, but it cannot see the board's fields.
- **What is sent to the AI provider:** everything you and the assistant read and write, including card text and comments. Before using it on a client's board, check that your agreement with the client allows it. Use a business plan (such as Claude Team or Enterprise, or Copilot Business or Enterprise), or turn off model training in your own settings. See [how Claude Code uses data](https://code.claude.com/docs/en/data-usage) and [GitHub's Copilot data policy](https://github.blog/news-insights/company-news/updates-to-github-copilot-interaction-data-usage-policy/).

## Privacy

The board holds conclusions, not raw research. Never put names of interviewees, identifying quotes, recordings or raw notes in an issue. Link to summaries in the tools where the research lives.

## Keep it small

Two forms, six states, three fields and one weekly review are enough. Add only what the team will actually use, and remove what nobody uses.

## License

[MIT](LICENSE)
