# Hvordan vi jobber med antakelsestavlen

## Idéen

Hvert kort er en **antakelse**, ikke en oppgave. Alle i teknologi, design, forretning og produkt kan legge til kort, ta ansvar for å teste dem og legge ved bevis. Tavlen gjør det synlig for teamet og kunden hva vi tror, hva vi vet og hva vi har bygget på gjetning.

Seks prinsipper:

1. **Test antakelser, ikke hele ideer.** Små antakelser kan testes på noen dager.
2. **Test bare det som er viktig og usikkert.** Det som er lite risikabelt kan bygges med en gang.
3. **Bestem hva som er riktig før du ser resultatet.** En skrevet «vi har rett hvis…»-linje skiller bevis fra meninger.
4. **Å bygge på en gjetning er greit, så lenge det er merket.** Vi kaller det en `Bet`, setter en dato for oppfølging og måler.
5. **Discovery er hele teamets jobb.** Ikke bare designers eller produkteierens.
6. **Bevisene kan ligge hvor som helst, men konklusjonen ligger på kortet.** Repoet er beslutningsloggen.

## En levende tavle, ikke prosjektstyring

Tavlen er et arbeidsverktøy for å ta bedre beslutninger sammen. Den er ikke en rapport og ikke et styringssystem. Fyller teamet den ut fordi de må, har den mistet poenget.

- **Kortet kommer fra en faktisk usikkerhet.** Lag et kort når noen sier «jeg tror…» eller «jeg er ikke sikker på…» i en samtale, et møte eller en PR. Ingen kvote, og ingen utfylling i etterkant.
- **Spør alltid: hvilken beslutning hjelper dette oss med?** Kan ingen svare, slett kortet.
- **Start smått.** Kolonnene, «Vi tror at…» og en oppfølgingsdato er nok. Risikotype, Viktighet, Sikkerhet og Basis tar dere i bruk når backlogen blir så stor at dere trenger dem.
- **Reglene under er standardverdier.** Etter 3–4 uker: hva gjør vi bare fordi vi må? Fjern det.
- **Samtalen skjer på kortet.** Spørsmål og funn som kommentarer i issuen, ikke i egne statusrapporter. Kunden leser tavlen, ikke en egen rapport.
- **Ukesmøtet slutter når det ikke er mer å snakke om.** Skjer det lite, kutt det til 15 minutter eller hopp over en uke.

**Tegn på at tavlen er i ferd med å dø:** kortene oppdateres bare rett før en demo, det kommer ingen nye kort på to uker, ukesmøtet leser opp kort uten diskusjon, oppfølgingsdatoene passerer uten at noen bryr seg, eller felt ingen bruker eller filtrerer på. Slett, forenkle, eller spør teamet hvilken beslutning de står foran akkurat nå.

## Læringsmilepæler

Milepælene lager teamet selv, når dere trenger dem. Malen definerer ingen. En læringsmilepæl sier hva vi må vite, og innen når. Kortene som avgjør svaret, hører til milepælen. Eksemplene her er bare eksempler.

- **Formuler milepælen som et spørsmål vi skal kunne svare på.** For eksempel «Vi vet om automatisk fakturaimport er verdt å bygge (15. november)».
- **Knytt den til leveransemilepælen den avgjør,** hvis dere har en. «Vi kan ikke love M2 før dette er avklart.» Her blir discovery synlig for kunden.
- **Fremdriften måler læring, ikke leveranse.** En issue lukkes når beslutningen er tatt, ikke når noe er levert.
- **Én milepæl per kort, ett repo per kunde.** En issue kan bare ha én milepæl. Hører en antakelse til to, velg den den blokkerer først.
- **Avslutt milepælen med en oppsummering** i milepælens beskrivelse. Den er rapporten til kunden.

```markdown
**Det vi nå vet:** 
**Det vi fortsatt gjetter (Bets):** 
**Betydning for leveransen:** 
```

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
| Oppfølging | Dato | Alle åpne kort |
| Milestone | Læringsmilepælen kortet hører til | Når dere har milepæler |
| Risikotype | Verdi, Brukbarhet, Gjennomførbarhet, Levedyktighet | Når backlogen vokser |
| Viktighet | Høy, Middels, Lav | Når backlogen vokser |
| Sikkerhet | Lav, Middels, Høy | Når backlogen vokser |
| Basis | Validert, Bet | Når kortet forlater discovery |

**Oppfølging** er datoen vi senest ser på kortet igjen. Den er ikke en frist å bli målt på, men et signal:

- Under discovery: når vi venter svar.
- Neste opp og Backlog: når vi vil vurdere om kortet fortsatt er relevant (seks uker er et fornuftig utgangspunkt).
- Bet: når vi sjekker målingen.
- Validert og Ikke sant er avsluttet og trenger ingen dato.

Passerer datoen, er det ikke en forsinkelse. Det er et spørsmål i ukesmøtet: trenger vi dette fortsatt?

**Viktighet og Sikkerhet** er de to aksene vi prioriterer etter når backlogen er stor. Sikkerhet sier hvor godt bevisene i dag underbygger det vi mener. Viktig og usikkert testes først. Sikkerhet oppdateres når nye bevis kommer inn, også når svaret er at antakelsen ikke stemmer. På en Bet viser den hvor sikre vi var da vi valgte å bygge.

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

## Avhengigheter mellom kort

Noen antakelser kan ikke testes før andre er avklart. «Brukere av leverandør X godtar å koble felt én gang» gir ikke mening før vi vet at importen feiler for leverandør X. Bruk GitHubs avhengigheter:

- Åpne kortet → *Relationships* i sidepanelet → *Mark as blocked by* eller *Mark as blocking*. Krever minst triage-tilgang til repoet.
- Fra terminalen (GitHub CLI 2.94.0 eller nyere): `gh issue edit <nummer> --add-blocked-by <nummer eller URL>`.
- Et kort med åpne blokkere får et *Blocked*-ikon på tavlen. Ikke hent blokkerte kort til *Under discovery*.
- Blokkeren lukkes når beslutningen er tatt, og da er kortet fritt.
- Bruk det sparsomt, bare når rekkefølgen faktisk betyr noe. Lange kjeder av avhengigheter tyder på at kortene er for store, eller at dere planlegger i stedet for å lære.
- Deler dere opp et kort, bruk *sub-issues* eller lenk med `#123`.

## Kobling til dev-repo og dev-prosjekt

Hold discovery i eget repo og eget Project, og knytt det til utviklingen på tre måter:

1. **Leveranse-issuen blokkeres av antakelsen.** I dev-repoet markerer dere issuen som *blocked by* kortet i discovery-repoet. Dev-tavlen viser *Blocked*-ikonet til beslutningen er tatt, så utviklerne ser discovery uten å åpne en annen tavle. Eksempel (GitHub CLI 2.94.0 eller nyere):
   ```bash
   gh issue edit 456 --repo org/app \
     --add-blocked-by https://github.com/org/discovery/issues/123
   ```
2. **PR-malen** (`templates/dev-repo/pull_request_template.md`) kopieres til dev-repoet som `.github/pull_request_template.md`. Hver PR oppgir hvilken antakelse den bygger på og om den er `Validert` eller `Bet`.
3. **Lenk i tekst, begge veier,** som reserve: «Bygger på: org/discovery#123» i leveranse-issuen og «Leveranse: org/app#456» på kortet.

Når en Bet er lukket med bygging som beslutning, forsvinner blokkeringen, og leveransen kan gå videre. Beslutningen står på kortet.

**Alternativ:** ett felles Project for både discovery og leveranse, med et *Type*-felt og egne visninger. Det er enklere å koble, men blander to ulike flyter på én tavle. Det anbefaler vi ikke.

**Test før dere stoler på det:** per 14.10.2026 sier ikke GitHubs dokumentasjon eksplisitt at avhengigheter fungerer på tvers av repoer, eller når ikonet forsvinner, og det er ikke testet i ekte repoer ennå. Prøv først med to testrepoer, og sjekk at ikonet forsvinner når blokkeren lukkes.

## Syv avtaler

1. **Alle kan legge til kort, i riktig form.** Kortet starter med «Vi tror at…» og inneholder én konkret påstand.
2. **Hent det som er viktig og usikkert.** Når backlogen er stor, sorter etter Viktighet og Sikkerhet. Viktig og lite risikabelt kan gå rett til *Klar for implementering* som `Bet`. Uviktig og usikkert slettes.
3. **Ingen start uten «Vi har rett hvis…».** Skriv linjen før testen.
4. **Maks 3 kort under discovery, rundt én uke per kort.** Ligger et kort over to uker, tar flere i teamet det sammen, deler det opp eller stopper det.
5. **Alle åpne kort har en oppfølgingsdato.** Er den passert, avgjør teamet i ukesmøtet: ny dato, test, eller slett.
6. **Ingen utgang uten konklusjon.** Fyll ut «Beslutning og innsikt», sett Basis og lukk issuen. En `Bet` trenger i tillegg en måling og en oppfølgingsdato.
7. **Rydd Backlog hver uke.** Slå sammen duplikater, slett kort ingen ville savnet, hold den på rundt 15–40 kort.

Dette er avtaler som skal hjelpe, ikke krav som skal oppfylles. Føles en avtale som bare byråkrati, endre den.

### Når en test ikke gir svar

«Trenger mer research» er en tilstand, ikke en kolonne.

1. Skriv en kommentar om hva dere lærte og hva som fortsatt er uklart. Oppdater Sikkerhet hvis dere bruker den.
2. Legg kortet tilbake i *Neste opp* med en skarpere test, en ny «vi har rett hvis…» og en ny oppfølgingsdato.
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
| Ukentlig | Kort med passert oppfølgingsdato først, så `trenger-mer-research`. Nye beslutninger. Hent kort opp til grensen, rydd. Stopp når det ikke er mer å snakke om | Produkt, design, tech lead og alle som vil | 15–30 min |
| Demo / kundemøte | Gå gjennom kort som har flyttet seg siden sist, og fremdriften på læringsmilepælene | Produkt, med kunden | 5 min |
| Når en læringsmilepæl lukkes | Skriv oppsummeringen i milepælen og gå gjennom den med kunden | Produkt og teamet | 15 min |

**Roller:** kortets eier (hvilket som helst fag) kjører testen og skriver konklusjonen. Tavleholderen (produkteieren) holder ukesmøtet og hjelper teamet å holde tavlen levende, men eier ikke kortene. Produkttrioen (produkt, design, tech lead) avgjør prioritering ved uenighet. Kunden har lesetilgang og en plass i demoen.

## Kom i gang med teamet

Start med en 60 minutters workshop der teamet fyller tavlen sammen. Milepælene lager dere underveis, ut fra det dere trenger å vite.

1. Forklar tavlen og prinsippene, og vis de tre eksempelkortene (10 min).
2. Alle skriver antakelser stille, hver for seg, på tvers av fag: «Hva må være sant for at vi lykkes med det vi skal gjøre nå?» (15 min).
3. Skriv dem om til «Vi tror at…» og legg dem inn som kort. Grupper de som hører sammen, og gi gruppene en læringsmilepæl: hva vi må vite, og når (15 min).
4. Sett oppfølgingsdato på alle kortene. Sett Risikotype, Viktighet og Sikkerhet bare hvis dere trenger dem allerede (10 min).
5. Velg inntil 3 kort som går til *Under discovery*, og skriv «Vi har rett hvis…» for hver (10 min).

Tips: be en utvikler eie det første gjennomførbarhetskortet og vis resultatet av spiken i ukesmøtet. Da blir det tydelig at teknisk utforsking er discovery.

Etter 3–4 uker: er grensene riktige? Hva gjør vi bare fordi vi må? Hvilke kolonner og felt brukes ikke? Juster.

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
- [Creating issue dependencies, GitHub Docs](https://docs.github.com/ko/issues/tracking-your-work-with-issues/using-issues/creating-issue-dependencies) (siden åpnes på koreansk, bytt språk øverst på siden)
