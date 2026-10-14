# Hvordan vi jobber med antakelsestavlen

## Idéen

Hvert kort er en **antakelse**, ikke en oppgave. Alle i teknologi, design, forretning og produkt kan legge til kort, ta ansvar for å teste dem og legge ved bevis. Tavlen gjør det synlig for teamet og kunden hva vi tror, hva vi vet og hva vi har bygget på gjetning.

Seks prinsipper:

1. **Test antakelser, ikke hele ideer.** Små antakelser kan testes på noen dager.
2. **Test bare det som er viktig og usikkert.** Det som er lite risikabelt kan bygges med en gang.
3. **Bestem hva som er riktig før du ser resultatet.** En skrevet «vi har rett hvis…»-linje skiller bevis fra meninger.
4. **Å bygge på en gjetning er greit, så lenge det er merket.** Vi kaller det en `Bet` og følger det opp på en fast dato.
5. **Discovery er hele teamets jobb.** Ikke bare designers eller produkteierens.
6. **Bevisene kan ligge hvor som helst, konklusjonen ligger på kortet.** Repoet er beslutningsloggen.

## Læringsmilepæler

Discovery styres av læringsmilepæler. En læringsmilepæl sier hva vi må vite, og innen når. Hvert kort hører til én milepæl: antakelsene som avgjør svaret.

- **Formuler milepælen som et spørsmål vi skal kunne svare på.** For eksempel «LM1: Vi vet om automatisk fakturaimport er verdt å bygge (15. november)».
- **Knytt den til leveransemilepælen den avgjør.** «Vi kan ikke love M2 før LM1 er lukket.» Det er her discovery blir synlig for kunden.
- **Fremdriftslinjen måler læring.** Issues lukkes når beslutningen er tatt, ikke når noe er levert.
- **Avslutt milepælen med en oppsummering** i milepælens beskrivelse, i tre linjer:

```markdown
**Det vi nå vet:** 
**Det vi fortsatt gjetter (Bets):** 
**Betydning for leveransen:** 
```

Oppsummeringen er rapporten til kunden.

## Kolonnene

| Kolonne | Betyr | Grense |
| --- | --- | --- |
| Backlog | Alle antakelser noen har løftet, skrevet som «Vi tror at…» | Ingen, ryddes ukentlig |
| Neste opp | Prioritert og klar til test. Har en test og en «vi har rett hvis…»-linje | Maks 5 |
| Under discovery | En test pågår (intervju, prototype, dataanalyse, teknisk spike) | **Maks 3** |
| Klar for implementering | Kan bygges. Enten `Validert` eller en bevisst `Bet` | Ingen |
| Implementert | Bygget og levert | Ingen |
| Ikke sant | Bevis viser at antakelsen ikke holder. Vi dropper eller endrer retning | Ingen |

## Feltene

| Felt | Verdier | Brukes |
| --- | --- | --- |
| Milestone | Læringsmilepælen kortet hører til | Alle kort |
| Risikotype | Verdi, Brukbarhet, Gjennomførbarhet, Levedyktighet | Alle kort |
| Viktighet | Høy, Middels, Lav | Alle kort |
| Sikkerhet | Lav, Middels, Høy | Alle kort |
| Basis | Validert, Bet | Når kortet forlater discovery |
| Oppfølging | Dato | Bare på Bet-kort |

**Viktighet og Sikkerhet** er de to aksene vi prioriterer etter. Sikkerhet sier hvor godt bevisene i dag underbygger det vi mener. Viktig og usikkert testes først. Sikkerhet oppdateres når nye bevis kommer inn, også når svaret er at antakelsen ikke stemmer. På en Bet viser den hvor sikre vi var da vi valgte å bygge.

**Risikotype** er en farget etikett, ikke egne baner: Verdi (vil kundene ha det?), Brukbarhet (kan de bruke det?), Gjennomførbarhet (kan vi bygge det?) og Levedyktighet (er det lønnsomt og lovlig for oss?).

## Kortet

Fire felt i issuen: **Vi tror at…**, **Vi tester ved å…**, **Vi har rett hvis…** og **Beslutning og innsikt**. Eier settes med *Assignees*. Underveis legges bevis som kommentarer.

Når kortet forlater discovery, fylles **Beslutning og innsikt** ut i selve issuen:

```markdown
**Beslutning:** Validert / Bet / Ikke sant
**Det vi så:** 1–3 setninger
**Produktimplikasjon:** hva dette betyr for det vi bygger
**Bevis:** lenke til konkret frame eller dokument, med dato
**Hvis Bet, måling vi følger:** 
```

Tre ferdige eksempler, ett for hver beslutning, ligger i [EKSEMPELKORT.md](EKSEMPELKORT.md).

## Bevis og innsikt

Bevisene ligger der teamet jobber: Miro, Figma, Dovetail, regneark, kode. Konklusjonen ligger på kortet. Leveranseteamet og kunden leser kortet, ikke Miro-tavlen, og tavler endrer seg, lenker brytes og kunden har kanskje ikke tilgang.

- **Konklusjonen skal kunne leses alene.** «Det vi så» og «Produktimplikasjon» skal gi mening uten å åpne lenken.
- **Lenk til en konkret frame eller et dokument, ikke en hel tavle.** Skriv datoen.
- **Lim inn et skjermbilde eller et kort utdrag** når beviset er sentralt.
- **Ingen personopplysninger i issues.** Lenk til oppsummeringer, ikke til opptak, navn eller rådata fra intervjuer.

## Seks regler

1. **Alle kan legge til kort, i riktig form.** Kortet starter med «Vi tror at…», inneholder én konkret påstand og hører til en læringsmilepæl.
2. **Hent det som er viktig og usikkert.** Sorter Backlog etter Viktighet og Sikkerhet. Viktig og lite risikabelt kan gå rett til *Klar for implementering* som `Bet`. Uviktig og usikkert slettes.
3. **Ingen start uten «Vi har rett hvis…».** Skriv linjen før testen.
4. **Maks 3 kort under discovery, rundt én uke per kort.** Ligger et kort over to uker, tar flere i teamet det sammen, deler det opp eller stopper det.
5. **Ingen utgang uten konklusjon.** Fyll ut «Beslutning og innsikt», sett Basis og lukk issuen. En `Bet` trenger en måling og en oppfølgingsdato.
6. **Rydd Backlog hver uke.** Slå sammen duplikater, slett kort ingen ville savnet, hold den på rundt 15–40 kort. Kort uten bevegelse på seks uker får en beslutning: behold eller slett.

### Når en test ikke gir svar

«Trenger mer research» er en tilstand, ikke en kolonne.

1. Skriv en kommentar om hva dere lærte og hva som fortsatt er uklart. Oppdater Sikkerhet.
2. Legg kortet tilbake i *Neste opp* med en skarpere test og en ny «vi har rett hvis…».
3. Sett etiketten `trenger-mer-research` mens det venter. Fjern den når neste test starter.
4. Var testen delvis nyttig, del kortet: behold det som er avklart og lag et nytt, smalere kort for resten.

Et kort kan bare sendes tilbake **én** gang. Er neste test også uklar, bestemmer teamet i ukesmøtet: bli en `Bet` eller flytt til *Ikke sant*. Kort med etiketten teller med i grensen på 5 i *Neste opp*.

### Når en Bet skal følges opp

På oppfølgingsdatoen ser teamet på målingen og velger én av tre:

- **Målingen holder:** sett Basis til `Validert` og skriv hva dere så.
- **Målingen holder ikke:** flytt kortet til *Ikke sant* og lag et nytt kort for det som må endres.
- **For tidlig å si:** sett en ny dato, én gang.

## Rutiner

| Når | Hva | Hvem | Tid |
| --- | --- | --- | --- |
| Daglig | Siste del av standup: hva lærte vi, hva er neste test, hvem kan hjelpe | De som jobber med kortene. Andre kan gå | 2–3 min |
| Ukentlig | Kort med `trenger-mer-research` først. Bets med passert oppfølgingsdato. Nye beslutninger. Prioriter Backlog, hent kort opp til grensen, rydd | Produkt, design, tech lead og alle som vil | 30 min |
| Demo / kundemøte | Gå gjennom kort som har flyttet seg siden sist, og fremdriften på læringsmilepælene | Produkt, med kunden | 5 min |
| Når en læringsmilepæl lukkes | Skriv oppsummeringen i milepælen og gå gjennom den med kunden | Produkt og teamet | 15 min |

**Roller:** kortets eier (hvilket som helst fag) kjører testen og skriver konklusjonen. Tavleholderen (produkteieren) holder ukesmøtet og passer på reglene, men eier ikke kortene. Produkttrioen (produkt, design, tech lead) avgjør prioritering ved uenighet og eier læringsmilepælene. Kunden har lesetilgang og en plass i demoen.

## Kobling til leveranse

PR-malen (`.github/pull_request_template.md`) kopieres til leveranserepoene. Hver PR oppgir da hvilken antakelse den bygger på og om den er `Validert` eller `Bet`. Utviklere som tar et valg basert på noe vi ikke vet, lager et nytt kort. Slik blir discovery en del av utviklernes egen arbeidsflyt.

## Kom i gang med teamet

Før workshopen: definer 1–3 læringsmilepæler sammen med kunden, og opprett dem i repoet.

Workshop, 60 minutter:

1. Forklar tavlen og prinsippene, og vis de tre eksempelkortene (10 min).
2. Alle skriver antakelser stille, hver for seg, på tvers av fag: «Hva må være sant for at vi når denne milepælen?» (15 min).
3. Skriv dem om til «Vi tror at…» og legg dem inn som kort under riktig milepæl (15 min).
4. Sett Risikotype, Viktighet og Sikkerhet sammen (10 min).
5. Velg inntil 3 kort som går til *Under discovery*, og skriv «Vi har rett hvis…» for hver (10 min).

Tips: be en utvikler eie det første gjennomførbarhetskortet og vis resultatet av spiken i ukesmøtet. Da blir det tydelig at teknisk utforsking er discovery.

Etter 3–4 uker: er grensene riktige? Hvilke kolonner og felt brukes ikke? Juster.

## Kilder

- [The Hypothesis Prioritization Canvas, Jeff Gothelf](https://jeffgothelf.com/blog/the-hypothesis-prioritization-canvas/)
- [Lean UX, kapittel 3, Gothelf og Seiden](https://www.oreilly.com/library/view/lean-ux/9781449366834/ch03.html)
- [Assumptions Mapping, David Bland, Strategyzer](https://strategyzer.com/library/how-assumptions-mapping-can-focus-your-teams-on-running-experiments-that-matter)
- [Assumption testing, Teresa Torres, Product Talk](https://www.producttalk.org/assumption-testing/)
- [Product Discovery Recipes, Jeff Patton](https://andrewclark.super.site/all-media/product-discovery-recipes)
- [The Test Card og The Learning Card, Strategyzer](https://assets.strategyzer.com/assets/resources/the-test-card.pdf)
- [Discovery og leveranse på en kanban-tavle, Scrum.org](https://www.scrum.org/resources/blog/how-manage-discovery-and-delivery-work-kanban-board)
- [Discovery Kanban, Kanban Zone](https://kanbanzone.com/2020/improve-product-research-and-design-with-discovery-kanban/)
- [Assumptions Board, thoughtbot](https://thoughtbot.com/playbook/customer-discovery/initial-alignment)
