# Communicate

Draft a short learning update for stakeholders who do not follow the board. It builds only on the cards, links to each one, and is never sent by you.

## Checklist

```
- [ ] 1. Settle the period and the audience
- [ ] 2. Read the board
- [ ] 3. Draft the update
- [ ] 4. Check every line against its card
- [ ] 5. Show the draft and what was left out
```

**1. Period and audience.** The default is the last 7 days, for stakeholders outside the team. Ask if the person wants another period or one milestone. The update follows the weekly review. Unless the person has said when the last review was, ask. If this week's review has not happened yet, say so. In step 5, list the cards closed after the last review separately, as not yet checked in a review.

**2. Read the board** as in `SKILL.md`. Use cards closed as completed in the period (`closedAt`), cards whose Status or Outcome changed in the period (from `updatedAt`, an estimate, since `gh project item-list` shows no date for Outcome), and the cards in *Prioritized*, *Investigating* and *Informed bet* now. For one milestone, read the milestones with the command in `AGENTS.md`.

Read the comments on the cards you use (`gh issue view <number> --comments`). Ignore cards closed as not planned or as duplicate. Leave out, and list separately in step 5:

- a card in *What we currently know* whose *Current understanding* section is empty, or whose title is still a question or starts with «We believe»,
- a card in *Informed bet* whose *Informed bet* section is empty,
- a card that a comment questions, unless the review has taken it up or the card has been reopened (report it under «is open again»).

**3. Draft the update:**

```markdown
## Learning update, <period>

**What we learned**
- <the understanding, as the card's title states it>. <one line on what it means>. ([#12](<url>))

**What changed**
- We believed <old belief>. It did not hold: <what we understand now>. ([#15](<url>))
- We believed <old belief>. It held only in part: <what we understand now>. ([#16](<url>))
- <the understanding> is open again: <what challenged it, as the card or its comments say>. ([#17](<url>))

**What remains uncertain**
- <the cards in *Prioritized*>, and the informed bets we proceed on: <bet>, revisit date <date>. ([#9](<url>))

**What we are learning now**
- <investigating cards>. ([#18](<url>))

**What this affects**
- <decision> (rests on current understanding, [#12](<url>))
- <decision> (rests on an informed bet, [#9](<url>))
```

Skip empty sections. Keep each line to what the card says, in the team's words. Present *Did not hold* as a useful result, in the card's words. Do not say the team avoided building on it unless the card says so.

The old belief for «What changed» is in the title history, since the title was rewritten. Read it on the issue page, or with `gh api --paginate repos/{owner}/{repo}/issues/<number>/events --jq '.[] | select(.event == "renamed") | .rename.from'`, which lists the earlier titles oldest first and which Claude Code asks before running. The old belief is the last of them that starts with «We believe». If there is none, ask. Never reconstruct it from the new title.

For one milestone instead of a period, use the milestone's three parts: what the desired learning was, what is now understood, and what the cards show against «reached when». Say that it is reached only if the team has closed the milestone or said so.

**4. Check every line against its card.** The understanding, numbers and scope must appear on the card. Remove anything that does not.

**5. Show the draft**, and list separately the cards left out in step 2 and the cards not yet checked in a review (step 1).

## Never

- Never send, post or publish the update. A person reviews and sends it.
- Never present an informed bet as knowledge, or something still being investigated as settled.
- Never make an understanding broader than its card, round numbers, or soften a *Did not hold*.
- Never include names, identifying quotes or details from raw sources.
- Never use sales language.
