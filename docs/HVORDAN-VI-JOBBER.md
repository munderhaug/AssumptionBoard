# Hvordan vi jobber med antakelsestavlen

## Idéen

Hvert kort er en **antakelse**, ikke en oppgave. Alle i teknologi, design, forretning og produkt kan legge til kort, ta ansvar for å teste dem og legge ved bevis. Tavlen gjør det synlig for teamet og kunden hva vi tror, hva vi vet og hva vi har bygget på gjetning.

Fem prinsipper:

1. **Test antakelser, ikke hele ideer.** Små antakelser kan testes på noen dager.
2. **Test bare det som er viktig og lite bevist.** Det som er lite risikabelt kan bygges med en gang.
3. **Bestem hva som er riktig før du ser resultatet.** En skrevet «vi har rett hvis…»-linje skiller bevis fra meninger.
4. **Å bygge på en gjetning er greit, så lenge det er merket.** Vi kaller det en `Bet` og følger det opp.
5. **Discovery er hele teamets jobb.** Ikke bare designers eller produkteierens.

## Kolonnene

| Kolonne | Betyr | Grense |
| --- | --- | --- |
| Backlog | Alle antakelser noen har løftet, skrevet som «Vi tror at…» | Ingen, ryddes ukentlig |
| Neste opp | Prioritert og klar til test. Har en test og en «vi har rett hvis…»-linje | Maks 5 |
| Under discovery | En test pågår (intervju, prototype, dataanalyse, teknisk spike) | **Maks 3** |
| Klar for implementering | Kan bygges. Enten `Validert` eller en bevisst `Bet` | Ingen |
| Implementert | Bygget og levert | Ingen |
| Ikke sant | Bevis viser at antakelsen ikke holder. Vi dropper eller endrer retning | Ingen |

**Basis** settes på alle kort som har forlatt discovery:

- `Validert`: vi har bevis, og lenken ligger på kortet.
- `Bet`: vi bygger uten å ha testet, med vilje. Kortet må si hvilken måling vi følger og når vi ser på det igjen.

**Risikotype** er en farget etikett, ikke egne baner: Verdi (vil kundene ha det?), Brukbarhet (kan de bruke det?), Gjennomførbarhet (kan vi bygge det?) og Levedyktighet (er det lønnsomt og lovlig for oss?).

## Kortet

Fire tekstfelt i issuen: **Vi tror at…**, **Vi tester ved å…**, **Vi har rett hvis…**, **Vi lærte / derfor…**. Eier settes med *Assignees*. Bevis legges som lenker eller kommentarer.

Eksempel (gjennomførbarhet):

> **Vi tror at** vi kan importere 80 % av kundenes fakturaer automatisk fra deres eksisterende regnskapseksporter, uten manuell kobling av felt.
>
> **Vi tester ved å** kjøre en spike på to dager som leser 30 ekte eksportfiler fra tre pilotkunder.
>
> **Vi har rett hvis** minst 24 av 30 filer importeres uten manuell feltkobling.
>
> **Vi lærte / derfor:** 19 av 30 gikk gjennom. Alle feilene kom fra én leverandørs datoformat. Vi bygger med manuell kobling for leverandør X og lager et nytt kort: «Brukere av leverandør X godtar å koble felt én gang.»

## Seks regler

1. **Alle kan legge til kort, i riktig form.** Kortet starter med «Vi tror at…» og inneholder én konkret påstand.
2. **Hent bare det som er viktig og lite bevist.** Sorter Backlog etter Viktighet og hvor lite bevis dere har. Viktig og lite risikabelt kan gå rett til *Klar for implementering* som `Bet`. Uviktig og risikabelt slettes.
3. **Ingen start uten «Vi har rett hvis…».** Skriv linjen før testen.
4. **Maks 3 kort under discovery, rundt én uke per kort.** Ligger et kort over to uker, tar flere i teamet det sammen, deler det opp eller stopper det.
5. **Ingen utgang uten bevis.** Minst én lenke eller ett notat, og en linje som sier «derfor skal vi…». En `Bet` trenger i stedet en måling og en dato for oppfølging.
6. **Rydd Backlog hver uke.** Slå sammen duplikater, slett kort ingen ville savnet, hold den på rundt 15–40 kort. Kort uten bevegelse på seks uker får en beslutning: behold eller slett.

### Når en test ikke gir svar

«Trenger mer research» er en tilstand, ikke en kolonne.

1. Skriv en kommentar om hva dere lærte og hva som fortsatt er uklart.
2. Legg kortet tilbake i *Neste opp* med en skarpere test og en ny «vi har rett hvis…».
3. Sett etiketten `trenger-mer-research` mens det venter. Fjern den når neste test starter.
4. Var testen delvis nyttig, del kortet: behold det som er avklart og lag et nytt, smalere kort for resten.

Et kort kan bare sendes tilbake **én** gang. Er neste test også uklar, bestemmer teamet i ukesmøtet: bli en `Bet` eller flytt til *Ikke sant*. Kort med etiketten teller med i grensen på 5 i *Neste opp*.

## Rutiner

| Når | Hva | Hvem | Tid |
| --- | --- | --- | --- |
| Daglig | Siste del av standup: hva lærte vi, hva er neste test, hvem kan hjelpe | De som jobber med kortene. Andre kan gå | 2–3 min |
| Ukentlig | Les opp nye Validert- og Ikke sant-kort, ta etiketten `trenger-mer-research` først, prioriter Backlog, hent kort opp til grensen, rydd | Produkt, design, tech lead og alle som vil | 30 min |
| Demo / kundemøte | Gå gjennom kort som har flyttet seg siden sist | Produkt, med kunden | 5 min |
| Månedlig | Gå gjennom `Bet`-kort i *Implementert*: sjekk målingen, gjør hvert kort `Validert` eller flytt det til *Ikke sant* | Del av ukesmøtet | 10 min |

**Roller:** kortets eier (hvilket som helst fag) kjører testen og legger ved bevis. Tavleholderen (produkteieren) holder ukesmøtet og passer på reglene, men eier ikke kortene. Produkttrioen (produkt, design, tech lead) avgjør prioritering ved uenighet. Kunden har lesetilgang og en plass i demoen.

## Beslutningsnotat

Når et kort forlater discovery, legg igjen én kommentar i denne formen:

```markdown
**Beslutning:** Validert / Bet / Ikke sant / Trenger mer research
**Bevis:** lenke eller notat
**Derfor:** hva vi gjør nå
**Hvis Bet:** måling vi følger og dato for oppfølging
```

## Kom i gang med teamet

Start med en 60 minutters workshop der teamet fyller tavlen sammen:

1. Forklar tavlen og de fem prinsippene (10 min).
2. Alle skriver antakelser stille, hver for seg, på tvers av fag: «Hva må være sant for at dette lykkes?» (15 min).
3. Skriv dem om til «Vi tror at…» og legg dem inn som kort (15 min).
4. Sett Risikotype og Viktighet sammen (10 min).
5. Velg inntil 3 kort som går til *Under discovery*, og skriv «Vi har rett hvis…» for hver (10 min).

Tips: be en utvikler eie det første gjennomførbarhetskortet og vis resultatet av spiken i ukesmøtet. Da blir det tydelig at teknisk utforsking er discovery.

Etter 3–4 uker: er grensene riktige? Hvilke kolonner og felt brukes ikke? Juster.

## Kilder

- [The Hypothesis Prioritization Canvas, Jeff Gothelf](https://jeffgothelf.com/blog/the-hypothesis-prioritization-canvas/)
- [Lean UX, kapittel 3, Gothelf og Seiden](https://www.oreilly.com/library/view/lean-ux/9781449366834/ch03.html)
- [Assumptions Mapping, David Bland, Strategyzer](https://strategyzer.com/library/how-assumptions-mapping-can-focus-your-teams-on-running-experiments-that-matter)
- [Assumption testing, Teresa Torres, Product Talk](https://www.producttalk.org/assumption-testing/)
- [Product Discovery Recipes, Jeff Patton](https://andrewclark.super.site/all-media/product-discovery-recipes)
- [The Test Card, Strategyzer](https://assets.strategyzer.com/assets/resources/the-test-card.pdf)
- [Discovery og leveranse på en kanban-tavle, Scrum.org](https://www.scrum.org/resources/blog/how-manage-discovery-and-delivery-work-kanban-board)
- [Discovery Kanban, Kanban Zone](https://kanbanzone.com/2020/improve-product-research-and-design-with-discovery-kanban/)
- [Assumptions Board, thoughtbot](https://thoughtbot.com/playbook/customer-discovery/initial-alignment)
