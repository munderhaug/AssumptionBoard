---
name: writing-cards
description: Helps a team member turn questions, ideas, features or a loose belief into well-formed cards on the assumption board (antakelsestavle), either an antakelse («Vi tror at…») when the team knows what it believes, or an utforsking («Vi vil forstå…») when it does not know enough yet. Covers product, design, technology and business, challenges each card, lets the team set the «Vi har rett hvis…» line or the stop rule, suggests the cheapest way to find out, and creates the issue only after an explicit yes. Use when someone wants to add a card («nytt kort», «legg til en antakelse», «vi må utforske …»), has something to find out about («hva må vi finne ut av», «vi skal bygge …», «hva forutsetter dette?», «hva antok vi da vi bygde …», «vi vet ikke hvordan …»), wants new cards from a finished exploration, wants to improve a card, or turns several statements into cards at once. Applies even when the card is already written.
---

# Writing cards

The goal is sharper thinking, not a card written on the person's behalf. You may suggest and draft, but the person stays in control: say briefly why you suggest something, and let the person decide. Everything the person reads is in Norwegian bokmål. Follow the boundaries in `AGENTS.md`.

There are two card types. The method is in `docs/HVORDAN-VI-JOBBER.md`, section «Utforske og teste».

| | Antakelse | Utforsking |
| --- | --- | --- |
| Label | `antakelse` | `utforsking` |
| Title | «Vi tror at …» | «Vi vil forstå …» |
| How | *Vi tester ved å…* | *Vi utforsker ved å…* |
| Written before it starts | *Vi har rett hvis…*: a line that could fail | *Vi er ferdige når…*: the stop rule |
| Written by the team at the end | *Beslutning og innsikt* | *Innsikt* |

## Workflow

Copy this checklist and track progress:

```
- [ ] 1. Find the starting point
- [ ] 2. Choose the type
- [ ] 3. Challenge it
- [ ] 4. Check for an existing card
- [ ] 5. Draft the card
- [ ] 6. Show the card and get an explicit yes
- [ ] 7. Create the issue
- [ ] 8. Check the result and hand over
```

**1. Find the starting point.**

- **A belief, or one question the team wants to understand:** go to step 2.
- **A question, an idea, a feature about to be built, something already built, or a delivery issue:** follow [from-questions.md](from-questions.md) first. For something already built, it follows «Det som allerede er bygd» in `docs/HVORDAN-VI-JOBBER.md`. It ends with at most three cards the person chose. Take each of them through steps 2–8.
- **A finished utforsking:** read it with `gh issue view <number> --json number,title,body,url`. Ask what the team believes now, after what it saw, and which of the questions under *Nye spørsmål* still matter. Take each one the person names through steps 2–8, and add «Kommer fra #<number>».
- **Nothing yet:** ask «Hva tror du er sant, som vi ikke vet?», or «Hva er det dere må finne ut av?»

**2. Choose the type.** Ask instead of deciding: «Vet dere nok til å si hva dere tror, eller må dere forstå mer først?» Say why you lean one way.

- If the team can write a «Vi har rett hvis…» line that could turn out wrong, it is an antakelse.
- If it cannot, because it does not know enough to believe anything yet, it is an utforsking.
- A yes/no question («Vil de betale?», «Vi vil forstå om …») usually hides a belief. Ask what the team thinks the answer is, and make that an antakelse.
- A question about how, why or what («Hvordan jobber de i dag?») is usually an utforsking.
- If someone on the team or at the customer can simply answer the question, suggest asking them instead of making a card.

**3. Challenge it**, one or two questions at a time. You may add your best guess so the person can correct it: «… Mitt gjett: … Stemmer det?»

For both types:

- Which decision does this help us make? If nobody can say, suggest not creating the card.
- Is it a task in disguise («Vi må bygge X», «Vi vil forstå systemet»)? Find what the team does not know behind it. If there are several things, use [from-questions.md](from-questions.md).

For an antakelse:

- Is it one claim? If it joins two claims with «og», split it.
- Could it turn out to be wrong? Make it concrete: who, what, how many, by when. Ask for the numbers instead of supplying them.
- How important and how uncertain is it? Important and uncertain: test it. Important and fairly certain: a candidate for a Bet. Unimportant and uncertain: suggest leaving it.

For an utforsking:

- Is it one question? If it asks two, split it.
- Is it narrow enough to stop within a couple of weeks? «Vi vil forstå kundene» is not.
- Would the answer change anything? If not, suggest leaving it.

**4. Check for an existing card** of either type:

```bash
gh issue list --state all --search "<keywords>" --json number,title,state,labels,url
```

If a similar card exists, show it and ask whether to use that one instead.

**5. Draft the card.**

For an antakelse:

- Title: «Vi tror at …», short enough to read on the board.
- *Vi tester ved å…*: the cheapest test that could answer it, with a rough time estimate (see the table). If no test fits within a week, the card is too big: suggest splitting it. Asking an AI what users think is not a test.
- *Vi har rett hvis…*: let the team set the threshold. Ask the question that sets it, for example «Hvor mange av de fem må … før dere ville bygget det?», and show the shape with the number left open: «minst _ av 5 …». Give a number only if the person asks for one, and mark it as your suggestion. The team settles the line before the test starts.
- Risikotype: Verdi, Brukbarhet, Gjennomførbarhet or Levedyktighet.

| Risikotype | Question | Cheap tests |
| --- | --- | --- |
| Verdi | Do they want it? | 5–8 interviews about how they did it last time; a fake door (a button or page that measures interest); manual delivery to a few customers |
| Brukbarhet | Can they use it? | A clickable prototype with 5–8 users; a task test on paper |
| Gjennomførbarhet | Can we build it? | A technical spike of 1–2 days; a test against real data; a talk with whoever owns the system |
| Levedyktighet | Is it profitable and legal? | A spreadsheet estimate; a talk with legal, finance or sales |

For an utforsking:

- Title: «Vi vil forstå …», one question, short enough to read on the board.
- *Vi vil forstå…*: the question, and the decision the answer helps with.
- *Vi utforsker ved å…*: the cheapest way to learn. Conversations about what people did last time («Fortell om sist du …»), watching someone at work, usage data, support requests, or a talk with whoever knows the system. Not what people say they would do, and never asking an AI.
- *Vi er ferdige når…*: let the team set the stop rule. Show the shape with the numbers left open: «etter _ samtaler eller _ uker, det som kommer først». Give numbers only if the person asks, and mark them as your suggestion.

For both, the learning milestone (læringsmilepæl) the card helps answer. List the open milestones with `gh api 'repos/{owner}/{repo}/milestones' --jq '.[] | {title, due_on, description}'`. If none fits, say so. If the person asks for a new one, draft it (title: what we must know; due date; description: the outcome it should lead to) and create it only after an explicit yes:

```bash
gh api 'repos/{owner}/{repo}/milestones' -f title="<what we must know>" \
  -f due_on="<YYYY-MM-DD>T23:59:59Z" -f description="<the outcome, and what it decides>"
```

**6. Show the whole card** and ask whether to create it. If the person asks for any change, make it, show the whole card again and ask again. «Ja, men …», «gjør det du mener er best» and no answer are not a yes.

**7. Create the issue** only after an explicit yes to the card exactly as last shown. Write the body in the shape the issue form produces, so the card matches the others. If the card comes from an utforsking, end the first section with «Kommer fra #<number>».

Antakelse:

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
**Hvis Bet, det vi følger med på (valgfritt):**
```

Utforsking:

```markdown
### Vi vil forstå…

<the question, and the decision it helps with>

### Vi utforsker ved å…

<the method, or _No response_>

### Vi er ferdige når…

<the stop rule, or _No response_>

### Innsikt

**Det vi så:**
**Nye kort:**
**Nye spørsmål:**
**Bevis:**
```

```bash
gh issue create --label <antakelse or utforsking> --title "<Vi tror at … or Vi vil forstå …>" \
  --body-file <file> --milestone "<milestone title>"   # leave out --milestone if no milestone was chosen
```

If the label does not exist, stop and say which label is missing. `scripts/setup.sh` creates the labels when a board is set up. A board set up before utforsking existed lacks that label, and someone on the team must add it.

**8. Check the result and hand over.**

```bash
gh issue view <number> --json url,labels,milestone,projectItems
```

Confirm that the card has the right label, the milestone you agreed on, and is on the board. If something did not happen, say exactly what. A card missing from the board usually means auto-add is off, or that its filter does not match the card's type (`docs/OPPSETT.md`, step 5). Someone must then add it by hand. Then give the link and remind the person to set Oppfølging on the board. If the team already knows the answer, such as a Bet, or something already built with evidence it can show, remind the person that the team fills in *Beslutning og innsikt*, sets Basis, closes the issue and moves the card (see «Bets» and «Det som allerede er bygd» in `docs/HVORDAN-VI-JOBBER.md`). Do not do it yourself. For an utforsking, that is the date it stops at the latest once it is under discovery. Risikotype is set only if the team uses it.

If the card came from an utforsking, remind the person to add its number under *Nye kort* on that utforsking. Do not edit the utforsking yourself.

If the starting point was a delivery issue and the new card is an antakelse, offer to mark the delivery issue as blocked by it, and do it only after an explicit yes. Never block a delivery issue by an utforsking: closing it would unblock delivery on untested insight. Say instead that the antakelser that come from the utforsking can block it later. This needs GitHub CLI 2.94.0 or newer:

```bash
gh issue edit <number> --repo <owner>/<dev-repo> --add-blocked-by <card url>
gh issue view <number> --repo <owner>/<dev-repo>   # shows «Blocked by» when it worked
```

If the link fails, say exactly what failed, and suggest *Relationships* in the issue's sidebar instead.

## Several statements at once

When someone pastes a list of statements:

1. Rewrite each as «Vi tror at…» or «Vi vil forstå…». Flag tasks, double claims, yes/no questions that hide a belief, and duplicates.
2. Suggest groups that belong together, and the existing learning milestone each group helps answer. Where no milestone fits, suggest one as a question we must be able to answer. Create it only if the person asks, after an explicit yes.
3. Show the list and let the person choose which cards to create. A yes to the list covers only the cards on it.

## Examples

Input: «Vi må bygge automatisk import fra regnskapssystemene.»

First response:

> Dette høres ut som en oppgave. Hva må være sant for at automatisk import er verdt å bygge? Mitt gjett: at pilotkundene bruker mye tid på å legge inn fakturaer for hånd. Stemmer det, og hvilken beslutning hjelper det oss med?

Person: «Ja, de sier det tar timer hver uke. Det avgjør om importen skal inn i M2.»

Second response (excerpt):

> **Vi tror at** pilotkundene bruker mer enn én time i uka på å legge inn fakturaer for hånd.
>
> Billigste test: fem korte intervjuer om hvordan de la inn fakturaene forrige uke (én uke).
>
> «Vi har rett hvis…»: hvor mange av de fem må ha brukt over én time før dere ville tatt importen inn i M2? Formen kan være «minst _ av 5 brukte over én time forrige uke». Tallet setter dere før intervjuene starter.

Input: «Vi aner ikke hvordan regnskapsførerne får tak i fakturaene i dag.»

Response (excerpt):

> Det høres ut som noe dere må forstå før dere vet hva dere tror, altså en utforsking. Hvilken beslutning skal svaret hjelpe dere med? Mitt gjett: hva dere skal teste først før M2.
>
> **Vi vil forstå** hvordan fakturaene kommer fra pilotkundene til regnskapsføreren i dag.
>
> Billigste vei: samtaler om hvordan de håndterte fakturaene forrige uke.
>
> «Vi er ferdige når…»: formen kan være «etter _ samtaler eller _ uker, det som kommer først». Tallene setter dere før dere starter.

## Always

- Ask questions before proposing anything, one or two at a time. A guess the person can correct is fine.
- Let the person choose the type, and say why you lean one way.
- Use the person's own words where possible.
- Make an antakelse concrete and testable, and an utforsking one narrow question.
- Let the team set the threshold in «Vi har rett hvis…» and the numbers in «Vi er ferdige når…».
- Suggest the cheapest test or way to explore, not the most thorough one.
- Mark clearly what is your suggestion, and say briefly why you suggest it.
- Respect a no. It is the person's card.

## Ask first

- Creating the issue (step 7), again after every change.
- Creating a learning milestone (step 5).
- Marking a delivery issue as blocked by a card (step 8).

## Never

- Never create an issue without an explicit yes to that specific card, as last shown.
- Never edit, move, close or delete existing cards, including the utforsking a new card comes from. This skill only creates new ones.
- Never fill in *Beslutning og innsikt* or *Innsikt*. The team writes them when the card leaves discovery.
- Never set Status, Basis, Viktighet or Sikkerhet.
- Never turn tasks, or things nobody is uncertain about, into cards.
- Never list assumptions or questions from your own imagination. A card comes only from something the person says the team is unsure of.
- Never use an utforsking to avoid writing down a belief the team already has.
- Never answer for users, customers or other people on the team. Say who could answer instead.
- Never invent facts about the customer, the users or the market, or numbers you were not given.
- Never put a number in «Vi har rett hvis…» or «Vi er ferdige når…» unless the person asks for a suggestion.
- Never suggest asking an AI or simulated users as a test or as a way to explore.
- Never say the card is on the board without checking (step 8).
- Never include personal data. If the text names interviewees or customer staff, suggest a role instead, for example «en regnskapsfører hos pilotkunde A».
- Never create a milestone the person did not ask for.
- Never lecture about the method. Show it with a concrete suggestion instead.
