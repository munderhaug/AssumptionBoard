---
name: reviewing-decisions
description: Reviews one card on the assumption board (antakelsestavle) before it leaves discovery. For an antakelse, compares «Det vi så» with the «Vi har rett hvis…» line and the linked evidence, and asks whether a Validert is really a Bet, whether something beyond the line is claimed as a result, and whether the product implication claims more than was tested. For an utforsking, asks whether the Innsikt follows from what was seen, whether it claims anything as tested, and whether the new cards exist. Read-only. Asks questions and never approves. Use when someone asks to review, check or challenge a decision, an insight or a card about to be closed («se over beslutningen», «er dette validert?», «kan vi lukke kortet?», «se over innsikten»), even when the person is sure the card is done.
---

# Reviewing a decision

The review prepares a conversation in the team. It never approves a decision, and a reviewed card is not an approved card. Everything the team reads is in Norwegian bokmål. Follow the boundaries in `AGENTS.md`, including how to read evidence in Miro and Figma.

## Workflow

Copy this checklist and track progress:

```
- [ ] 1. Fetch the card
- [ ] 2. Judge the evidence against the line, before reading the decision
- [ ] 3. Run the checks
- [ ] 4. Write the questions
- [ ] 5. Review the draft
```

**1. Fetch the card** and its board fields. The label tells the type: `antakelse` or `utforsking`. Find the project number with `gh repo view --json projectsV2`.

```bash
gh issue view <card number> --json number,title,body,state,labels,milestone,url,projectItems
gh project item-list <project number> --owner <owner> --format json --limit 500
```

Take Status, Basis and Oppfølging for the card from the board fields.

**2. Judge the evidence before the conclusion.** For an antakelse, read «Vi har rett hvis…», *Det vi så* and the linked evidence, and decide for yourself whether the line was met. Only then read *Beslutning* and *Produktimplikasjon*. For an utforsking, read *Det vi så* and the linked evidence before *Nye kort* and anything that reads like a conclusion. This keeps the team's conclusion from steering your reading.

**3. Run the checks** for the card's type. Give each check one status: **Spørsmål**, **OK** or **Kan ikke vurderes**, for example when the evidence cannot be read.

Antakelse:

| Check | What to look for |
| --- | --- |
| The line can fail | «Vi har rett hvis…» names what is measured, a threshold and who. «Vi lærer mye» cannot fail. |
| Same unit | *Det vi så* reports what the line measures, as «x av N», not a percentage of a small sample or a general impression. |
| The line is met | Compare the numbers. Close is not met: 4 av 8 does not meet «minst 5 av 8». |
| Validert rests on a test | A Validert needs a test that was run. If it rests only on what people said they would do, on opinions or on AI output, it is closer to a Bet. |
| Nothing beyond the line | What the team noticed outside the line is a new question or a new card, not a result. |
| The implication fits the test | *Produktimplikasjon* does not claim more than was tested, such as more users, other segments or more features. |
| Evidence can be found | *Bevis* links to a specific frame or file, with a date, and the numbers in *Det vi så* appear there. |
| Bet | A Bet has a measurement and an Oppfølging date. |
| Basis and Status match | Validert has Basis Validert, a Bet has Basis Bet, and Ikke sant is in the column *Ikke sant*. |

Utforsking:

| Check | What to look for |
| --- | --- |
| The stop rule was set | «Vi er ferdige når…» is filled in, and the utforsking stopped there or earlier. If it ran past it, ask why. |
| What was seen | *Det vi så* reports what people did, with counts such as «i 5 av 6 samtaler». Not what people said they would do, a general impression or AI output. |
| Nothing claimed as tested | *Innsikt* does not call anything validated or decided. «De vil betale» is a belief to test: a new antakelse, or a Bet. |
| The new cards exist | Each card under *Nye kort* exists and says «Kommer fra #<number>». Check with `gh issue view <number> --json number,title,body,url`. If there are no new cards, *Innsikt* says why. |
| Evidence can be found | *Bevis* links to a summary, with a date, and the counts in *Det vi så* appear there. No raw notes, recordings or names. |
| Status | A closed utforsking is in the column *Innsikt*. An utforsking has no Basis. |

**4. Write the questions** in this shape. Use one line per check that is not OK, and quote the card word for word. List the OK checks in one line at the end.

```markdown
**Gjennomgang av #12 «Vi tror at …»**
Dette er spørsmål til teamet, ikke en godkjenning. Teamet bestemmer.

- **Er linja nådd?** Linja sier «minst 5 av 8 …». *Det vi så* sier «4 av 8 …». Hva gjør at dette er Validert, og ikke Bet eller Ikke sant?
- **Utenfor linja:** «alle likte designet» er ikke det linja målte. Skal det bli et nytt kort?
- **Bevis:** kan ikke vurderes. Lenken går til hele tavla, ikke til en ramme.

OK: linja kan feile, og Basis og Status stemmer.
```

For an utforsking, use the same shape. For example:

```markdown
- **Testet?** *Innsikt* sier «de vil betale». En utforsking tester ikke. Skal det bli en antakelse eller en Bet?
```

**5. Review the draft.** Every question quotes the card or names what is missing. There is no verdict, score or approval anywhere. Nothing from the evidence that identifies a person is quoted.

## When someone pushes back

| What the person says | How to answer |
| --- | --- |
| «Det er åpenbart validert» | Then the line will show it. Ask which part of *Det vi så* meets it. |
| «4 av 8 er nesten 5 av 8» | The line was set before the test so that close does not count. Bet and Ikke sant are honest outcomes too. |
| «Vi lærte noe annet viktig» | Good. Suggest writing it as a new card. It is not a result of this test. |
| «Demoen er i morgen» | The review takes minutes, and a Bet with a measurement can be shown in a demo just as well. |
| «Vi vet jo nå at de vil betale» | The utforsking gave the team a belief, not a test. Write it as an antakelse, or make it a Bet with a measurement. |
| «Vi trenger to uker til» | The stop rule is there so the team writes down what it saw. Write the Innsikt now, and make a new, narrower utforsking if more is needed. |

## Always

- Judge the evidence before you read the team's conclusion.
- Quote the card word for word in every question, or name what is missing.
- Say «kan ikke vurderes» instead of guessing.
- Phrase every finding as a question to the team.
- Keep the review to one screen.

## Never

- Never approve, grade or score a decision, and never give your own verdict on it.
- Never change the card: no edits, comments, labels, fields, Basis or Status, and never close or reopen it.
- Never write *Beslutning og innsikt* or *Innsikt* for the team.
- Never read beyond the evidence the card links to, and never quote personal data from it.
- Never present your reading of the evidence as the team's conclusion.
- Never treat the review as a gate. It runs only when someone asks for it.
