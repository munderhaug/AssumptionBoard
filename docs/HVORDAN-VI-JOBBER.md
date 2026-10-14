# Hvordan vi jobber med antakelsestavlen

## Idéen

Hvert kort er noe teamet ikke vet ennå, ikke en oppgave. Det er enten en **antakelse** vi tester («Vi tror at…»), eller en **utforsking** av noe vi må forstå før vi vet hva vi tror («Vi vil forstå…»). Alle i teknologi, design, forretning og produkt kan legge til kort, ta ansvar for dem og legge ved bevis. Tavlen gjør det synlig for teamet og kunden hva vi tror, hva vi vet og hva vi har bygget på gjetning.

Syv prinsipper:

1. **Utforsk det dere ikke forstår, og test det dere tror.** Begge deler er discovery. Se [Utforske og teste](#utforske-og-teste).
2. **Test antakelser, ikke hele ideer.** Små antakelser kan testes på noen dager.
3. **Test bare det som er viktig og usikkert.** Det som er lite risikabelt kan bygges med en gang.
4. **Bestem hva som er riktig før du ser resultatet.** En skrevet «vi har rett hvis…»-linje skiller bevis fra meninger.
5. **Å bygge på en gjetning er greit, så lenge det er merket.** Vi kaller det en `Bet`, setter en dato for oppfølging og måler.
6. **Discovery er hele teamets jobb.** Ikke bare designers eller produkteierens.
7. **Bevisene kan ligge hvor som helst, men konklusjonen ligger på kortet.** Repoet er beslutningsloggen.

## En levende tavle, ikke prosjektstyring

Tavlen er et arbeidsverktøy for å ta bedre beslutninger sammen. Den er ikke en rapport og ikke et styringssystem. Fyller teamet den ut fordi de må, har den mistet poenget.

- **Kortet kommer fra en faktisk usikkerhet.** Lag et kort når noen sier «jeg tror…», «jeg er ikke sikker på…» eller «vi vet ikke hvordan…» i en samtale, et møte eller en PR, eller når et spørsmål, en idé eller en funksjon skjuler noe dere ikke vet (se [Fra spørsmål til kort](#fra-spørsmål-til-kort)). Ingen kvote, og ingen utfylling i etterkant.
- **Spør alltid: hvilken beslutning hjelper dette oss med?** Kan ingen svare, slett kortet.
- **Start smått.** Kolonnene, de to skjemaene og en oppfølgingsdato er nok. Risikotype, Viktighet, Sikkerhet og Basis tar dere i bruk når backlogen blir så stor at dere trenger dem.
- **Reglene under er standardverdier.** Etter 3–4 uker: hva gjør vi bare fordi vi må? Fjern det.
- **Samtalen skjer på kortet.** Spørsmål og funn som kommentarer i issuen, ikke i egne statusrapporter. Kunden leser tavlen, ikke en egen rapport.
- **Ukesmøtet slutter når det ikke er mer å snakke om.** Skjer det lite, kutt det til 15 minutter eller hopp over en uke.

**Tegn på at tavlen er i ferd med å dø:** kortene oppdateres bare rett før en demo, det kommer ingen nye kort på to uker, ukesmøtet leser opp kort uten diskusjon, oppfølgingsdatoene passerer uten at noen bryr seg, eller felt ingen bruker eller filtrerer på. Slett, forenkle, eller spør teamet hvilken beslutning de står foran akkurat nå.

## Læringsmilepæler

Milepælene lager teamet selv, når dere trenger dem. Malen definerer ingen. En læringsmilepæl er et læringsmål: hva vi må vite, innen når, og hvilket utfall det skal føre til. Kortene som hjelper å svare, hører til milepælen, både antakelser og utforskinger. Eksemplene her er bare eksempler.

- **Formuler milepælen som et spørsmål vi skal kunne svare på.** For eksempel «Vi vet om automatisk fakturaimport er verdt å bygge (15. november)».
- **Knytt den til leveransemilepælen den avgjør,** hvis dere har en. «Vi kan ikke love M2 før dette er avklart.» Her blir discovery synlig for kunden.
- **Knytt hvert kort til milepælen det hjelper å svare på.** Velg den under *Milestone* i sidepanelet på kortet. Visningen *Milepæler* viser da fremdriften per læringsmål.
- **Fremdriften måler læring, ikke leveranse.** En issue lukkes når beslutningen er tatt eller innsikten er skrevet, ikke når noe er levert.
- **Én milepæl per kort, ett repo per kunde.** En issue kan bare ha én milepæl. Hører et kort til to, velg den det blokkerer først.
- **Avslutt milepælen med en oppsummering** i milepælens beskrivelse. Den er rapporten til kunden.

```markdown
**Det vi nå vet:** 
**Det vi fortsatt gjetter (Bets):** 
**Det vi har sett, men ikke testet:** 
**Betydning for leveransen:** 
```

## Kolonnene

| Kolonne | Betyr | Grense |
| --- | --- | --- |
| Backlog | Alle antakelser og utforskinger noen har løftet | Ingen, ryddes ukentlig |
| Neste opp | Prioritert og klar til å starte. En antakelse har en test og en «Vi har rett hvis…»-linje. En utforsking har en metode og en «Vi er ferdige når…»-linje | Maks 5 |
| Under discovery | En test eller en utforsking pågår (intervju, observasjon, prototype, dataanalyse, teknisk spike) | **Maks 3**, begge typene til sammen |
| Klar for implementering | En antakelse som kan bygges. Enten `Validert` eller en bevisst `Bet` | Ingen |
| Implementert | Bygget og levert | Ingen |
| Ikke sant | Bevis viser at antakelsen ikke holder. Vi dropper eller endrer retning | Ingen |
| Innsikt | En avsluttet utforsking. Det vi så står på kortet, og de nye kortene er lenket | Ingen |

Antakelser ender i *Klar for implementering*, *Implementert* eller *Ikke sant*. Utforskinger ender i *Innsikt*. Sammen viser de fire sluttkolonnene det vi vet nå: hva som er testet og holder, hva som er testet og ikke holder, hva vi bevisst bygger på gjetning (Bet), og hva vi har sett, men ikke testet (Innsikt). Visningen *Det vi vet* viser dem samlet ([oppsett, steg 6](OPPSETT.md#6-visninger)). De er likevel egne kolonner, fordi innsikt fra en utforsking ikke er testet. Den gir grunnlag for nye antakelser, ikke bevis.

## Feltene

| Felt | Verdier | Brukes |
| --- | --- | --- |
| Oppfølging | Dato | Alle åpne kort |
| Milestone | Læringsmilepælen kortet hører til | Når dere har milepæler |
| Risikotype | Verdi, Brukbarhet, Gjennomførbarhet, Levedyktighet | Når backlogen vokser |
| Viktighet | Høy, Middels, Lav | Når backlogen vokser |
| Sikkerhet | Lav, Middels, Høy | Når backlogen vokser, på antakelser |
| Basis | Validert, Bet | Når en antakelse forlater discovery |

**Oppfølging** er datoen vi senest ser på kortet igjen. Den er ikke en frist å bli målt på, men et signal:

- Under discovery: når vi venter svar. For en utforsking er det datoen vi senest stopper.
- Neste opp og Backlog: når vi vil vurdere om kortet fortsatt er relevant (seks uker er et fornuftig utgangspunkt).
- Bet: når vi sjekker målingen.
- Validert, Ikke sant og Innsikt er avsluttet og trenger ingen dato.

Passerer datoen, er det ikke en forsinkelse. Det er et spørsmål i ukesmøtet: trenger vi dette fortsatt?

**Viktighet og Sikkerhet** er de to aksene vi prioriterer etter når backlogen er stor. Sikkerhet sier hvor godt bevisene i dag underbygger det vi mener. Viktig og usikkert testes først. Sikkerhet oppdateres når nye bevis kommer inn, også når svaret er at antakelsen ikke stemmer. På en Bet viser den hvor sikre vi var da vi valgte å bygge.

**Risikotype** er en farget etikett, ikke egne baner: Verdi (vil kundene ha det?), Brukbarhet (kan de bruke det?), Gjennomførbarhet (kan vi bygge det?) og Levedyktighet (er det lønnsomt og lovlig for oss?).

## Utforske og teste

Discovery er både å utforske og å teste. Når dere ikke vet nok til å tro noe bestemt, utforsker dere. Når dere vet hva dere tror, tester dere. Begge er kort på samme tavle, i samme Backlog og under samme grense.

| | Antakelse | Utforsking |
| --- | --- | --- |
| Tittel | «Vi tror at …» | «Vi vil forstå …» |
| Hvordan | «Vi tester ved å …» | «Vi utforsker ved å …» |
| Skrives før start | «Vi har rett hvis …»: linjen som skiller bestått fra ikke bestått | «Vi er ferdige når …»: stoppregelen |
| Resultat | En beslutning: Validert, Bet eller Ikke sant | Innsikt, nye kort og nye spørsmål |
| Ender i | *Klar for implementering*, *Implementert* eller *Ikke sant* | *Innsikt* |

**Hvilken type?** Kan dere skrive en «Vi har rett hvis…»-linje som kan vise seg å være feil? Da er det en antakelse. Hvis ikke, utforsk først. Et ja/nei-spørsmål («Vil de betale?») skjuler ofte en antakelse: skriv hva dere tror, og test det. Spørsmål om hvordan, hvorfor og hva («Hvordan jobber de i dag?») blir ofte en utforsking.

Tegn på at dere bør utforske:

- Dere vet ikke hvem som har problemet, eller hvordan de løser det i dag.
- Teamet er uenig om hva det tror, eller alle gjetningene er like usikre.
- Dere går inn i et nytt område, en ny brukergruppe eller et nytt marked.
- Noe overrasket dere: en test ga et svar ingen forstår, eller brukerne gjorde noe ingen hadde sett for seg.

**En utforsking har en stoppregel.** Skriv «Vi er ferdige når…» før dere starter, for eksempel «etter seks samtaler eller to uker, det som kommer først». Sett Oppfølging til datoen dere senest stopper. Dere kan stoppe tidligere, når dere vet nok til å skrive antakelsene.

**Når stoppregelen slår inn, stopper dere.** Skriv det dere så, også om det føles uferdig. Trenger dere mer, lag en ny og smalere utforsking i stedet for å flytte datoen.

**En utforsking ender i innsikt og nye kort.** Fyll ut «Innsikt» på kortet, lag de nye kortene og lenk begge veier: «Kommer fra #7» på de nye kortene, og numrene deres under «Nye kort» på utforskingen. Lukk issuen og flytt den til *Innsikt*. Ga den ingen nye kort, skriv hvorfor. Det er også et svar.

**Innsikt fra en utforsking er ikke bevis.** Det dere så i seks samtaler, er et godt grunnlag for å tro noe, men ikke en test av det. Det dere skal bygge på, blir en antakelse som testes, eller en bevisst Bet.

**Spør om det folk faktisk gjorde.** «Fortell om sist du …» gir bedre svar enn «Ville du brukt …?». Det folk sier de vil gjøre, er en dårlig spådom om hva de gjør.

Tegn på ubalanse:

- **Bare antakelser:** teamet tester bare det det allerede tror, og det er lenge siden noen utforsket noe.
- **Bare utforsking:** utforskingene blir ikke til kort, eller stoppdatoen flyttes gang på gang.

Grensen på 3 under discovery gjelder begge typene. Det er der dere bestemmer balansen, i ukesmøtet.

## Fra spørsmål til kort

Teamet vet sjelden hva antakelsene er. Det dere har, er spørsmål, en idé, en funksjon som skal bygges, eller noe som allerede er bygd. Antakelsene ligger skjult i dem.

1. **Finn det dere må finne ut av.** Spør fra alle fire perspektivene, ikke bare design:
   - **Produkt (Verdi):** hvem har problemet, og hva skal endre seg for dem?
   - **Design (Brukbarhet):** hva må brukerne forstå eller gjøre for at det skal virke?
   - **Teknologi (Gjennomførbarhet):** hva er vi avhengige av som vi ikke har prøvd?
   - **Forretning (Levedyktighet):** hvem betaler, hva koster det å drifte, og finnes det juridiske grenser?

   Er noe allerede bygd, spør: hva antok vi da vi bygde det, og hva vet vi nå?
2. **Skriv om hvert spørsmål til det dere tror er svaret.** «Vi vet ikke om pilotkundene vil laste opp selv» blir «Vi tror at minst halvparten av pilotkundene vil laste opp fakturaer selv». Det er en antakelse. Har dere ingen formening ennå, er det en utforsking: «Vi vil forstå hvordan fakturaene kommer til regnskapsføreren i dag». Kan noen bare svare på spørsmålet, spør dem i stedet.
3. **Ta bare med det som er viktig og usikkert.** Lenk til det dere allerede vet. Det som er viktig og ganske sikkert, kan bli en Bet. Start med de to–tre som ville kostet mest å ta feil av.

Spørsmål som hører sammen, blir ofte en læringsmilepæl: det dere må vite, og innen når.

## Kortene

En **antakelse** har fire felt i issuen: **Vi tror at…**, **Vi tester ved å…**, **Vi har rett hvis…** og **Beslutning og innsikt**. En **utforsking** har også fire: **Vi vil forstå…**, **Vi utforsker ved å…**, **Vi er ferdige når…** og **Innsikt**. Eier settes med *Assignees*. Underveis legges bevis som kommentarer.

Når en antakelse forlater discovery, fylles **Beslutning og innsikt** ut i selve issuen:

```markdown
**Beslutning:** Validert / Bet / Ikke sant
**Det vi så:** 1–3 setninger
**Produktimplikasjon:** hva dette betyr for det vi bygger
**Bevis:** lenke til konkret frame eller dokument, med dato
**Hvis Bet, måling vi følger:** 
```

Når en utforsking avsluttes, fylles **Innsikt** ut:

```markdown
**Det vi så:** 1–3 setninger om mønstre, med antall, for eksempel «i 5 av 6 samtaler …»
**Nye kort:** #23, #24
**Nye spørsmål:** det vi fortsatt ikke vet, og som ikke er kort ennå
**Bevis:** lenke til oppsummeringen, med dato
```

Fire ferdige eksempler, én utforsking og tre antakelser med hver sin beslutning, ligger i [EKSEMPELKORT.md](EKSEMPELKORT.md).

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
- En antakelse kan også vente på en utforsking. Marker den som blokkert av utforskingen.
- Bruk det sparsomt, bare når rekkefølgen faktisk betyr noe. Lange kjeder av avhengigheter tyder på at kortene er for store, eller at dere planlegger i stedet for å lære.
- Deler dere opp et kort, bruk *sub-issues* eller lenk med `#123`.

## Kobling til dev-repo og dev-prosjekt

Hold discovery i eget repo og eget Project, og knytt det til utviklingen på tre måter:

1. **Leveranse-issuen blokkeres av antakelsen.** I dev-repoet markerer dere issuen som *blocked by* kortet i discovery-repoet. Bruk bare antakelser til dette. En utforsking gir nye antakelser, og det er dem leveransen venter på. Dev-tavlen viser *Blocked*-ikonet til beslutningen er tatt, så utviklerne ser discovery uten å åpne en annen tavle. Eksempel (GitHub CLI 2.94.0 eller nyere):
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

1. **Alle kan legge til kort, i riktig form.** En antakelse starter med «Vi tror at…» og inneholder én konkret påstand. En utforsking starter med «Vi vil forstå…» og inneholder ett spørsmål.
2. **Hent det som er viktig og usikkert.** Når backlogen er stor, sorter etter Viktighet og Sikkerhet. En utforsking er usikker per definisjon, så der teller bare Viktighet. Viktig og lite risikabelt kan gå rett til *Klar for implementering* som `Bet`. Uviktig og usikkert slettes.
3. **Ingen start uten en linje skrevet på forhånd.** «Vi har rett hvis…» for en antakelse, «Vi er ferdige når…» for en utforsking.
4. **Maks 3 kort under discovery, begge typene til sammen.** En antakelse tar rundt én uke, en utforsking stopper når stoppregelen sier det. Ligger et kort over to uker, tar flere i teamet det sammen, deler det opp eller stopper det.
5. **Alle åpne kort har en oppfølgingsdato.** Er den passert, avgjør teamet i ukesmøtet: ny dato, test, eller slett. For en utforsking under discovery er datoen stoppdatoen: da stopper dere og skriver det dere så.
6. **Ingen utgang uten konklusjon.** En antakelse: fyll ut «Beslutning og innsikt», sett Basis og lukk issuen. En `Bet` trenger i tillegg en måling og en oppfølgingsdato. En utforsking: fyll ut «Innsikt», lenk de nye kortene, lukk issuen og flytt den til *Innsikt*.
7. **Rydd Backlog hver uke.** Slå sammen duplikater, slett kort ingen ville savnet, hold den på rundt 15–40 kort.

Dette er avtaler som skal hjelpe, ikke krav som skal oppfylles. Føles en avtale som bare byråkrati, endre den.

### Når en test ikke gir svar

«Trenger mer research» er en tilstand, ikke en kolonne.

1. Skriv en kommentar om hva dere lærte og hva som fortsatt er uklart. Oppdater Sikkerhet hvis dere bruker den.
2. Legg kortet tilbake i *Neste opp* med en skarpere test, en ny «vi har rett hvis…» og en ny oppfølgingsdato.
3. Sett etiketten `trenger-mer-research` mens det venter. Fjern den når neste test starter.
4. Var testen delvis nyttig, del kortet: behold det som er avklart og lag et nytt, smalere kort for resten.

Et kort kan bare sendes tilbake **én** gang. Er neste test også uklar, bestemmer teamet i ukesmøtet: bli en `Bet` eller flytt til *Ikke sant*. Kort med etiketten teller med i grensen på 5 i *Neste opp*.

**Viste testen at dere ikke vet nok til å tro noe bestemt,** utforsk i stedet for å teste på nytt. Lag en utforsking, flytt antakelsen tilbake til *Backlog* og marker den som blokkert av utforskingen. Når utforskingen er ferdig, skriver dere antakelsen om, eller sletter den.

### Når en Bet skal følges opp

På oppfølgingsdatoen ser teamet på målingen og velger én av tre:

- **Målingen holder:** sett Basis til `Validert` og skriv hva dere så.
- **Målingen holder ikke:** flytt kortet til *Ikke sant* og lag et nytt kort for det som må endres.
- **For tidlig å si:** sett en ny dato, én gang.

## Rutiner

| Når | Hva | Hvem | Tid |
| --- | --- | --- | --- |
| Daglig | Siste del av standup: hva lærte vi, hva er neste test eller samtale, hvem kan hjelpe | De som jobber med kortene. Andre kan gå | 2–3 min |
| Ukentlig | Kort med passert oppfølgingsdato først, så `trenger-mer-research`. Nye beslutninger og ny innsikt. Hent kort opp til grensen, og se på balansen mellom å utforske og å teste. Rydd. Stopp når det ikke er mer å snakke om | Produkt, design, tech lead og alle som vil | 15–30 min |
| Demo / kundemøte | Gå gjennom kort som har flyttet seg siden sist, og fremdriften på læringsmilepælene | Produkt, med kunden | 5 min |
| Når en læringsmilepæl lukkes | Skriv oppsummeringen i milepælen og gå gjennom den med kunden | Produkt og teamet | 15 min |

**Roller:** kortets eier (hvilket som helst fag) kjører testen eller utforskingen og skriver konklusjonen. Tavleholderen (produkteieren) holder ukesmøtet og hjelper teamet å holde tavlen levende, men eier ikke kortene. Produkttrioen (produkt, design, tech lead) avgjør prioritering ved uenighet. Kunden har lesetilgang og en plass i demoen.

## Kilder

- [The Hypothesis Prioritization Canvas, Jeff Gothelf](https://jeffgothelf.com/blog/the-hypothesis-prioritization-canvas/)
- [Lean UX, kapittel 3, Gothelf og Seiden](https://www.oreilly.com/library/view/lean-ux/9781449366834/ch03.html)
- [Assumptions Mapping, David Bland, Strategyzer](https://strategyzer.com/library/how-assumptions-mapping-can-focus-your-teams-on-running-experiments-that-matter)
- [Assumption testing, Teresa Torres, Product Talk](https://www.producttalk.org/assumption-testing/)
- [Story-Based Customer Interviews, Teresa Torres, Product Talk](https://www.producttalk.org/2024/04/story-based-customer-interviews/)
- [Product Discovery Recipes, Jeff Patton](https://andrewclark.super.site/all-media/product-discovery-recipes)
- [The Test Card og The Learning Card, Strategyzer](https://assets.strategyzer.com/assets/resources/the-test-card.pdf)
- [Discovery og leveranse på en kanban-tavle, Scrum.org](https://www.scrum.org/resources/blog/how-manage-discovery-and-delivery-work-kanban-board)
- [Discovery Kanban, Kanban Zone](https://kanbanzone.com/2020/improve-product-research-and-design-with-discovery-kanban/)
- [Assumptions Board, thoughtbot](https://thoughtbot.com/playbook/customer-discovery/initial-alignment)
- [Creating issue dependencies, GitHub Docs](https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/creating-issue-dependencies)
