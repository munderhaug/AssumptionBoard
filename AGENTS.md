# AGENTS.md

This repository is an **assumption board** (antakelsestavle): a team's product discovery for one customer project, created from the template [munderhaug/AssumptionBoard](https://github.com/munderhaug/AssumptionBoard). Each card is an assumption, something the team believes but has not verified, not a task. Cards are GitHub issues labelled `antakelse` on a GitHub Project. They are not files. The files describe the method.

You assist the team. The team owns the cards and makes every decision. The board must stay a living, practical tool, not project management, and it must work just as well without you.

## Language

- Write everything the team reads in Norwegian bokmål: cards, comments, agendas, summaries and answers.
- Commands and code stay in English.
- Use the board's terms exactly as written in this file. They must match the board, so never translate them.

## Commands

Requires GitHub CLI with the `project` scope (`gh auth refresh -s project`). Run from a clone of the repository.

```bash
# Repository, template flag and project number
gh repo view --json nameWithOwner,isTemplate,projectsV2

# Cards with text, labels, milestone and Status
gh issue list --label antakelse --state all --limit 500 \
  --json number,title,state,createdAt,closedAt,updatedAt,labels,milestone,url,body,projectItems

# Board fields: Status, Oppfølging, Risikotype, Viktighet, Sikkerhet, Basis
gh project item-list <number> --owner <owner> --format json --limit 500

# Today's date, for comparing with Oppfølging
date +%F
```

- The issue form writes one section per field, headed `### Vi tror at…`, `### Vi tester ved å…`, `### Vi har rett hvis…` and `### Beslutning og innsikt`. Empty fields read `_No response_`.
- If the number of results equals `--limit`, raise the limit so no cards are missed.

## The method in brief

The authority is `docs/HVORDAN-VI-JOBBER.md`. Read it when in doubt. Good cards are in `docs/EKSEMPELKORT.md`.

- **Card:** one concrete claim that could turn out to be wrong. The title starts with «Vi tror at». Four sections: *Vi tror at…*, *Vi tester ved å…*, *Vi har rett hvis…* (the pass/fail line, written before the test starts) and *Beslutning og innsikt* (written when the card leaves discovery).
- **Status** (the columns, in order): Backlog, Neste opp, Under discovery, Klar for implementering, Implementert, and Ikke sant as an end column. Limits: 3 in *Under discovery*, 5 in *Neste opp*.
- **Fields:** Oppfølging (a date: when we next look at the card; a signal, not a deadline), Risikotype (Verdi, Brukbarhet, Gjennomførbarhet, Levedyktighet), Viktighet (Høy, Middels, Lav), Sikkerhet (Lav, Middels, Høy) and Basis (Validert, Bet).
- **Label** `trenger-mer-research`: the test gave no answer. It is a label, not a column.
- **Bet:** a card the team builds on without testing, on purpose, with a measurement and an Oppfølging date.
- **Closing:** an issue is closed when the decision is made, not when something ships.
- **Evidence** may live in Miro, Figma or similar tools. The conclusion is written on the card.

## Boundaries

### Always

- Read the cards before saying anything about the board. Refer to cards by number and link.
- Challenge with questions: which decision does this card help with, is it one claim, could it turn out wrong, is it a task in disguise?
- Keep suggestions short and concrete. Suggest the cheapest test that could give an answer.
- Point out when a card lacks something the team's agreements require, and leave the decision to the team.
- Separate clearly what the cards say from your own suggestions and interpretations.

### Ask first

- Any write to GitHub: creating an issue, editing, moving, closing or reopening one, posting a comment, or changing a field on the board. Show exactly what will change and wait for an explicit yes to that specific change.

### Never

- Never write to GitHub without that explicit yes.
- Never make decisions for the team on your own initiative: do not set Status, Basis, Viktighet or Sikkerhet, and do not write *Beslutning og innsikt*.
- Never invent results, numbers, quotes or evidence. If it is not on the card, say it is missing.
- Never put personal data in issues, comments or summaries: no interviewee names, no identifying quotes, no links to recordings or raw data.
- Never create milestones. The team creates them.
- Never suggest new fields, columns, labels, rules or automation. Suggest removing what nobody uses instead.
- Never send anything outside the repository, such as email, chat or a customer portal. Produce drafts that a person reviews and sends.
- Never edit `.github/` or `templates/` unless asked. The PR template stays in `templates/dev-repo/`, never in `.github/`.
- Never work around a permission error. Say what access is missing.

## Skills

Step-by-step instructions for recurring tasks live in `.claude/skills/`. Claude Code and GitHub Copilot load them automatically. In other tools, ask the agent to read and follow the file.

| Task | Skill |
| --- | --- |
| Turn a loose belief into a good card, challenge it, suggest a test and create the issue | `.claude/skills/writing-assumptions/SKILL.md` |
| Prepare the weekly meeting (ukesmøtet) | `.claude/skills/preparing-weekly-meeting/SKILL.md` |
| Summarize what the team learned (læringsbrev) | `.claude/skills/summarizing-learnings/SKILL.md` |

## In the template itself

If `isTemplate` is `true`, this is the template and there are no cards. Change files only. Never create issues, milestones or projects here, never add customer or personal data, and keep examples fictional. Test changes to the script in a separate test repository.
