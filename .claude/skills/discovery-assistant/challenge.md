# Challenge

Before a card becomes *What we currently know* or an *Informed bet*, question it so the team can decide well in the weekly review. You never approve it. A challenged card is not an approved card. If the card has already been moved, challenge it the same way: the team can confirm it in the review or reopen it.

## Checklist

```
- [ ] 1. Read the card and its board fields
- [ ] 2. Read the evidence before the conclusion
- [ ] 3. Ask the questions that apply
- [ ] 4. Write the challenge
```

**1. Read the card.**

```bash
gh issue view <number> --json number,title,body,comments,state,stateReason,labels,assignees,milestone,url,projectItems
```

Take Status from `projectItems`. Outcome and Next checkpoint are not in it: take them from `gh project item-list <project-number> --owner <owner> --format json --limit 500`, with the project number from `gh repo view --json projectsV2`.

**2. Read the evidence first.** Read the criterion («What would be enough…» or «What evidence would…»), *What we found* and the linked sources before you read *So this means* and the proposed title. Form your own view of what the evidence shows, so the team's conclusion does not steer your reading. Read the comments too: a stakeholder's objection to the card is usually there. If a linked source is a whole board or a folder rather than a specific frame or document, or you cannot open it, say so.

If a linked source contains raw notes, recordings or anything that identifies a person, stop reading and ask for a link to a summary.

**3. Ask the questions that apply.**

For *What we currently know*:

| Check | What to look for |
| --- | --- |
| Supported | Does *What we found* actually show what the statement claims? |
| Criterion | Is there a criterion, and does *What we found* meet it? gh does not show when the criterion was written. If it matters, ask the team or point to the edit history on the issue page. Do not state it yourself. |
| Scope | Who and what does the evidence represent: which roles, scenarios, systems, how many, over what time? Is the wording no broader than that? |
| Applies to | Does the card say where the understanding may not apply? |
| Counterexamples | Do the sources or other cards contain cases that do not fit? Are conflicts surfaced rather than smoothed over? |
| Say or do | Is a claim about behaviour based on what people did, or only on what they said they would do? |
| Strong enough | Is it strong enough for the decision it is meant to inform now? |
| Knowledge, not coverage | Is it about users, work, domain, product or technology, not about the research itself («we interviewed…»)? |
| Title | Does the title state the understanding, with its basis in parentheses, not the original question or belief? |
| Outcome | For a belief: does Outcome (Supported, Refined, Did not hold) match what was found? If the title has been rewritten, the original belief is in the title history, read as in `learning-update.md`. A question has no Outcome. |
| Sources | Do the links point to specific summaries with dates? Do the numbers in the card appear there? If a linked summary was made by an AI tool, has someone checked it against the notes or recordings? Ask; do not open them. |

For *Informed bet*:

| Check | What to look for |
| --- | --- |
| All four parts | *We proceed with*, *Why it is reasonable now*, *If we are wrong* and *Revisit when* are filled in. |
| Not disguised knowledge | Nothing in the card presents the bet as evidence-backed. |
| Revisit | The date or trigger is concrete enough that someone will notice it, and a revisit date is also set as Next checkpoint. |
| Delivery | No delivery issue should be blocked by a bet: the bet is the decision to proceed. Check with `gh issue view <number> --json blocking` (GitHub CLI 2.94.0 or newer, as in `docs/setup.md` step 7). If gh does not know the field, say so and ask the team to check the card's *Relationships*. |

**4. Write the challenge** in this shape. One line per check that needs attention, quoting the card word for word. End with one line naming the checks that raised no question.

```markdown
**Challenge of #12 «<title>»**
These are questions for the team, not an approval. The team decides. If it has not yet answered the three questions in «The rule» for this card, answer them before reading on.

- **Scope:** the title says «clients upload invoices themselves». *What we found* covers 8 pilot clients over one week. Should the title say so?
- **Say or do:** «would prefer to upload» describes an intention. Did anyone actually upload?
- **Sources:** the link goes to a whole Miro board. Which frame holds the summary?

No questions on: Outcome against *What we found*, and *Applies to* naming what was not tested.
```

A challenge is not a check the card passed. Never cite it as support in a card or a learning update.

## When someone pushes back

| They say | Answer |
| --- | --- |
| «It is obviously true» | Then the evidence will show it. Which part of *What we found* shows it? |
| «We need it for the demo tomorrow» | An informed bet can be shown in a demo just as well, as long as it is called a bet. |
| «We learned something else important» | Good. Make it a new card. It is not what this card investigated. |
| «It is close enough» | Put what the criterion asked for next to what was found. If it falls short, Did not hold, Refined or Inconclusive may be the honest outcome. The team decides. |

## Never

- Never approve, score or certify a card, or give your own verdict.
- Never change the card, its fields or its state as part of the challenge, and never close it. If the person then asks for a change, it is a write: follow «Ask first» in `AGENTS.md`.
- Never write the *Current understanding* or *Informed bet* sections for the team unless asked. If asked, first ask the person, one question at a time, what they found (or what the team proceeds with, why it is reasonable now and what happens if it is wrong), in their own words. Then tighten only that wording, using the card and its sources, and mark the draft as yours.
- Never read sources beyond the board and the links on the card, and never quote personal data.
