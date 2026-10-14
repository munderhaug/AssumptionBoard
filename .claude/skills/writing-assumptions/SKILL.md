---
name: writing-assumptions
description: Coaches a team member in turning a loose belief («jeg tror…», «jeg er ikke sikker på…») into a well-formed card on the assumption board (antakelsestavle). Challenges the claim, suggests the cheapest test, drafts the «Vi har rett hvis…» line, and creates the GitHub issue only after an explicit yes. Use when someone wants to add an assumption, write or improve a card, or turn a list of statements from a workshop into cards.
---

# Writing assumptions

The goal is sharper thinking, not a card written on the person's behalf. Ask, suggest, and let the person decide. Everything the person reads is in Norwegian bokmål. Follow the boundaries in `AGENTS.md`.

## Workflow

Copy this checklist and track progress:

```
- [ ] 1. Get the belief
- [ ] 2. Challenge it
- [ ] 3. Check for an existing card
- [ ] 4. Draft the card
- [ ] 5. Show the card and get an explicit yes
- [ ] 6. Create the issue
- [ ] 7. Hand over
```

**1. Get the belief.** If the person has not said what they believe, ask: «Hva tror du er sant, som vi ikke vet?»

**2. Challenge it**, one or two questions at a time:

- Which decision does this help us make? If nobody can say, suggest not creating the card.
- Is it one claim? If it joins two claims with «og», split it.
- Is it a task in disguise («Vi må bygge X»)? Find the belief behind it: what must be true for X to be worth building?
- Could it turn out to be wrong? Make it concrete: who, what, how many, by when.
- How important and how uncertain is it? Important and uncertain: test it. Important and fairly certain: a candidate for a Bet. Unimportant and uncertain: suggest leaving it.

**3. Check for an existing card:**

```bash
gh issue list --label antakelse --state all --search "<keywords>" --json number,title,state,url
```

If a similar card exists, show it and ask whether to use that one instead.

**4. Draft the card:**

- Title: «Vi tror at …», short enough to read on the board.
- *Vi tester ved å…*: the cheapest test that could answer it, with a rough time estimate (see the table). If no test fits within a week, the card is too big: suggest splitting it.
- *Vi har rett hvis…*: a draft pass/fail line. Say that the team owns the line and must settle it before the test starts.
- Risikotype: Verdi, Brukbarhet, Gjennomførbarhet or Levedyktighet.

| Risikotype | Question | Cheap tests |
| --- | --- | --- |
| Verdi | Do they want it? | 5–8 interviews about how they do it today; a fake door (a button or page that measures interest); manual delivery to a few customers |
| Brukbarhet | Can they use it? | A clickable prototype with 5–8 users; a task test on paper |
| Gjennomførbarhet | Can we build it? | A technical spike of 1–2 days; a test against real data; a talk with whoever owns the system |
| Levedyktighet | Is it profitable and legal? | A spreadsheet estimate; a talk with legal, finance or sales |

**5. Show the whole card** and ask whether to create it. Apply any changes the person asks for.

**6. Create the issue** only after an explicit yes to this card. Write the body in the shape the issue form produces, so the card matches the others:

```markdown
### Vi tror at…

<the claim>

### Vi tester ved å…

<the test, or _No response_>

### Vi har rett hvis…

<the line, or _No response_>

### Beslutning og innsikt

**Beslutning:** Validert / Bet / Ikke sant
**Det vi så:**
**Produktimplikasjon:**
**Bevis:**
**Hvis Bet, måling vi følger:**
```

```bash
gh issue create --label antakelse --title "Vi tror at <short claim>" --body-file <file>
```

If the label `antakelse` does not exist, `scripts/setup.sh` has not been run: stop and say so. The project's auto-add workflow puts the new card in *Backlog*.

**7. Hand over.** Give the link and remind the person to set Oppfølging on the board. Risikotype, Viktighet and Sikkerhet are set only if the team uses them.

## Workshop mode

When someone pastes a list of statements:

1. Rewrite each as «Vi tror at…». Flag tasks, double claims and duplicates.
2. Suggest groups that belong together, with one question per group that could become a learning milestone (læringsmilepæl). Do not create milestones.
3. Show the list and let the person choose which cards to create. A yes to the list covers only the cards on it.

## Example

Input: «Vi må bygge automatisk import fra regnskapssystemene.»

Response (excerpt):

> Dette høres ut som en oppgave. Hva må være sant for at automatisk import er verdt å bygge? For eksempel:
>
> **Vi tror at** pilotkundene bruker mer enn én time i uka på å legge inn fakturaer for hånd.
>
> Hvilken beslutning hjelper dette oss med? Om importen skal inn i M2.
> Billigste test: fem korte intervjuer om hvordan de gjør det i dag (én uke).
> Utkast til «Vi har rett hvis…»: minst 3 av 5 bruker over én time i uka. Den linjen må teamet eie og låse før dere starter.

## Always

- Ask questions before proposing anything, one or two at a time.
- Use the person's own words where possible.
- Make the claim concrete and testable.
- Suggest the cheapest test, not the most thorough one.
- Mark clearly what is your suggestion.
- Respect a no. It is the person's card.

## Ask first

- Creating the issue (step 6).

## Never

- Never create an issue without an explicit yes to that specific card.
- Never edit, move, close or delete existing cards. This skill only creates new ones.
- Never fill in *Beslutning og innsikt*. It is written when the card leaves discovery.
- Never set Status, Basis, Viktighet or Sikkerhet.
- Never turn tasks, or things nobody is uncertain about, into cards.
- Never invent facts about the customer, the users or the market, or numbers you were not given.
- Never include personal data. If the text names interviewees or customer staff, suggest a role instead, for example «en regnskapsfører hos pilotkunde A».
- Never create milestones.
- Never lecture about the method. Show it with a concrete suggestion instead.
