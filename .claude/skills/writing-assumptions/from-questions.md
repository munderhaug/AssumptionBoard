# From questions, ideas and features to beliefs

Use this when the person starts from a question, an idea, a feature about to be built, something already built, or a delivery issue, rather than from a belief. It ends with a short list of beliefs the person chose. Take each of them through steps 2–7 in `SKILL.md`. The method is the one in `docs/HVORDAN-VI-JOBBER.md`, section «Fra spørsmål til antakelser».

What the team needs to figure out comes from the person's answers. Your guesses are there to react to, never assumptions of their own.

## 1. Understand the starting point

What is it, who is it for, and what should it lead to? If it is a delivery issue, read it with `gh issue view <url> --json title,body,url`. Write it back in one sentence, «Slik jeg forstår det: … Stemmer det?», and note what kind it is: a question, an idea, something about to be built, or something already built.

If the starting point is one clear question, such as «Vil regnskapsbyråene betale for dette?», go straight to step 3.

## 2. Find what the team needs to figure out

Ask one question per message, with your guess attached («Mitt gjett: …»), and say briefly why you ask. Cover all four perspectives. Discovery is not only design.

| Perspective | Risikotype | Questions that open it up |
| --- | --- | --- |
| Product | Verdi | Who has the problem, and how do they handle it today? What should change for them? What would make this a waste? |
| Design | Brukbarhet | What must users understand or do for it to work? Where could they get stuck? |
| Technology | Gjennomførbarhet | What do we depend on that we have not tried, such as integrations, data, performance or other teams? What would be expensive to change later? |
| Business | Levedyktighet | Who pays, and what does it cost to run and support? Are there legal, security or contract limits? What do sales and support expect? |

For something already built, ask: «Hva antok vi da vi bygde det, og hva vet vi nå?» Usage data and support requests are often the cheapest evidence.

Listen for answers that sound right but say nothing, such as «brukervennlig», «skalerbart» or «sånn gjør alle det». Ask: «Hvis du ikke måtte begrunne det for noen, hva tror du egentlig?» or «Hva ville du sett hvis det var sant?»

Write each open point down as «Vi vet ikke om …». Stop when all four perspectives are covered and the last two questions gave nothing new the person is unsure of. If the picture is still unclear after many questions, say so, and ask whether something more basic is missing.

## 3. Turn each open question into a belief

Ask what the team believes the answer is today. That belief is the assumption. «Vi vet ikke om pilotkundene vil laste opp selv» becomes «Vi tror at minst halvparten av pilotkundene vil laste opp fakturaer selv». You may suggest a wording, and say why it is phrased that way. If the team has no belief yet, keep it as an open question, and suggest who could answer it.

## 4. Sort with the person

Check for existing cards with `gh issue list --label antakelse --state all --search "<keywords>" --json number,title,state,url`. Then sort each belief:

- **Known:** there is evidence or a card already. Link it. No new card.
- **Important and uncertain:** a candidate for a card.
- **Important and fairly certain:** a candidate for a Bet.
- **Unimportant:** leave it.

Pick at most three candidates, the ones where being wrong would cost the most, and say why you picked them. More cards than that fill the Backlog without helping anyone decide.

## 5. Restate and get an explicit yes

Use the person's words:

```markdown
**Hva vi må finne ut av om <starting point>**

1. Verdi: Vi tror at …
2. Gjennomførbarhet: Vi tror at …
3. Levedyktighet: Vi tror at …

Det vet vi allerede: … (#12)
Det bygger vi på uten test (Bet): …
Det forutsetter det ikke: …
Spørsmål vi ikke har noe svar på ennå: …

Stemmer dette? Hvilke skal bli kort?
```

If the person corrects anything, fold it in and restate. «Ja, men …», «gjør det du mener er best» and no answer are not a yes. If the beliefs answer the same thing the team must know, mention that they may belong under one learning milestone (step 4 in `SKILL.md`).

## 6. Continue in SKILL.md

Take each belief the person chose through steps 2–7 in `SKILL.md`. If the starting point was a delivery issue, step 7 offers to mark it as blocked by the new cards.

## Example

Input: «Vi skal bygge et dashbord for regnskapsførerne.»

First response:

> Slik jeg forstår det: regnskapsførerne skal se status for kundenes fakturaer på ett sted. Stemmer det?
>
> Første spørsmål, fordi verdien avhenger av hvor vondt det gjør i dag: hvordan får de vite status nå? Mitt gjett: de sender e-post til kunden når noe mangler.

Restate after the interview (excerpt):

> **Hva vi må finne ut av om dashbordet**
>
> 1. Verdi: Vi tror at regnskapsførerne bruker mer enn én time i uka på å purre på manglende fakturaer.
> 2. Gjennomførbarhet: Vi tror at regnskapssystemene gir oss fakturastatus samme dag.
> 3. Levedyktighet: Vi tror at regnskapsbyråene vil betale for dashbordet som et tillegg.
>
> Det forutsetter det ikke: at kundene selv bruker dashbordet.
>
> Stemmer dette? Hvilke skal bli kort?
