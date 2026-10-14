---
name: preparing-weekly-meeting
description: Reviews the assumption board (antakelsestavle) read-only against the team's agreements and drafts a short agenda for the weekly meeting (ukesmøtet), covering passed Oppfølging dates, cards labelled trenger-mer-research, new decisions, room in the columns and cleanup. Use when someone asks to prepare the weekly meeting, to review or check the board, or what on the board needs attention. Never changes anything.
---

# Preparing the weekly meeting

Draft a short agenda from the board, so the meeting spends its time on what needs a conversation. Read only and change nothing. Everything the team reads is in Norwegian bokmål. Follow the boundaries in `AGENTS.md`.

## Workflow

Copy this checklist and track progress:

```
- [ ] 1. Fetch cards, fields and today's date
- [ ] 2. Run the checks
- [ ] 3. Draft the agenda
- [ ] 4. Review the draft
```

**1. Fetch.** Find the project number with `gh repo view --json projectsV2`, then:

```bash
gh issue list --label antakelse --state all --limit 500 \
  --json number,title,state,closedAt,updatedAt,labels,milestone,url,body,projectItems
gh project item-list <number> --owner <owner> --format json --limit 500
gh api 'repos/{owner}/{repo}/milestones' --jq '.[] | {title, due_on}'
date +%F
```

**2. Run the checks.** The agreements are in `docs/HVORDAN-VI-JOBBER.md`, section «Syv avtaler».

| Check | Source in HVORDAN-VI-JOBBER.md |
| --- | --- |
| Open cards, and Bets, with Oppfølging today or earlier | Agreement 5; «Når en Bet skal følges opp» |
| Cards labelled `trenger-mer-research` | «Når en test ikke gir svar» |
| Cards closed in the last 7 days, with their Beslutning | Agreement 6 |
| Cards in *Under discovery* (max 3) and *Neste opp* (max 5, labelled cards included) | Agreement 4 and the column limits |
| Cards in *Under discovery* not updated for more than two weeks | Agreement 4 |
| Cards in *Neste opp* or *Under discovery* without *Vi har rett hvis…* | Agreement 3 |
| Open cards without Oppfølging | Agreement 5 |
| Open cards without a learning milestone, if the repo has milestones | «Læringsmilepæler» |
| Closed cards without a filled-in *Beslutning og innsikt*, without Basis, or Bets without a measurement | Agreement 6 |
| Backlog size (roughly 15–40 is the agreement) and likely duplicates | Agreement 7 |
| Blocked cards in *Under discovery*, with GitHub CLI 2.94.0 or newer: `gh issue view <number> --json blockedBy` | «Avhengigheter mellom kort» |

gh does not show when a card moved between columns. Use `updatedAt` as a signal, and say it is an estimate. If there is room in the columns and the team uses Viktighet and Sikkerhet, point to Backlog cards with Høy viktighet and Lav sikkerhet as candidates.

**3. Draft the agenda** in this order, which follows the weekly routine in `docs/HVORDAN-VI-JOBBER.md`. Skip empty items, and use one line per card:

```markdown
**Ukesmøte <dato>**

1. **Passert oppfølging:** #12 «Vi tror at …» (Neste opp, <dato>): ny dato, test eller slett?
2. **Trenger mer research:** #17 «Vi tror at …»: skarpere test, Bet eller Ikke sant?
3. **Nye beslutninger siden sist:** #8 Ikke sant, #9 Validert.
4. **Plass til nye kort:** Under discovery 2 av 3, Neste opp 5 av 5. Kandidater: #21, #23.
5. **Rydding:** 3 åpne kort uten oppfølgingsdato (#14, #15, #19). 2 åpne kort uten milepæl (#22, #24). Mulig duplikat: #14 og #21.
```

If there is little to discuss, say so instead: «Lite å ta opp denne uka. Vurder et kort møte, eller å hoppe over det.»

**4. Review the draft.** Every card is linked, every finding is a question to the team, and nothing breaks the rules below.

## Always

- Follow the order of the weekly routine.
- Link every card with its number and title.
- Phrase findings as questions to the team, for example «ny dato, test eller slett?».
- Say when something is an estimate.
- Keep the agenda to one screen.

## Never

- Never change anything: no new cards, comments, labels, dates, fields or statuses.
- Never prioritize for the team or pick which cards to pull. Point to candidates and let the team choose.
- Never produce statistics per person or single anyone out.
- Never suggest new rules, fields or routines.
- Never paste full card text. One line per card.
- Never pad the agenda to have something to discuss.
