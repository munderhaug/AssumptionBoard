# Formulate

Turn a concern, idea, feature or loose belief into a card that is worth having on the board. The goal is sharper thinking, not a card written on the person's behalf.

## Checklist

```
- [ ] 1. Understand the starting point
- [ ] 2. Find what the team does not know
- [ ] 3. Choose question or belief
- [ ] 4. Check the board for an existing card
- [ ] 5. Draft the card
- [ ] 6. Show it and get an explicit yes
- [ ] 7. Create the issue and hand over
```

**1. Understand the starting point.** Write it back in one sentence: «As I understand it: … Is that right?» Note what kind it is: a concern, an idea, a feature about to be built, something already built, or a belief. If cards on the board already cover it, name them now, and once the person has confirmed, ask what they leave open.

**2. Find what the team does not know.** Ask one question at a time, openly and without offering your own answer, across the four lenses. Once the person has answered, you may add an idea to check, marked as yours, but never about what users do or need:

| Lens | Questions that open it up |
| --- | --- |
| People | Who has the problem, and how do they deal with it today? In which situation? |
| Business | Which workflow, rule, responsibility or value does it touch? Who decides? |
| Technology | Which systems, data or integrations does it depend on that we have not tried? What is fixed, and what is reversible? |
| Product | What must the product do, show or own for this to work? What would make it a waste? |

Prefer concrete framing: *How does this role deal with the problem in this situation?*, not *What does this role need?*. Stop when the last two questions gave nothing new the person is unsure of. Keep at most three candidate cards, the ones where being wrong or not knowing would cost the most, and say why you picked them.

**3. Choose question or belief.** Ask: «Do you already have a view on the answer, or do you need to understand more first?»

- A view the team holds becomes a **Belief**: «We believe …».
- An open matter becomes a **Question**, written as the question itself.
- A yes/no question («Will they pay?») usually hides a belief. Ask what the team thinks the answer is.
- An activity («Interview five users», «Build a prototype») is a way of learning, not a card. Ask what it should teach the team.
- If someone on the team or at the client can simply answer it, suggest asking them instead.

**4. Check the board.** Search for existing cards:

```bash
gh issue list --state all --search "<keywords>" --json number,title,state,stateReason,labels,url
```

If a card in *What we currently know* already answers part of it, show it and suggest narrowing the new card to the remaining gap. If cards conflict, say so: the conflict may be the thing worth investigating.

**5. Draft the card.**

- **Title:** the question, or the belief starting with «We believe». Short enough to read on the board, and one thing only.
- **Why it matters:** which decision the answer could change.
- **What would be enough to update our understanding?** (question) or **What evidence would strengthen or challenge it?** (belief). Ask the question that sets it, for example «What would you need to see before you would change the plan?». Let the team set any numbers. Give a number only if asked, and mark it as your suggestion.
- **Existing material:** links the person gives you. Leave it empty rather than guessing.
- **Primary lens:** suggest one, with a reason.

If the person is unsure what a good title, criterion or *Why it matters* looks like, show the closest card in `docs/examples.md` and say that it is fictional.

**6. Show the whole card** and ask whether to create it. After any change, show it again and ask again.

**7. Create the issue** only after an explicit yes to the card exactly as last shown. Write the body in the shape the form produces, so it matches the other cards:

Question:

```markdown
### Why it matters

<text>

### What would be enough to update our understanding?

<text, or _No response_>

### Existing material

<links, or _No response_>

### Current understanding

**What we found:** <!-- 1–3 sentences about users, work, domain, product or technology. Not about research progress. -->
**So this means:** <!-- what it changes for the product or for our next decisions -->
**Evidence and sources:** <!-- links to summaries in Miro, Figma, documents or code, with dates. No raw notes, recordings or names. -->
**Applies to:** <!-- who and what the evidence represents, and where this may not apply -->

### Informed bet

**We proceed with:** <!-- what we are choosing to do -->
**Why it is reasonable now:**
**If we are wrong:** <!-- the consequence -->
**Revisit when:** <!-- a date, and optionally a trigger that brings it forward -->

### Decisions informed

_No response_
```

A belief uses `### What evidence would strengthen or challenge it?` and `### Existing material and indications` instead.

Write the body to a temporary file outside the clone, so it is not left behind in the repository.

```bash
gh issue create --label <question or belief> --title "<title>" --body-file <file>
```

Then check that it worked and is on the board:

```bash
gh issue view <number> --json url,labels,projectItems
```

Give the link. Remind the person that a belief should be moved to *What we think we know* on the board, and that Primary lens is set there. If the card is missing from the board, auto-add is probably off (`docs/setup.md`, step 4).

## Several statements at once

When someone pastes a list: rewrite each as a question or a belief, flag activities, duplicates and items that hold two things, and let the person choose which to draft. Then draft each chosen card as in step 5 and show it in full. A yes covers only the cards shown in full.

## Mapping a running project

When the team asks to map what is already built or decided (`docs/working-model.md`, «Where to start»):

1. Ask what has been built or decided. Take one item at a time.
2. For each: «What did we believe when we did this?» and «What evidence can we point to?»
3. Sort with the person. Every card starts as a Belief in *What we think we know* or a Question in *What we need to know*:
   - Evidence the team can link and describe → a Belief whose *Current understanding* the team fills in, with links to the evidence. It is a candidate for *What we currently know*, which the team decides in the review.
   - No evidence, and the team proceeds anyway → a Belief whose *Informed bet* section the team fills in. It is a candidate for *Informed bet*, which the team decides in the review.
   - No evidence, and it matters → a Belief.
   - Nobody understands why it works or fails → a Question.
4. Point out decisions whose reasoning nobody can state. They are often the most useful cards. Add the open questions the team already knows it has.
5. Keep the first board to about 15 cards. Draft them as a list, then show each card in full and create it only after a yes to that card.

Never mark anything as known or as a bet yourself. Suggest, and let the team move the cards.
