# Examples

Fictional cards from one discovery board, showing what a good card looks like in each state. The domain is invented: a service that helps small accounting firms collect invoices from their clients.

The cards are shown the way they read in GitHub: the title, the fields on the board, and the sections in the issue body. Empty sections are left out.

---

## A question in «What we need to know»

**Title:** How do bookkeepers find out which client invoices are missing at month end?

**Label:** `question` · **Primary lens:** People

**Why it matters**
The month-end routine decides whether a dashboard of missing invoices is worth building at all. If bookkeepers already have a reliable way to see the gaps, a dashboard adds little.

**What would be enough to update our understanding?**
We can describe how bookkeepers at three or more firms found the gaps last month, including what they looked at, and where it went wrong.

**Existing material**
Support tickets tagged «missing invoice», summarised in the team's research folder (September).

> Not: «Interview five bookkeepers». That is a way of learning, not what the team wants to learn.

---

## A belief in «What we think we know»

**Title:** We believe clients will upload invoices themselves if it takes less than a minute

**Label:** `belief` · **Primary lens:** Product

**Why it matters**
Self-service upload is the main intake flow in the plan for the next release. If clients keep emailing invoices, the bookkeepers' manual work does not go away.

**What evidence would strengthen or challenge it?**
Strengthen: most clients in a one-week trial upload at least one invoice themselves, next to email. Challenge: they keep emailing, or upload only when reminded.

**Existing material and indications**
Two clients asked for an upload page in support conversations (August).

---

## The same belief in «Investigating»

The card stays the same. The team adds:

**Assignees:** a designer and a developer · **Next checkpoint:** 24 October · **Milestone:** Intake is understood

The trial itself runs in the product and its analytics. The card links to the trial setup.

---

## «What we currently know», Outcome: Supported

**Title:** Most pilot clients uploaded invoices themselves once a simple upload page existed (6 of 8, one-week trial, October)

**Label:** `belief` · **Outcome:** Supported · **Primary lens:** Product · closed

**Current understanding**
- **What we found:** 6 of 8 users at pilot clients uploaded at least one invoice themselves during the trial week, alongside email. The two who did not have a bookkeeper who collects invoices for them.
- **So this means:** Upload becomes the main intake flow in the next release. Email stays as a fallback.
- **Evidence and sources:** Upload page analytics and the trial summary in Miro, frame «Upload trial week 41», 14 October.
- **Applies to:** Small clients with fewer than 20 invoices a month, over one week, with email still available. Not tested with larger clients or over a longer period.

**Decisions informed**
org/app#456 Upload as the main intake flow

> The title changed from «We believe clients will upload invoices themselves if it takes less than a minute». The old title is in the issue history. The new title claims no more than the trial showed: it does not say «clients upload when it takes less than a minute», because upload time was never varied.

---

## «What we currently know», Outcome: Did not hold

This card shows up in the view *Changed our mind*.

**Title:** Automatic import fails on one vendor's date format; 19 of 30 export files imported without manual mapping (technical test, October)

**Label:** `belief` · **Outcome:** Did not hold · **Primary lens:** Technology · closed

**Why it matters** (written when the card was created)
We planned automatic import as the main promise of the next release, based on the belief that we could import 80 % of invoices automatically.

**What evidence would strengthen or challenge it?** (written before the test)
At least 24 of 30 real export files from three pilot clients import without manual field mapping.

**Current understanding**
- **What we found:** 19 of 30 files imported without mapping. All 11 failures came from one vendor's date format.
- **So this means:** We build automatic import for the two other vendors and a one-time manual mapping for the third. New belief: «We believe users of vendor X accept mapping fields once» (#31).
- **Evidence and sources:** Spike branch `spike/import-test` and the results sheet, tab «Round 1», 3 October.
- **Applies to:** Export files from the three pilot clients' accounting systems, as of September.

---

## An informed bet

**Title:** We believe users understand the invoice status icons without help text

**Label:** `belief` · **Status:** Informed bet · **Next checkpoint:** 1 December · open

**Why it matters**
The icons are already built and in use. Adding help text later is cheap, so the risk of being wrong is small.

**Informed bet**
- **We proceed with:** Keeping the four status icons as they are, without help text.
- **Why it is reasonable now:** The icons come from the design system, where they are used in two other products, and nobody has raised a problem.
- **If we are wrong:** More support requests about invoice status, and some users trust the wrong status.
- **Revisit when:** 1 December, or earlier if support gets more than five requests about invoice status in a month.

> The bet stays open. It is a basis for action, not knowledge.

---

## A thread

**Parent:** How do invoices get from clients to the bookkeeper today?

**Sub-issues:**
- How do clients send invoices today, and why that way? (`question`, What we currently know)
- We believe clients will upload invoices themselves if it takes less than a minute (`belief`, became the Supported card above)
- How do bookkeepers find out which client invoices are missing at month end? (`question`, What we need to know)

The parent is a broader learning question. Each child is a distinct part of it, with its own lens and state.

---

## What does not belong in «What we currently know»

- «We have interviewed six bookkeepers.» This is research coverage. Put it in the context of a question.
- «Bookkeepers want a dashboard.» Too broad, and a wish rather than an observation. What did they do, how many of them, in which situation?
- «Users are confused by the icons.» Without evidence and scope, this is a belief. Write it as one.
