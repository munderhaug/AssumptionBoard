# Hvordan vi jobber med antakelsestavlen

## Idéen

Hvert kort er noe teamet ikke vet ennå, ikke en oppgave. Det er enten en **antakelse** vi tester («Vi tror at…»), eller en **utforsking** av noe vi må forstå før vi vet hva vi tror («Vi vil forstå…»). Alle i teknologi, design, forretning og produkt kan lage kort, eie dem og legge ved bevis. Discovery er hele teamets jobb, ikke bare designerens eller produkteierens.

Tavlen er der teamet viser hva det vet, hva det har gjettet, og hva det fortsatt må finne ut av, for seg selv og for kunden. Den er ikke en kontroll av hvem som tok feil.

```
Backlog → Neste opp → Under discovery ─┬→ Klar for implementering → Implementert
                                       ├→ Ikke sant
                                       └→ Innsikt
```

## Fem avtaler

1. **Et kort er noe vi ikke vet, ikke en oppgave.** En antakelse starter med «Vi tror at…» og har én påstand som kan vise seg å være feil. En utforsking starter med «Vi vil forstå…» og har ett spørsmål. Alle kan lage kort.
2. **Linjen skrives før vi starter.** «Vi har rett hvis…» for en antakelse, «Vi er ferdige når…» for en utforsking. Det er den som skiller bevis fra meninger.
3. **Maks 3 kort under discovery og 5 i Neste opp.** Vi henter det som er viktigst og mest usikkert, og bestemmer det sammen i ukesmøtet. Ligger et kort under discovery i over to uker, tar flere i teamet det sammen, deler det opp eller stopper det.
4. **Alle åpne kort har en oppfølgingsdato.** Er den passert, avgjør teamet i ukesmøtet: ny dato, test eller slett. For en utforsking under discovery er datoen stoppdatoen.
5. **Ingen kort forlater discovery uten konklusjon på kortet.** En antakelse får «Beslutning og innsikt»: Validert, Bet eller Ikke sant. Er den Validert eller en Bet, settes Basis. En utforsking får «Innsikt» og lenker til de nye kortene. Så lukkes issuen. Bygger vi på en gjetning, merker vi det som Bet.

Dette er avtaler som skal hjelpe, ikke krav som skal oppfylles. Etter 3–4 uker: hva gjør dere bare fordi dere må? Endre eller fjern det. Resten av dokumentet er oppslag.

## En levende tavle, ikke prosjektstyring

Tavlen er et arbeidsverktøy for å ta bedre beslutninger sammen. Den er ikke en rapport og ikke et styringssystem. Fyller teamet den ut fordi de må, har den mistet poenget.

- **Kortet kommer fra en faktisk usikkerhet.** Lag et kort når noen sier «jeg tror…», «jeg er ikke sikker på…» eller «vi vet ikke hvordan…» i en samtale, et møte eller en PR, eller når et spørsmål, en idé eller en funksjon skjuler noe dere ikke vet. Ingen kvote, og ingen utfylling i etterkant.
- **Spør alltid: hvilken beslutning hjelper dette oss med?** Kan ingen svare, slett kortet.
- **Start smått.** Kolonnene, de to skjemaene, Oppfølging og Basis er nok. Risikotype og læringsmilepæler tar dere i bruk når dere trenger dem.
- **Alle lager kort selv,** i skjemaet eller med hjelp fra en AI-assistent etter et ja. Kortet er personens, ikke assistentens.
- **Samtalen skjer på kortet.** Spørsmål og funn som kommentarer i issuen, ikke i egne statusrapporter. Kunden leser tavlen, ikke en egen rapport.
- **Ukesmøtet slutter når det ikke er mer å snakke om.** Skjer det lite, kutt det til 15 minutter eller hopp over en uke.

**Tegn på at tavlen er i ferd med å dø:** kortene oppdateres bare rett før en demo, det kommer ingen nye kort på to uker, ukesmøtet leser opp kort uten diskusjon, oppfølgingsdatoene passerer uten at noen bryr seg, eller felt ingen bruker eller filtrerer på. Slett, forenkle eller spør teamet hvilken beslutning de står foran akkurat nå.

## Hvor kortene kommer fra

Midt i et prosjekt kommer kortene fra to steder: det som allerede er bygd, og det dere vet at dere ikke vet.

### Det som allerede er bygd

Kartlegg det som er bygd, for å se hva dere vet og hva dere har antatt. Ta med det som betyr noe for retningen videre, ikke hver funksjon. For hver ting:

1. **Skriv det dere trodde da dere bygde det,** som en antakelse.
2. **Kan dere vise beviset,** skriv «Vi har rett hvis…», lenk beviset og skriv hva det viser. Si på kortet at linjen ble skrevet etter at beviset var kjent, så kunden kan vurdere det selv. Holder det, er kortet Validert. Er beviset tynt, er det ærligere med en Bet, eller med nye data (punkt 3).
3. **Finnes det data dere ikke har sett på ennå,** som bruksdata eller supporthenvendelser, skriv «Vi har rett hvis…» først og se etterpå. Da går kortet gjennom *Neste opp* og *Under discovery* som andre kort.
4. **Kan dere ikke vise det,** er det en Bet. Det er greit, så lenge det er merket (se [Bets](#bets)).
5. **Vet dere ikke hvorfor det virker eller ikke virker,** utforsk.

Et kort som avklares med en gang (punkt 2 og 4), trenger ikke gå gjennom discovery. Fyll ut «Beslutning og innsikt», sett Basis, lukk issuen og flytt kortet rett til *Implementert*. Viser det seg at noe ikke holder, flyttes kortet til *Ikke sant*, og dere bestemmer hva som skal endres. Kartleggingen viser hva dere kan gjøre discovery på: det dere ikke forstår, og de viktigste Bet-kortene, hvis teamet vil.

### Det dere vet at dere ikke vet

Spørsmål, idéer og ting dere må finne ut av før dere bygger videre. Gjør dem om til kort slik [Fra spørsmål til kort](#fra-spørsmål-til-kort) beskriver.

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

   Er noe allerede bygd, spør: hva antok vi da vi bygde det, og hva vet vi nå? Se [Det som allerede er bygd](#det-som-allerede-er-bygd).
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
**Hvis Bet, det vi følger med på (valgfritt):** 
```

Når en utforsking avsluttes, fylles **Innsikt** ut:

```markdown
**Det vi så:** 1–3 setninger om mønstre, med antall, for eksempel «i 5 av 6 samtaler …»
**Nye kort:** #23, #24
**Nye spørsmål:** det vi fortsatt ikke vet, og som ikke er kort ennå
**Bevis:** lenke til oppsummeringen, med dato
```

Fire ferdige eksempler, én utforsking og tre antakelser med hver sin beslutning, ligger i [EKSEMPELKORT.md](EKSEMPELKORT.md).

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
| Risikotype | Verdi, Brukbarhet, Gjennomførbarhet, Levedyktighet | Når dere vil vise hvilken risiko kortet handler om |
| Basis | Validert, Bet | Når en antakelse forlater discovery |

**Oppfølging** er datoen vi senest ser på kortet igjen. Den er ikke en frist å bli målt på, men et signal:

- Under discovery: når vi venter svar. For en utforsking er det datoen vi senest stopper.
- Neste opp og Backlog: når vi vil vurdere om kortet fortsatt er relevant (seks uker er et fornuftig utgangspunkt).
- Bet: bare hvis dere vil se på den igjen.
- Validert, Ikke sant og Innsikt er avsluttet og trenger ingen dato.

Passerer datoen, er det ikke en forsinkelse. Det er et spørsmål i ukesmøtet: trenger vi dette fortsatt?

**Risikotype** er en farget etikett, ikke egne baner: Verdi (vil kundene ha det?), Brukbarhet (kan de bruke det?), Gjennomførbarhet (kan vi bygge det?) og Levedyktighet (er det lønnsomt og lovlig for oss?). Den viser at discovery ikke bare handler om design.

Blir backlogen så stor at dere trenger å sortere den, kan dere legge til feltene Viktighet og Sikkerhet ([oppsett](OPPSETT.md#flere-felt-valgfritt)).

## Bets

En Bet er en antakelse dere bygger på uten å ha testet, med vilje. Det er greit, så lenge alle vet at det er en gjetning. At den er merket, og ikke hevdet som kunnskap, er det som gir kunden trygghet.

- En Bet trenger ikke gå gjennom discovery. Fyll ut «Beslutning og innsikt», skriv i «Det vi så» at den ikke er testet og hvorfor dere bygger likevel, sett Basis til Bet og lukk issuen. Flytt kortet til *Klar for implementering*, eller rett til *Implementert* hvis det allerede er bygd.
- Har dere noe enkelt å følge med på, som bruk eller supporthenvendelser, skriv det, og sett gjerne en oppfølgingsdato. Det er valgfritt.
- Har dere satt en dato, ser dere på det dere fulgte med på da. Holder det, oppdater «Beslutning og innsikt» og sett Basis til Validert. Holder det ikke, flytt kortet til *Ikke sant* og lag et nytt kort for det som må endres. Er det for tidlig å si, sett en ny dato eller fjern den.
- Dere kan når som helst ta opp en Bet igjen, for eksempel når den blir viktigere eller kunden ber om det. Gjenåpne kortet, flytt det til *Neste opp* og skriv en test og en ny «Vi har rett hvis…». Vil dere heller forstå noe rundt den først, lag en utforsking.

## Når en test ikke gir svar

«Trenger mer research» er en tilstand, ikke en kolonne. Skriv en kommentar om hva dere lærte og hva som fortsatt er uklart, sett etiketten `trenger-mer-research` og legg kortet i *Neste opp*. Der venter det til teamet velger neste steg i ukesmøtet. Fjern etiketten når dere har valgt:

- **En skarpere test:** skriv en ny «Vi har rett hvis…» og sett en ny oppfølgingsdato.
- **Utforske først:** viste testen at dere ikke vet nok til å tro noe bestemt, lag en utforsking og flytt antakelsen tilbake til *Backlog*. Når utforskingen er ferdig, skriver dere antakelsen om, eller sletter den.
- **Dele kortet:** var testen delvis nyttig, behold det som er avklart, og lag et nytt, smalere kort for resten.
- **Bestemme seg:** er det nok til å velge, blir kortet en Bet eller flyttes til *Ikke sant*.

## Læringsmilepæler

Milepælene lager teamet selv, når dere trenger dem. Malen definerer ingen. En læringsmilepæl er et læringsmål: hva vi må vite, innen når, og hvilket utfall det skal føre til. Kortene som hjelper å svare, hører til milepælen, både antakelser og utforskinger. Eksemplene her er bare eksempler.

- **Formuler milepælen som et spørsmål vi skal kunne svare på.** For eksempel «Vi vet om automatisk fakturaimport er verdt å bygge (15. november)».
- **Knytt den til leveransemilepælen den avgjør,** hvis dere har en. «Vi kan ikke love M2 før dette er avklart.» Her blir discovery synlig for kunden.
- **Knytt kortene til milepælen de hjelper å svare på.** Velg den under *Milestone* i sidepanelet på kortet. Kort som ikke hører til noen, trenger ingen. Milepælsiden i repoet (*Issues* → *Milestones*) viser da fremdriften per læringsmål.
- **Fremdriften måler læring, ikke leveranse.** En issue lukkes når beslutningen er tatt eller innsikten er skrevet, ikke når noe er levert.
- **Én milepæl per kort, ett repo per kunde.** En issue kan bare ha én milepæl. Hører et kort til to, velg den det blokkerer først.
- **Avslutt milepælen med en oppsummering** i milepælens beskrivelse. Den er rapporten til kunden.

```markdown
**Det vi nå vet:** 
**Det vi fortsatt gjetter (Bets):** 
**Det vi har sett, men ikke testet:** 
**Betydning for leveransen:** 
```

## Bevis og innsikt

Bevisene ligger der teamet jobber: Miro, Figma, Dovetail, regneark, kode. Konklusjonen ligger på kortet. Leveranseteamet og kunden leser kortet, ikke Miro-tavlen, og tavler endrer seg, lenker brytes og kunden har kanskje ikke tilgang.

- **Konklusjonen skal kunne leses alene.** «Det vi så» og «Produktimplikasjon» skal gi mening uten å åpne lenken.
- **Lenk til en konkret frame eller et dokument, ikke en hel tavle.** Skriv datoen.
- **Lim inn et skjermbilde eller et kort utdrag** når beviset er sentralt.
- **Ingen personopplysninger i issues.** Lenk til oppsummeringer, ikke til opptak, navn eller rådata fra intervjuer.

## Avhengigheter mellom kort

Valgfritt. Noen kort kan ikke startes før andre er avklart, og da kan dere bruke GitHubs avhengigheter slik dere kjenner dem fra utvikling:

- Åpne kortet → *Relationships* i sidepanelet → *Mark as blocked by* eller *Mark as blocking*. Krever minst triage-tilgang til repoet. Fra terminalen (GitHub CLI 2.94.0 eller nyere): `gh issue edit <nummer> --add-blocked-by <nummer eller URL>`.
- Et kort med åpne blokkere får et *Blocked*-ikon på tavlen. Ikke hent det til *Under discovery* før blokkeren er lukket.
- En antakelse kan også vente på en utforsking.
- Lange kjeder av avhengigheter tyder på at kortene er for store, eller at dere planlegger i stedet for å lære.

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

## Rutiner

| Når | Hva | Hvem | Tid |
| --- | --- | --- | --- |
| Daglig | Siste del av standup: hva lærte vi, hva er neste test eller samtale, hvem kan hjelpe | De som jobber med kortene. Andre kan gå | 2–3 min |
| Ukentlig | Kort med passert oppfølgingsdato først, så `trenger-mer-research`. Nye beslutninger og ny innsikt. Hent kort opp til grensen, og se på balansen mellom å utforske og å teste. Rydd Backlog: slå sammen duplikater, slett det ingen ville savnet, og hold den på rundt 15–40 kort. Flytt det som er levert, til *Implementert*. Stopp når det ikke er mer å snakke om | Produkt, design, tech lead og alle som vil | 15–30 min |
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
