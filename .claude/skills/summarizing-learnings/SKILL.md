---
name: summarizing-learnings
description: Drafts a short learning summary (læringsbrev, «Dette lærte vi») from what the assumption board (antakelsestavle) records, covering what was validated, what turned out not to hold, which Bets were made and what explorations found, with a link to every card. Covers the last week by default, or another period or one learning milestone. Use when someone asks what the team learned («hva lærte vi», «ukens læringsbrev», «nyhetsbrev»), for a weekly summary or newsletter, or for a milestone summary. Builds only on what the cards say and never sends anything.
---

# Summarizing learnings

The læringsbrev tells people who do not follow the board what the team has learned. It does not replace the board: every item links to the card where the decision is written. Everything the reader sees is in Norwegian bokmål. Follow the boundaries in `AGENTS.md`.

## Workflow

Copy this checklist and track progress:

```
- [ ] 1. Settle the period and the audience
- [ ] 2. Fetch the cards
- [ ] 3. Read the decisions
- [ ] 4. Draft the letter
- [ ] 5. Check every line against its card
- [ ] 6. Show the draft and what was left out
```

**1. Settle the period and the audience.** The default is the last 7 days, for an internal audience. Ask if anything is unclear:

- Period: this week, another period, or one learning milestone (læringsmilepæl).
- Audience: internal (the team and the organisation) or the customer.

**2. Fetch the cards.** Every issue is a card, and the label tells the type: `antakelse` or `utforsking`. Dates are `YYYY-MM-DD`. Get the week number with `date +%V`.

```bash
# Decisions and insights in the period
gh issue list --state closed --search "closed:>=<from-date>" --limit 500 \
  --json number,title,closedAt,body,labels,milestone,url

# New cards in the period
gh issue list --state all --search "created:>=<from-date>" --limit 500 \
  --json number,title,labels,url

# One milestone instead of a period
gh issue list --state all --milestone "<milestone title>" --limit 500 \
  --json number,title,state,body,labels,url
```

For Bets (Basis and Oppfølging) and for what is being tested or explored now (*Under discovery*), read the board fields. Find the project number with `gh repo view --json projectsV2`.

```bash
gh project item-list <number> --owner <owner> --format json --limit 500
```

**3. Read the conclusion** on each closed card. Leave out cards without a filled-in conclusion (see step 6). A section with only the prefilled labels counts as empty.

- **Antakelse:** read *Beslutning og innsikt*: Beslutning, Det vi så, Produktimplikasjon, Bevis and, for Bets, what the team follows, if anything. Separate what answers the card's «Vi har rett hvis…» line from everything else the card mentions. Only the first is a result.
- **Utforsking:** read *Innsikt*: Det vi så, Nye kort, Nye spørsmål and Bevis. An utforsking has no line and tests nothing. Report what it saw as what was seen, with its counts, and name the new cards it led to.

**4. Draft the letter** from the template that fits. Use one or two lines per card: what we believed or wanted to understand, what we saw, what it means. Skip empty sections. Under «Det som stemte» and «Det som ikke stemte», write only what answers the card's «Vi har rett hvis…» line. Anything else the team noticed goes under «Nye spørsmål».

For a period:

```markdown
## Dette lærte vi, uke <nr>

**Det som stemte (Validert)**
- Vi trodde at … Vi så at … Derfor … ([#11](<url>))

**Det som ikke stemte (Ikke sant)**
- Vi trodde at … Vi så at … Dermed slapp vi å … ([#8](<url>))

**Det vi bygger på uten å ha testet (Bets)**
- Vi bygger på at … uten å ha testet det, fordi … ([#9](<url>))

**Det vi har utforsket (sett, men ikke testet)**
- Vi ville forstå … Vi så at … Det ga nye kort: … ([#7](<url>))

**Det vi tester og utforsker nå**
- …

**Nye kort**
- <antall> nye antakelser og <antall> nye utforskinger, blant annet …

**Nye spørsmål**
- Det teamet la merke til utenfor «Vi har rett hvis…»-linja, og spørsmål fra utforskingene som ikke er kort ennå …
```

For a milestone, use the summary `docs/HVORDAN-VI-JOBBER.md` describes for the milestone description. What an utforsking saw goes under «Det vi har sett, men ikke testet», with its counts, never under «Det vi nå vet».

```markdown
**Det vi nå vet:**
**Det vi fortsatt gjetter (Bets):**
**Det vi har sett, men ikke testet:**
**Betydning for leveransen:**
```

If no cards were closed in the period, do not write a letter. Say so, and mention what is being tested and explored now.

**5. Check every line against its card.** The belief or question, the result and the implication must all be on the card, and every number and quote must appear on it word for word. Remove or correct anything that does not.

**6. Show the draft.** List separately any closed cards left out for a missing conclusion, so the team can fill them in.

## Example

Card #8, closed, *Beslutning og innsikt*:

> **Beslutning:** Ikke sant
> **Det vi så:** 19 av 30 filer gikk gjennom. Alle de 11 feilene kom fra én leverandørs datoformat.
> **Produktimplikasjon:** Vi bygger automatisk import for de to andre leverandørene og manuell feltkobling for leverandør X.

Line in the letter:

> - Vi trodde at vi kunne importere 80 % av fakturaene automatisk. 19 av 30 filer gikk gjennom, og alle feilene kom fra én leverandør. Vi bygger automatisk import for de to andre og manuell feltkobling for den siste. ([#8](<url>))

## Always

- Build only on what the cards say, and link every item.
- Treat *Ikke sant* as a good result: the team avoided building something that would not have worked.
- Keep it short, in the team's own words from the cards.
- For the customer, include only what is in *Beslutning og innsikt* and *Innsikt*, not the discussion in the comments.

## Never

- Never invent or round results, numbers or quotes.
- Never turn a Bet into Validert, and never soften an *Ikke sant*.
- Never guess a missing conclusion. Leave the card out and say so.
- Never include names, quotes or details that could identify interviewees or anyone else.
- Never present cards that are still being tested as settled.
- Never present something noticed outside a card's «Vi har rett hvis…» line as a result.
- Never present what an utforsking saw as validated or decided. It gives grounds for new beliefs, not answers.
- Never send, publish or post the letter, and never write it into the milestone. Hand the draft to a person.
- Never use sales language, or statistics that are not on the board.
