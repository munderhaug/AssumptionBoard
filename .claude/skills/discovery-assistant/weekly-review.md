# Prepare the review

Draft a short agenda for the weekly review from the board, so the meeting spends its time on what needs a conversation. Read only. Change nothing.

## Checklist

```
- [ ] 1. Read the board
- [ ] 2. Find what needs attention
- [ ] 3. Draft the agenda
- [ ] 4. Check the draft
```

**1. Read the board** as in `SKILL.md`. «Since the last review» means the last 7 days unless the person says otherwise. `updatedAt` is the closest signal gh gives for when a card changed, so say when something is an estimate.

**2. Find what needs attention.** The review questions are in `docs/working-model.md`, «The weekly review».

| Look for | Why |
| --- | --- |
| Cards closed in the period (closed as completed), with their titles | Read aloud in the review: is each statement supported, no broader than the evidence, and explainable to an outsider? |
| Cards closed in the period whose title still is a question or starts with «We believe» | The understanding has not been written as the title |
| Investigating cards past their Next checkpoint | Can they be concluded? |
| Prioritized or Investigating cards without assignees or a Next checkpoint | Committed learning needs people and a checkpoint |
| More than three cards in Investigating | The limit is three |
| Investigating or Prioritized cards whose criterion section is empty | The criterion is agreed before investigating |
| Informed bets past their revisit date or Next checkpoint | Revisit, test or keep? |
| New Outcome *Did not hold* or *Refined* in the period | Worth telling stakeholders |
| Beliefs (label `belief`) still in *What we need to know* | Move them to *What we think we know* |
| Issues with neither the `question` nor the `belief` label | Not a card yet |
| Open cards on a closed milestone, and milestones due within two weeks | Is the learning objective met? |

**3. Draft the agenda** in this order, one line per card, each card linked:

```markdown
**Weekly review <date>**

1. **What we learned:** #12 «<title>» (Supported), #15 «<title>» (Did not hold). Is each supported, no broader than the evidence, and explainable to an outsider?
2. **Ready to conclude?** #18 «<title>» (Investigating, checkpoint <date> passed)
3. **Changed understanding:** #9 «<title>» was refined
4. **What matters next:** <upcoming decisions or milestones> · Investigating 2 of 3 · New cards to sort: #21, #22
5. **Missing people or checkpoints:** #19
6. **Decisions affected:** #12 informs org/app#456
7. **For stakeholders:** #12, #15
```

Skip empty items. If little has happened, say so: «Little to discuss this week. Consider a short review.»

**4. Check the draft.** Every card is linked, every item is phrased as a question or a fact from the board, and nothing is a judgement on the team's behalf.

## Never

- Never change anything: no cards, comments, fields, states or labels.
- Never pick which cards to prioritize. Point to what is waiting and let the team choose.
- Never produce statistics per person or single anyone out.
- Never suggest new rules, fields or routines.
