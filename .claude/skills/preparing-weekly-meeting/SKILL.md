---
name: preparing-weekly-meeting
description: Reviews the assumption board (antakelsestavle) read-only against the team's agreements and drafts a short agenda for the weekly meeting (ukesmøtet), covering passed Oppfølging and stop dates, cards labelled trenger-mer-research, new decisions and insights, room in the columns, the mix of testing and exploring, and cleanup. Use when someone asks to prepare the weekly meeting («forbered ukesmøtet», «hva bør vi ta opp»), to review or check the board («se over tavla»), or what on the board needs attention. Never changes anything.
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

**1. Fetch.** Every issue is a card, and the label tells the type: `antakelse` or `utforsking`. Find the project number with `gh repo view --json projectsV2`, then:

```bash
gh issue list --state all --limit 500 \
  --json number,title,state,createdAt,closedAt,updatedAt,labels,milestone,url,body,projectItems
gh project item-list <number> --owner <owner> --format json --limit 500
gh api 'repos/{owner}/{repo}/milestones' --jq '.[] | {title, due_on}'
date +%F
```

**2. Run the checks.** The agreements are in `docs/HVORDAN-VI-JOBBER.md`, section «Fem avtaler».

| Check | Source in HVORDAN-VI-JOBBER.md |
| --- | --- |
| Open cards, and Bets that have a date, with Oppfølging today or earlier. For an utforsking under discovery, the date is its stop date | Agreement 4; «Bets»; «Utforske og teste» |
| Cards labelled `trenger-mer-research` | «Når en test ikke gir svar» |
| Cards closed in the last 7 days: antakelser with their Beslutning, utforskinger with their new cards | Agreement 5 |
| Cards in *Under discovery* (max 3, both types together) and *Neste opp* (max 5, labelled cards included), with how many of each type | Agreement 3 |
| Cards in *Under discovery* not updated for more than two weeks | Agreement 3 |
| Antakelser in *Neste opp* or *Under discovery* without *Vi har rett hvis…*, and utforskinger there without *Vi er ferdige når…* | Agreement 2 |
| Open cards without Oppfølging | Agreement 4 |
| Open cards without a learning milestone, if the repo has milestones | «Læringsmilepæler» |
| Closed antakelser without a filled-in *Beslutning og innsikt*, and Validert or Bet cards without Basis (Ikke sant has no Basis). Closed utforskinger without a filled-in *Innsikt*, or without new cards and no reason given | Agreement 5 |
| On a board older than six weeks: no utforsking created or closed in the last six weeks. On any board: utforskinger closed without new cards and no reason given | «Utforske og teste», «Tegn på ubalanse» |
| Backlog size (roughly 15–40) and likely duplicates | «Rutiner», the weekly row |
| Cards in *Klar for implementering* not updated for more than four weeks: are they delivered? | «Rutiner», the weekly row |
| Blocked cards in *Under discovery*, with GitHub CLI 2.94.0 or newer: `gh issue view <number> --json blockedBy` | «Avhengigheter mellom kort» |

gh does not show when a card moved between columns. Use `updatedAt` as a signal, and say it is an estimate. The balance between testing and exploring is a signal, not a rule: mention it once, as a question, and only when the board shows it plainly. If there is room in the columns and the team uses Viktighet and Sikkerhet, point to Backlog antakelser with Høy viktighet and Lav sikkerhet, and utforskinger with Høy viktighet, as candidates. Without those fields, only say how much room there is and let the team choose. Never list Bets as candidates for testing. A conclusion section with only the prefilled labels counts as not filled in.

**3. Draft the agenda** in this order, which follows the weekly routine in `docs/HVORDAN-VI-JOBBER.md`. Skip empty items, and use one line per card:

```markdown
**Ukesmøte <dato>**

1. **Passert oppfølging:**
   - #12 «Vi tror at …» (Neste opp, <dato>): ny dato, test eller slett?
   - #15 «Vi vil forstå …» (Under discovery, stoppdato <dato>): skrive innsikten nå? Trengs en ny, smalere utforsking?
   - #5 «Vi tror at …» (Bet, <dato>): holder det dere fulgte med på, eller ny dato?
2. **Trenger mer research:** #17 «Vi tror at …»: skarpere test, utforske først, dele kortet, Bet eller Ikke sant?
3. **Nye beslutninger og ny innsikt siden sist:** #8 Ikke sant, #9 Bet, #7 Innsikt (ga #21 og #22).
4. **Plass til nye kort:** Under discovery 2 av 3 (én antakelse, én utforsking), Neste opp 4 av 5 (tre antakelser, én utforsking).
5. **Rydding:** 3 åpne kort uten oppfølgingsdato (#14, #16, #19). 2 åpne kort uten milepæl (#22, #24). Mulig duplikat: #14 og #20.
```

When the board shows an imbalance, add one question to item 4, for example: «Ingen utforskinger på seks uker: er det noe dere ikke forstår godt nok til å tro noe om?»

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
- Never decide the balance between testing and exploring. Show the mix and let the team choose.
- Never produce statistics per person or single anyone out.
- Never suggest new rules, fields or routines.
- Never paste full card text. One line per card.
- Never pad the agenda to have something to discuss.
