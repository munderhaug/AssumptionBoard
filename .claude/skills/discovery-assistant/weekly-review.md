# Prepare the review

Draft a short agenda for the weekly review from the board, so the meeting spends its time on what needs a conversation. Read only. Change nothing.

## Checklist

```
- [ ] 1. Read the board
- [ ] 2. Find what needs attention
- [ ] 3. Draft the agenda
- [ ] 4. Check the draft
```

**1. Read the board** as in `SKILL.md`, and the milestones with the command in `AGENTS.md`. «The period» is the last 7 days, unless the person gives the date of the last review or another period.

- Use `closedAt` for cards closed in the period.
- `updatedAt` also moves on comments and edits, and `gh project item-list` shows no date for Status or Outcome. Other changes in the period are therefore estimates: say so.
- For cards updated in the period, read the comments with `gh issue view <number> --comments`.

**2. Find what needs attention.** The review questions are in `docs/working-model.md`, «The weekly review». The team moves cards to *What we currently know* in the review, so the candidates are open cards.

| Look for | Why | Agenda item |
| --- | --- | --- |
| Open cards whose *Current understanding* section is filled in, except cards reopened in the period | Candidates for *What we currently know*. The team asks the three questions in «The rule», agrees on the title, sets Outcome for a belief, and moves the card | 1 and 2 |
| Cards closed in the period (`stateReason` COMPLETED) | Has the team agreed on each? If not, ask the three questions now, or reopen | 1 |
| Cards closed as completed whose title is still a question or starts with «We believe» | The understanding has not been written as the title | 1 |
| Prioritized or Investigating cards past their Next checkpoint | Can they be concluded, continued or stopped? | 2 |
| Open cards in *What we need to know* or *What we think we know* whose *Informed bet* section is filled in | Candidate bets: are all four parts there? If the team moves the card, it also sets the revisit date as Next checkpoint. The team decides | 2 |
| *Informed bet* cards updated in the period (`updatedAt`, an estimate) | Bets decided between reviews: are all four parts there, and is the revisit date set as Next checkpoint? | 2 |
| Informed bets past their Next checkpoint or revisit date | Keep, investigate or conclude? | 2 |
| Cards reopened in the period (`stateReason` REOPENED, `updatedAt` in the period, an estimate) | What challenged the understanding? Is the card in the state that fits, does its title read as a belief or question again, are Outcome and *Current understanding* cleared? | 3 |
| Comments in the period that question a card, and drafted understandings that conflict with another card | Take them up, for example from a stakeholder. Surface conflicts, never reconcile them | 3 |
| Outcome *Did not hold* or *Refined* set in the period | Changed understanding, worth telling stakeholders | 3 and 7 |
| Beliefs (label `belief`) still in *What we need to know* | Move them to *What we think we know* | 4 |
| Issues with neither the `question` nor the `belief` label, and draft items in `gh project item-list` (`content.type` DraftIssue) | Not a card yet: create it from a form | 4 |
| Cards closed as duplicate (`stateReason` DUPLICATE) | Not archived, so they show as knowledge. Reopen, remove the milestone, and close as not planned | 4 |
| Milestones due within two weeks, and open cards other than informed bets on a closed milestone | Is the learning objective met? The team decides | 4 |
| More than three cards in Investigating | The limit is three | 4 |
| Prioritized or Investigating cards without assignees, a Next checkpoint or a criterion | Committed learning needs people, a checkpoint and a criterion agreed before it starts | 5 |
| *Decisions informed* on the cards above | Which decisions are affected? | 6 |

**3. Draft the agenda** in this order, one line per card, each card linked:

```markdown
**Weekly review <date>**

1. **What we learned:** [#18](<url>) «<title>»: *What we found* is drafted. [#12](<url>) «<title>» was closed on <date>: agreed in a review?
2. **Ready to conclude or revisit?** [#18](<url>): the three questions, the new title, Outcome. [#20](<url>) «<title>» (Investigating, checkpoint <date> passed). [#9](<url>) «<title>» (Informed bet, revisit <date> passed)
3. **Changed understanding:** [#7](<url>) «<title>» was reopened. A comment on [#15](<url>) questions the scope
4. **What matters next:** <milestones due> · Investigating 2 of 3 · New cards to sort: [#21](<url>), [#22](<url>)
5. **Missing people, checkpoints or criterion:** [#19](<url>)
6. **Decisions affected:** [#18](<url>) informs org/app#456
7. **For stakeholders:** [#16](<url>) «<title>» (Did not hold)
```

Skip empty items. If little has happened, say so: «Little to discuss this week. Consider a short review.»

**4. Check the draft.** Every card is linked, every item is phrased as a question or a fact from the board, and nothing is a judgement on the team's behalf.

## Never

- Never change anything: no cards, comments, fields, states or labels.
- Never pick which cards to prioritize. Point to what is waiting and let the team choose.
- Never produce statistics per person or single anyone out.
- Never suggest new rules, fields or routines.
