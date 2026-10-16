# Challenge

Before a card becomes *What we currently know* or an *Informed bet*, question it so the team can decide well. You never approve it. A challenged card is not an approved card.

## Checklist

```
- [ ] 1. Read the card and its board fields
- [ ] 2. Read the evidence before the conclusion
- [ ] 3. Ask the questions that apply
- [ ] 4. Write the challenge
```

**1. Read the card.**

```bash
gh issue view <number> --json number,title,body,state,stateReason,labels,assignees,milestone,url,projectItems
```

Take Status, Outcome and Next checkpoint from `projectItems`, or from `gh project item-list` if needed.

**2. Read the evidence first.** Read the criterion («What would be enough…» or «What evidence would…»), *What we found* and the linked sources before you read *So this means* and the proposed title. Form your own view of what the evidence shows, so the team's conclusion does not steer your reading. If a linked source is a whole board or a folder rather than a specific frame or document, or you cannot open it, say so.

If a linked source contains raw notes, recordings or anything that identifies a person, stop reading and ask for a link to a summary.

**3. Ask the questions that apply.**

For *What we currently know*:

| Check | What to look for |
| --- | --- |
| Supported | Does *What we found* actually show what the statement claims? |
| Criterion | Was the criterion written before the investigation, and is it met? If it was written afterwards, or is missing, say so. |
| Scope | Who and what does the evidence represent: which roles, scenarios, systems, how many, over what time? Is the wording no broader than that? |
| Applies to | Does the card say where the understanding may not apply? |
| Counterexamples | Do the sources or other cards contain cases that do not fit? Are conflicts surfaced rather than smoothed over? |
| Say or do | Is a claim about behaviour based on what people did, or only on what they said they would do? |
| Strong enough | Is it strong enough for the decision it is meant to inform now? |
| Knowledge, not coverage | Is it about users, work, domain, product or technology, not about the research itself («we interviewed…»)? |
| Title | Does the title state the understanding, with its basis in parentheses, not the original question or belief? |
| Outcome | For a belief: does Outcome (Supported, Refined, Did not hold) match what was found? |
| Sources | Do the links point to specific summaries with dates? Do the numbers in the card appear there? |

For *Informed bet*:

| Check | What to look for |
| --- | --- |
| All four parts | *We proceed with*, *Why it is reasonable now*, *If we are wrong* and *Revisit when* are filled in. |
| Not disguised knowledge | Nothing in the card presents the bet as evidence-backed. |
| Revisit | The date or trigger is concrete enough that someone will notice it. |
| Delivery | No delivery issue is blocked by this card. A bet is the decision to proceed. |

**4. Write the challenge** in this shape. One line per check that needs attention, quoting the card word for word. List what looks fine in one line at the end.

```markdown
**Challenge of #12 «<title>»**
These are questions for the team, not an approval. The team decides.

- **Scope:** the title says «clients upload invoices themselves». *What we found* covers 8 users at pilot clients over one week. Should the title say so?
- **Say or do:** «would prefer to upload» describes an intention. Did anyone actually upload?
- **Sources:** the link goes to a whole Miro board. Which frame holds the summary?

Looks fine: the criterion was written before the trial, and the Outcome matches.
```

## When someone pushes back

| They say | Answer |
| --- | --- |
| «It is obviously true» | Then the evidence will show it. Which part of *What we found* shows it? |
| «We need it for the demo tomorrow» | An informed bet can be shown in a demo just as well, as long as it is called a bet. |
| «We learned something else important» | Good. Make it a new card. It is not what this card investigated. |
| «It is close enough» | The criterion was agreed before the investigation so that close would not count. Refined and Inconclusive are honest outcomes too. |

## Never

- Never approve, score or certify a card, or give your own verdict.
- Never change the card, its fields or its state. Never close it.
- Never write the *Current understanding* or *Informed bet* sections for the team unless asked. If asked, mark the draft as yours and use only what the card and its sources say.
- Never read beyond the sources the card links to, and never quote personal data.
