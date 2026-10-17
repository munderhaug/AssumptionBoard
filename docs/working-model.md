# Working model

The board is a shared map of learning for a cross-functional product team. It shows what the team needs to understand, what it currently assumes, what it is investigating, what it knows well enough to act on, and where it is moving forward despite uncertainty.

It does not replace research, design, engineering or domain work. That work happens in the tools that suit it. The board keeps the current shared learning state and links back to the work.

The underlying methodology is rich. The surface is deliberately small: two card types, six states, three fields and one weekly review.

## The problems it addresses

- Discovery happens, but the wider team cannot see what was learned.
- Insight sits with individuals instead of being owned by the team.
- Decisions are made without a visible link to the learning behind them.
- Prototypes and concepts are mistaken for decided solutions.
- Questions get investigated again because nobody knew they were partly answered.
- Assumptions quietly turn into facts and requirements.
- Nobody can tell what is known from what is merely believed.
- Work has to move forward with incomplete evidence, and the uncertainty disappears from view.
- New evidence changes what the team understands, and the history of what it used to believe is lost.

## A map of learning, not a task board

A card is never an activity. «Interview five users», «Run a workshop» and «Build a prototype» are ways of learning, and they live in the team's normal tools. A card is what the team is trying to learn or what it now understands:

- a question: *How does a support agent decide whether a refund can start?*
- a belief: *We believe clients will upload invoices themselves if it takes less than a minute.*
- an understanding: *Most pilot clients uploaded invoices themselves when upload took under a minute (6 of 8 clients, one-week trial, October).*
- an informed bet: *We believe users understand the invoice status icons without help text*, in the *Informed bet* column, with the decision to keep the icons as they are until support requests show otherwise.

The board answers «What are we trying to learn, and what do we currently understand?», not «Which research tasks are done?».

## The six states

The columns describe how well the team understands something, not progress on work.

| State | Means | The card has |
| --- | --- | --- |
| **What we need to know** | A genuine open question that matters for a decision ahead. Not everything that could be researched. | Title as a question. Why it matters. The criterion: what would be enough to update our understanding. |
| **What we think we know** | A working belief or hypothesis. There may be indications, but the team does not present it as established. This is where assumptions become visible instead of silently becoming requirements. | Title as a belief. Why it matters. The criterion: what evidence would strengthen or challenge it. |
| **Prioritized** | The team has committed to reduce this uncertainty. A commitment, not just importance. | People and a next checkpoint added. |
| **Investigating** | Active learning is happening somewhere: conversations, scenario walkthroughs, concept tests, technical exploration, data, document review. Keep it to three cards or fewer. | The same, plus links to where the work happens, under *Existing material*. |
| **What we currently know** | The team's best current usable understanding, scoped to the evidence. Not permanent fact. | The title rewritten as the understanding. What we found, so this means, evidence and sources, applies to. Outcome set for beliefs. |
| **Informed bet** | The team proceeds on purpose before the uncertainty is resolved. A valid basis for action, never presented as knowledge. | What we proceed with, why it is reasonable now, the consequence if we are wrong, when to revisit. The revisit date as Next checkpoint. |

The first two columns are two starting points, not two steps: a question starts in *What we need to know*, a belief in *What we think we know*. The project adds every new card to *What we need to know*, so move a belief across after creating it. Either moves to *Prioritized* when the team commits to it. Both can end in *What we currently know* or *Informed bet*, and both can return to an earlier state when new evidence challenges them.

## Two ways in

Every card starts as one of two issue forms, under *Issues* → *New issue* (not *+ Add item* on the board, which makes a draft without the form):

- **Question** (label `question`): something the team needs to understand. The title is the question.
- **Belief** (label `belief`): something the team believes but has not established. The title starts with «We believe».

On day one, write the title, why it matters and, if you can, the criterion: what would be enough to update our understanding (for a belief: what evidence would strengthen or challenge it). Agree on the criterion before anyone starts investigating. Everything else is added when the card gets there.

A broader learning question with several distinct parts becomes a **thread**: a parent issue with sub-issues. Any question can be a parent. See [Threads](#threads).

## The card changes shape with its state

| State | What the team adds |
| --- | --- |
| What we need to know, What we think we know | Title, why it matters, the criterion, optional links to existing material |
| Prioritized, Investigating | People (assignees) and a next checkpoint. The research itself stays in Miro, Figma, documents or code, linked under *Existing material*. |
| What we currently know | The *Current understanding* section, filled in before the weekly review. In the review: a new title that states the understanding, and Outcome for beliefs. |
| Informed bet | The *Informed bet* section, and its revisit date as Next checkpoint. The title stays as it is. |

The **next checkpoint** is the date the team next looks at what has been learned and decides to conclude, continue or stop. It is not a deadline for finishing. Stopping moves the card back to where it started, *What we need to know* or *What we think we know*, without people or a checkpoint. If it no longer matters, close it as not planned (see [Closing and reopening](#closing-and-reopening)).

The later sections are already in the card from the start, with short hints that show when someone edits the card. GitHub keeps the old title and every edit in the issue's history, so nothing is lost when the title is rewritten.

## What we currently know

### The title states the understanding

When a card moves here, its title changes from the question or belief to what the team now understands. The column then reads as knowledge without opening any card.

- Before: *How does a mail return differ from a store return?*
- After: *Mail returns need an explicit «received» step between shipment and refund (8 mail returns reviewed, October)*

Write the understanding no broader than the evidence. Put the basis in parentheses: how many, of what, when.

### The rule

A card only becomes *What we currently know* when the team is willing to use the statement in a real decision, and can explain what evidence it rests on, who or what that evidence represents, and where the statement may not apply.

This judgement cannot be reduced to filled-in fields. It happens in the weekly review, where the team asks:

1. Is the statement actually supported?
2. Is the wording no broader than the evidence?
3. Would we be comfortable explaining this basis to someone outside the team?

So the team moves cards here in the review, not when the work on them is done. Before the review, whoever investigated fills in *Current understanding* while the card is still open, in whatever state it is in. In the review, the team asks the three questions, agrees on the new title, sets Outcome for a belief and moves the card, which closes it. A card that was moved or closed between reviews is checked in the next one, and reopened if it does not hold up.

For a closer look, the AI assistant (or a colleague) can also ask: who does the evidence represent, are there meaningful counterexamples, and is it strong enough for the decision being made now? The team does not need certainty. It needs confidence that is scoped to the evidence.

### One card per topic

A card in *What we currently know* is the current best formulation for its topic, not an archive of everything ever learned. When new evidence arrives, the team strengthens, refines, challenges or replaces the understanding on the same card. Earlier versions stay in the issue history.

### Research coverage is not knowledge

«We have interviewed four engineering roles» is a statement about the research, not about the users or the product. It belongs as context on a question, never as a card in *What we currently know*.

## Knowledge and action are separate

Two things can both be a basis for action:

- **What we currently know:** we know enough, within the current scope, to proceed.
- **Informed bet:** we do not know enough to call this knowledge, but we understand the uncertainty and choose to proceed.

Keeping them apart lets the team move fast without rewriting uncertainty as certainty, and makes it possible to trace later which decisions rested on evidence and which on a bet.

An informed bet usually grows out of an existing question or belief. The team decides on it together, usually in the weekly review: it checks the *Informed bet* section, filled in beforehand or in the review, sets the revisit date as Next checkpoint, and moves the card. The title stays as it is. When a decision cannot wait for the review, decide with the people involved and take it up in the next review.

A bet stays open, because the uncertainty is still there. It is revisited when its date or trigger arrives, or earlier if the team or a stakeholder asks for evidence. Revisiting means keeping the bet with a new date under *Revisit when* and as Next checkpoint, moving the card to *Prioritized* to investigate it, or concluding it if evidence has arrived.

## Outcome: making changed minds visible

Beliefs get an **Outcome** when they are concluded:

| Outcome | Means |
| --- | --- |
| Supported | The belief held within the scope of the evidence. |
| Refined | It held only in part: some of what we believed did not hold. |
| Did not hold | The evidence contradicted what we believed. |
| Inconclusive | The investigation did not give a usable answer. |

Questions do not get an Outcome.

The view **Changed our mind** shows every card with *Did not hold* or *Refined*. It is one of the most useful views in a stakeholder conversation: it shows that the team is genuinely learning, not making everything look inevitable afterwards. A card that did not hold still moves to *What we currently know*, with a title that states what the team understands now. When nothing better is known yet, the title can say what did not hold: *The belief that store staff own the full return process did not hold (5 of 6 stores observed)*.

Every understanding is worded no broader than its evidence, so a narrower title alone does not make a belief Refined.

An *Inconclusive* belief goes back to *What we think we know* with a sharper criterion, or becomes an informed bet. Empty its *Current understanding* and link what was found under *Existing material and indications*, so the draft is not read as a conclusion. A question whose investigation gave no usable answer is handled the same way, but goes back to *What we need to know*, with what was found under *Existing material*, and without an Outcome. The team decides in the weekly review.

## Closing and reopening

- A card is closed when the team moves it to *What we currently know* in the weekly review. The project closes it automatically, and a card closed any other way moves there automatically. So never close a card because the work on it is done, an investigation has ended or a feature has shipped, and never close a card from the delivery repository: no «Closes», «Fixes», «Resolves» or any other closing keyword before a card in a pull request or commit message, and no pull request or branch linked in the card's *Development* sidebar. Merging would close the card.
- An informed bet stays open. It is a basis for action, not knowledge, and closing it would make milestone progress look like learning that never happened.
- When an understanding is challenged, reopen the card. The project then puts it in *What we think we know* (if it has the *Item reopened* workflow): what the team understood is a belief again. Rewrite the title as that belief («We believe …»), or for a question card as the question and move it to *What we need to know*. Clear Outcome and empty *Current understanding* until the team concludes the card again. The old title and text stay in the issue history. Dragging a card out of *What we currently know* does not reopen it, so reopen it first.
- Cards that turn out to be duplicates or irrelevant: remove their milestone, then choose **Close as not planned**, also for a duplicate (comment «Duplicate of #12»). Do not use *Close as duplicate*. The project archives only cards closed as not planned, and treats every other closed card as knowledge.

## Threads

Use a parent issue with sub-issues only when the hierarchy adds meaning:

- A parent is a broader learning question. Its children are distinct questions or beliefs that help answer it.
- No parent for a single child, no parent and child with the same scope, and no parent that is just a folder.
- Standalone questions are valid and expected.
- Children can have different lenses and be in different states.

Example: *How are returns evaluated and decided?* with the children *How does a store assess whether an item is resellable?*, *When does customer service override the store?* and *What changes when the item is above a certain value?*

## Primary lens

Each card can have one **Primary lens** for orientation and filtering:

- **People:** users, roles, needs, goals, behaviour and work practice.
- **Business:** value, workflows, governance, responsibilities, rules and organisational context.
- **Technology:** systems, data, architecture, integrations, constraints and which system is the source of truth.
- **Product:** what the product is for, its capabilities, interaction, information and user experience.

Many questions cut across lenses. Pick the one that best orients the card and mention the others in the text when they matter. Technical and information-architecture questions are discovery questions as much as user questions, whenever they involve uncertainty that can affect the product.

## Dependencies and decisions

- **Dependencies:** when one question really cannot be answered before another, mark it as *blocked by* the other (the issue's *Relationships* sidebar). Use it for discovery relationships, not feature dependencies, and only when the order matters.
- **Decisions informed:** link the product, design or technical decisions a card informs, for example an issue or an architecture decision record in the delivery repository. One card can inform several decisions, and one decision can rest on several cards. A decision may also rest on constraints, requirements or policy rather than research. The point is to make its basis visible, not to build a decision system.
- **Delivery issues** can be marked as *blocked by* a question or belief that must be resolved first. Never block delivery on an informed bet: the bet is the decision to proceed. When a blocking card becomes an informed bet, remove the *blocked by* link.

## Milestones are learning objectives

Milestones say where discovery needs to get the team, not which activities it will do. They use GitHub's own milestones, so their progress bar shows how many of the linked cards are closed, which means how much has become current understanding.

Write each milestone's description in three parts:

```markdown
**Desired learning:** the broader learning objective
**What needs to be understood:** a short list of learning criteria, not tasks
**Reached when:** an observable state that shows the team understands enough to move on
```

Link a card to a milestone only where it helps answer it. There is no matrix linking cards to individual criteria.

## Evidence stays where the work happens

The board is not the evidence repository. Interviews, workshops, designs, code, architecture documents and analyses stay in their own systems. A card holds the concise question or understanding, its state, the people, links to the source material, a short conclusion and the decisions it informs.

**Check existing evidence first.** Before investigating, ask whether existing material already answers part of the question:

- **Already answered:** the question may be resolved without new research.
- **Partly answered:** narrow the question to the remaining gap.
- **Conflicting:** the contradiction itself is what to investigate.
- **A genuine gap:** new discovery is warranted.

This is not a gate. It is a way to avoid repeating research and to sharpen the question.

**Privacy:** never put names, identifying quotes, recordings or raw interview notes in an issue. Link to summaries.

## Scenario × discipline × decision

Generic role research («What does this role need?») gives vague answers. More useful framing: *How does this role work with the problem in this specific situation?* and *How do different disciplines evaluate the same situation differently?*

A scenario × discipline × decision matrix is a grid of the situations the product must handle, the disciplines or roles involved, and the decisions each of them makes there. It belongs in synthesis work, for example in Miro. The insight it produces belongs on the board, as a question or an understanding such as *How does responsibility move from operations to support when a case falls outside the standard flow?*

Choosing which scenarios to understand first is a prioritisation decision. It frames discovery, but it should not dominate the board.

## Where to start

**A new project** can start with an empty board.

**A project that is already running** starts with a current-state mapping of about 90 minutes, alongside the open questions the team already knows it has. Ask:

1. What have we already built or decided?
2. What did we believe when we did it, and what do we believe now?
3. Which of those beliefs actually have evidence we can point to?
4. What do we know well enough to use?
5. Where are we already proceeding as bets?
6. Which important decisions have weak or invisible reasoning?

The output is the first board state: beliefs in *What we think we know* and open questions in *What we need to know*. Beliefs with evidence the team can point to get their *Current understanding* filled in, and beliefs the team already proceeds on without such evidence get their *Informed bet* section filled in. The first weekly review decides which of them become *What we currently know* or *Informed bet*. Limit it to about 15 cards that matter for the direction ahead. The exercise usually surfaces exactly the problem the board exists for: assumptions that have quietly become accepted facts.

## The weekly review

The board alone is not enough. A short weekly review, 20 to 30 minutes and preferably as part of a meeting the team already has, keeps it alive. The whole team owns it. One person, the board keeper, runs it and keeps the board tidy, but does not own the cards.

1. What did we learn since the last review?
2. Can any investigations be concluded, and are any informed bets due for a revisit? For each card about to become current understanding, ask the three questions in [The rule](#the-rule), agree on the new title, set Outcome for a belief, and move the card. For each card about to become an informed bet, or moved there since the last review, check that its four parts are filled in. A bet due for a revisit is kept, investigated or concluded.
3. Did anything strengthen, refine or challenge what we currently know? Reopen cards whose understanding no longer holds, and take up comments that question a card.
4. Which uncertainties matter most for the decisions coming up? Sort new cards: beliefs that landed in *What we need to know* move to *What we think we know*.
5. Do prioritized and investigating cards have people, a next checkpoint and a criterion?
6. Which product or technical decisions are affected?
7. What should we tell stakeholders?

When there is little to discuss, keep it short. Do not skip it two weeks in a row.

## Stakeholders

Choose one of two modes, or both:

- **Stakeholders read the board.** Give them read access to the repository and the project, and point them to *Ready for action*, *Learning now* and *Changed our mind*. They do not need to read the whole list of open questions. A stakeholder who questions a card comments on it, and the team takes it up in the next weekly review. Read-only access needs a repository owned by an organization (a free one is enough).
- **Stakeholders get a weekly learning update.** After the review, send a short update: what we learned, what changed, what remains uncertain, what we are learning now, and which decisions it affects. Each item links to its card. The AI assistant can draft it, and a person reviews and sends it. If the team uses AI, tell stakeholders once how: the assistant drafts from the board, a person checks every line against its card, and AI output is never evidence.

## The role of AI

AI is an assistant, never the owner of discovery. Initially it has four jobs:

1. **Formulate:** turn a messy concern into a useful question or a belief that evidence could challenge.
2. **Challenge:** before a card becomes current understanding or an informed bet, question its scope, evidence, contradictions and wording.
3. **Prepare the review:** summarize what changed since the last review and point out cards that need attention.
4. **Communicate:** draft the stakeholder learning update.

Searching connected sources for existing evidence is added only once Miro, Figma or document tools are actually connected.

These are support jobs. The sense-making stays with the team: talking to users, deciding what the evidence shows, and wording what the team now understands. That is how the team learns, and how it can explain its basis to the client. So the assistant asks before it suggests, the person writes first when a conclusion is drafted, and, for a card about to become current understanding, the team answers the three questions in [The rule](#the-rule) before it reads the assistant's challenge.

AI never declares something current understanding, decides that a bet is acceptable, makes product or architectural decisions, rewrites the board's history, or replaces direct contact with users and domain experts. It never stands in for users either: a model's answer about what users think is not evidence. Humans make the judgements.

## What the board is not

Not a research repository, a replacement for design or engineering tools, a task backlog, a list of every possible research question, a persona library, a feature roadmap, an approval process, a place where every finding becomes permanent knowledge, or a system where uncertainty must disappear before work can proceed.

Its purpose is narrower: make uncertainty, learning and the basis for decisions visible enough that the team works coherently, and stakeholders understand why the product moves in a particular direction.

## Sources

- [Continuous discovery and assumption testing, Teresa Torres, Product Talk](https://www.producttalk.org/assumption-testing/)
- [Story-based customer interviews, Teresa Torres, Product Talk](https://www.producttalk.org/2024/04/story-based-customer-interviews/)
- [Assumptions mapping, David Bland, Strategyzer](https://strategyzer.com/library/how-assumptions-mapping-can-focus-your-teams-on-running-experiments-that-matter)
- [The Test Card and the Learning Card, Strategyzer](https://assets.strategyzer.com/assets/resources/the-test-card.pdf)
- [Lean UX, chapter 3, Jeff Gothelf and Josh Seiden](https://www.oreilly.com/library/view/lean-ux/9781449366834/ch03.html)
- [Product Discovery Recipes, Jeff Patton](https://andrewclark.super.site/all-media/product-discovery-recipes)
- [Don't use generative AI to replace discovery with real humans, Teresa Torres, Product Talk](https://www.producttalk.org/2024/06/generative-ai-discovery/)
- [Don't outsource the learning: why human-led research still matters, Nielsen Norman Group](https://www.nngroup.com/articles/human-led-research-still-matters/)
- [Synthetic users: if, when, and how to use AI-generated «research», Nielsen Norman Group](https://www.nngroup.com/articles/synthetic-users/)
