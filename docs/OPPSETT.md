# Oppsett steg for steg

Slik setter du opp en antakelsestavle for en ny kunde, fra tomt repo til en tavle teamet kan bruke. Regn med ca. 20 minutter. Gjør stegene i rekkefølge, siden flere bygger på de forrige.

Menynavn i GitHub kan endre seg litt mellom oppdateringer. Hvis noe ikke stemmer, se prosjektets innstillinger (*Settings*) og GitHubs dokumentasjon for Projects.

Husk at tavlen skal være levende og praktisk. Start med det minste som fungerer: kolonnene, de to kortskjemaene og oppfølgingsdatoen. Resten kan dere slå på når dere trenger det.

## 1. Før du starter

Dette gjør du én gang per maskin.

1. Installer [GitHub CLI](https://cli.github.com): `brew install gh` på Mac, `winget install --id GitHub.cli` på Windows.
2. Sjekk versjonen med `gh --version`. Skriptet virker med eldre versjoner, men avhengigheter fra terminalen krever 2.94.0 eller nyere. Oppdater med `brew upgrade gh` eller `winget upgrade --id GitHub.cli`.
3. Logg inn og gi GitHub CLI tilgang til Projects:
   ```bash
   gh auth login
   gh auth refresh -s project
   ```
4. På Windows: kjør skriptet i Git Bash eller WSL.

Skal repoet ligge i en organisasjon, må du ha lov til å opprette repoer og prosjekter der.

## 2. Lag discovery-repoet

Bruk ett repo per kunde, for eksempel `kunde-x-discovery`. Velg eier før du starter: skal kunden bare ha lesetilgang, må repoet eies av en organisasjon (se [steg 8](#8-tilgang)).

1. Åpne [malen](https://github.com/munderhaug/AssumptionBoard) og trykk *Use this template* → *Create a new repository*.
2. Velg eier, skriv navnet, velg **Private** og trykk *Create repository*.
3. Klon repoet og gå inn i mappen:
   ```bash
   gh repo clone <eier>/<repo>
   cd <repo>
   ```

Fra terminalen kan du gjøre alle tre i én kommando:

```bash
gh repo create <eier>/<repo> --template munderhaug/AssumptionBoard --private --clone
cd <repo>
```

## 3. Kjør oppsettsskriptet

```bash
./scripts/setup.sh <eier> <repo> "Discovery"
```

`<eier>` er GitHub-brukeren eller organisasjonen, `<repo>` er navnet fra steg 2. Prosjekttittelen til slutt er valgfri. Utelater du den, heter prosjektet «Discovery».

Skriptet lager etikettene `antakelse`, `utforsking` og `trenger-mer-research`, et Project med fem felt, og kobler prosjektet til repoet. Til slutt skriver det ut prosjektnummeret. Prosjektet finner du under fanen *Projects* i repoet.

Er `MALPROSJEKT` satt øverst i `scripts/setup.sh`, kopierer skriptet malprosjektet i stedet for å lage feltene (se [Malprosjekt](#malprosjekt)). Da følger kolonnene, workflowene og visningene med. I steg 4–7 sjekker du bare at alt kom med, også grensene, og slår på *Auto-add to project*, som ikke kopieres.

Kjør skriptet bare én gang per tavle, for det lager et nytt Project hver gang. Stopper det med en feil etter at prosjektet er laget, slett det halvferdige prosjektet før du prøver igjen. Finn nummeret med `gh project list --owner <eier>` og slett med `gh project delete <nr> --owner <eier>`.

Feltene skriptet lager. *Milestone* og *Assignees* er innebygde felt i GitHub.

| Felt | Verdier | Brukes |
| --- | --- | --- |
| Oppfølging | Dato | Alle åpne kort: når vi senest ser på kortet igjen |
| Risikotype | Verdi, Brukbarhet, Gjennomførbarhet, Levedyktighet | Når backlogen vokser |
| Viktighet | Høy, Middels, Lav | Når backlogen vokser |
| Sikkerhet | Lav, Middels, Høy | Når backlogen vokser, på antakelser |
| Basis | Validert, Bet | Når en antakelse forlater discovery |

## 4. Status-kolonnene

Åpne prosjektet → *Settings* → *Status*-feltet. Standardverdiene er *Todo*, *In Progress* og *Done*. Bytt dem ut med disse syv, i denne rekkefølgen:

1. Backlog
2. Neste opp
3. Under discovery
4. Klar for implementering
5. Implementert
6. Ikke sant
7. Innsikt

Antakelser ender i 4–6, utforskinger i *Innsikt*. Hva kolonnene betyr, står i [HVORDAN-VI-JOBBER.md](HVORDAN-VI-JOBBER.md#kolonnene).

## 5. Automatisering

*Backlog* må finnes (steg 4) før du kan velge den her. Åpne prosjektmenyen → *Workflows*:

- **Auto-add to project**: slå på for dette repoet, med filteret `is:issue`.
- **Item added to project**: sett Status til *Backlog*.
- **Item closed** og **Auto-archive items**: slå av. Status settes for hånd, og lukkede kort skal bli liggende som beslutningslogg.

Filteret er `is:issue` og ikke etikettene, fordi de to korttypene har hver sin etikett. Per 14.10.2026 tillater GitHub Free bare én auto-add-workflow, og [dokumentasjonen](https://docs.github.com/en/issues/planning-and-tracking-with-projects/automating-your-project/adding-items-automatically) viser ikke at ett filter kan treffe to etiketter. Det går greit så lenge repoet bare brukes til kort. Tomme issues er slått av i nettleseren, og kort som lages fra terminalen, får etiketten sin der. Kort som fantes før auto-add ble slått på, må legges til for hånd.

**Når lukkes en issue?** En antakelse lukkes når beslutningen er tatt: kortet flyttes til *Klar for implementering* eller *Ikke sant*. En utforsking lukkes når innsikten er skrevet og de nye kortene er laget, eller innsikten sier hvorfor det ikke ble noen: kortet flyttes til *Innsikt*. Da måler fremdriftslinjen på milepælen læring, ikke leveranse. En antakelse kan fortsatt flyttes til *Implementert* etterpå.

## 6. Visninger

Lag visningene med *New view*, eller gjør om en visning som finnes fra før. Lagre filteret på hver visning:

| Visning | Type | Filter og oppsett | Brukes til |
| --- | --- | --- | --- |
| Tavle | Board | `-status:Backlog` | Daglig standup |
| Til oppfølging | Table | `oppfølging:<=@today -basis:Validert -status:"Ikke sant",Innsikt`, sortert på Oppfølging | Første punkt i ukesmøtet |
| Backlog | Table | `status:Backlog,"Neste opp"`, sortert på Oppfølging (eller Viktighet og Sikkerhet, hvis dere bruker dem) | Ukesmøtet |
| Milepæler | Table | Gruppert på Milestone | Fremdrift per læringsmilepæl |
| Trenger mer research | Table | `label:trenger-mer-research` | Ukesmøtet |
| Det vi vet | Board | `status:"Klar for implementering",Implementert,"Ikke sant",Innsikt` | Demo, kundeinnsyn og læringsbrev |

*Tavle* viser alle kolonnene utenom Backlog. *Implementert*, *Ikke sant* og *Innsikt* hører med: de viser hva teamet vet, hva som ikke stemte og hva dere har forstått, så alle har den samme oversikten over discovery og innsikt. *Det vi vet* viser bare de fire sluttkolonnene. Vis Basis der, så Bets er merket som gjetning.

Visningene viser også lukkede issues, og et lukket kort beholder oppfølgingsdatoen det hadde mens det var åpent. Derfor viser *Til oppfølging* bare åpne kort og Bets.

Tittelen viser korttypen: «Vi tror at» eller «Vi vil forstå». Felt dere ikke bruker ennå, kan dere skjule i visningene (*Fields* i visningsmenyen). Vis Oppfølging og Labels på alle kort. Vis Risikotype og Milestone på kortene i tavlevisningen hvis dere bruker dem.

Sortert stigende kommer Høy viktighet og Lav sikkerhet øverst, altså de kortene som bør testes først. Skrivemåten er sjekket mot [GitHubs dokumentasjon for filtrering i Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/customizing-views-in-your-project/filtering-projects) 14.10.2026, men filtrene og sorteringen er ikke prøvd i et ekte prosjekt ennå. Dokumentasjonen sier ingenting om æ, ø og å i feltnavn, så sjekk *Til oppfølging* først: at `-basis:Validert` tar med kort uten Basis, og at `-status:"Ikke sant",Innsikt` holder begge kolonnene ute. Treffer ikke et filter, sjekk skrivemåten på feltnavn og verdier i dokumentasjonen.

## 7. Grenser per kolonne

I visningen *Tavle* fra steg 6: åpne menyen på kolonnen og velg *Set limit*.

| Kolonne | Grense |
| --- | --- |
| Under discovery | 3 |
| Neste opp | 5 |

Kolonnen blir rød når grensen overskrides. Grensene er startpunkter. Juster etter 3–4 uker.

## 8. Tilgang

**Før kunden får tilgang:** bytt ut `README.md`. Repoet har arvet malens README, som handler om å sette opp en tavle, ikke om å lese den. Et utgangspunkt:

```markdown
# Discovery: <kunde eller prosjekt>

Her samler vi det vi ikke vet ennå, og det vi har lært. Hvert kort er en antakelse vi tester, eller noe vi utforsker. Ingen kort er oppgaver.

- **Tavlen:** <lenke til prosjektet>. Visningen *Det vi vet* viser beslutningene og innsikten. En Bet er en bevisst gjetning, og innsikt fra en utforsking er ikke testet.
- **En antakelse:** «Vi tror at…» er påstanden, «Vi har rett hvis…» er linjen vi satte før testen, og «Beslutning og innsikt» er konklusjonen.
- **En utforsking:** «Vi vil forstå…» er spørsmålet, «Vi er ferdige når…» er stoppregelen, og «Innsikt» er det vi så og de nye kortene det ga.
- **Slik jobber vi:** [docs/HVORDAN-VI-JOBBER.md](docs/HVORDAN-VI-JOBBER.md)
```

Tilgang til repoet gir du under repoets *Settings* → *Collaborators* (i en organisasjon: *Collaborators and teams*). Tilgang til prosjektet gir du under prosjektets *Settings* → *Manage access*.

- Teamet: skrivetilgang til repoet og prosjektet.
- Kunden: lesetilgang til repoet **og** prosjektet. Prosjektet viser bare issues fra private repoer til de som har tilgang til repoet.
- Avhengigheter (se under) krever minst triage-tilgang til repoet.

Lesetilgang og triage finnes bare i repoer som eies av en organisasjon. I et repo på en personlig konto får alle som inviteres skrivetilgang, også kunden. Skal kunden bare kunne lese, må discovery-repoet ligge i en organisasjon.

## 9. Kobling til dev-repo og dev-prosjekt

1. Kopier `templates/dev-repo/pull_request_template.md` til dev-repoet som `.github/pull_request_template.md`. Da oppgir hver PR hvilken antakelse den bygger på, og om den er Validert eller Bet.
2. Marker leveranse-issuer som blokkert av antakelsene de venter på (GitHub CLI 2.94.0 eller nyere, eller *Relationships* i sidepanelet):
   ```bash
   gh issue edit <nr> --repo <eier>/<dev-repo> \
     --add-blocked-by https://github.com/<eier>/<discovery-repo>/issues/<nr>
   ```
   Dev-tavlen viser da *Blocked*-ikonet til beslutningen er tatt.
3. Skriv også en lenke i teksten, som reserve: «Bygger på: org/discovery#123» i leveranse-issuen, og «Leveranse: org/app#456» på kortet.

**Test først.** Per 14.10.2026 sier verken GitHubs dokumentasjon eller changelog eksplisitt at avhengigheter virker på tvers av repoer, eller når *Blocked*-ikonet forsvinner. Det er ikke testet i ekte repoer ennå. Prøv med to testrepoer, og sjekk at *Blocked*-ikonet forsvinner når blokkeren lukkes.

## 10. Prøv med et testkort

Lag ett kort av hver type: *Issues* → *New issue* → *Antakelse*, og deretter *Utforsking*. Sjekk at:

- tittelene er forhåndsutfylt med «Vi tror at» og «Vi vil forstå»,
- kortene får etiketten `antakelse` og `utforsking`,
- begge dukker opp i prosjektet under *Backlog*.

Sett dagens dato i Oppfølging på begge og sjekk at de vises i *Til oppfølging*. Flytt utforskingen til *Innsikt* og sjekk at den forsvinner derfra og dukker opp i *Det vi vet*. Slett testkortene etterpå (*Delete issue* nederst i sidepanelet på issuen).

Nå er tavlen klar. Hvordan teamet jobber med den, står i [HVORDAN-VI-JOBBER.md](HVORDAN-VI-JOBBER.md).

## Når dere er i gang

Dette trenger ikke settes opp på forhånd.

### Læringsmilepæler (teamet lager dem selv)

Malen definerer ingen milepæler. Teamet oppretter dem selv når de trenger å gruppere kort rundt noe de må vite. De bruker GitHubs egne milepæler i repoet (*Issues* → *Milestones* → *New milestone*):

- **Tittel:** det vi må vite.
- **Frist:** når vi må vite det.
- **Beskrivelse:** hvilket utfall læringen skal føre til, og hvilken leveransemilepæl den eventuelt avgjør.

Fra kommandolinjen:

```bash
gh api repos/<eier>/<repo>/milestones \
  -f title="<det vi må vite>" \
  -f due_on="<ÅÅÅÅ-MM-DD>T23:59:59Z" \
  -f description="<utfallet, og hva den avgjør>"
```

Kortene knyttes til milepælen under *Milestone* i sidepanelet, eller med `gh issue edit <nr> --milestone "<tittel>"`.

En issue kan bare ha én milepæl, og milepæler hører til ett repo. Bruk derfor ett discovery-repo per kunde.

### Avhengigheter mellom kort

Ingen oppsett nødvendig. Åpne et kort → *Relationships* i sidepanelet → *Mark as blocked by* eller *Mark as blocking*. Fra terminalen (GitHub CLI 2.94.0 eller nyere): `gh issue edit <nummer> --add-blocked-by <nummer eller URL>`. Et kort med åpne blokkere får et *Blocked*-ikon på tavlen.

## Malprosjekt

For den som vedlikeholder malen. Et malprosjekt er et ferdig oppsatt Project som `scripts/setup.sh` kopierer. Da slipper hver ny tavle steg 4–7 for hånd, og en forbedring i malprosjektet gjelder alle nye tavler. Det lages én gang:

1. Lag et testrepo fra malen, kjør `scripts/setup.sh` mot det, og gjør steg 4–7. Gi prosjektet et navn som «Discovery-mal».
2. Sørg for at alle som skal kjøre skriptet, kan lese prosjektet. I en organisasjon kan du i tillegg gjøre det til en mal, så det vises under *New project*: `gh project mark-template <nr> --owner <organisasjon>`.
3. Sett `MALPROSJEKT="<eier>/<nr>"` øverst i `scripts/setup.sh` i malen, og commit.
4. Lag et nytt testrepo fra malen, kjør skriptet, og sjekk at kolonnene, workflowene, visningene og grensene kom med.

Per 14.10.2026 er dette ikke prøvd. GitHubs [dokumentasjon om kopiering](https://docs.github.com/en/issues/planning-and-tracking-with-projects/creating-projects/copying-an-existing-project) sier at kopien får visningene, de egne feltene, workflowene unntatt auto-add, og insights, men ikke kort, samarbeidspartnere eller koblinger til repoer. Den sier ikke om grensene følger med, eller om man kan kopiere et prosjekt som eies av en annen konto.

## Sjekkliste

- [ ] GitHub CLI er installert og har tilgang til Projects
- [ ] Repoet er laget fra malen og er privat, i en organisasjon hvis kunden bare skal lese
- [ ] Skriptet er kjørt: tre etiketter og et prosjekt med fem felt, koblet til repoet
- [ ] Status har syv kolonner i riktig rekkefølge, med Innsikt sist
- [ ] Auto-add (`is:issue`) og Backlog som startstatus er på, Item closed og Auto-archive er av
- [ ] Visningene er laget
- [ ] Grenser satt (3 og 5)
- [ ] README er byttet ut med en beskrivelse av tavlen
- [ ] Teamet har skrivetilgang (minst triage), kunden lesetilgang
- [ ] PR-malen er kopiert til dev-repoet
- [ ] Avhengigheter på tvers av repoer er testet med to testrepoer
- [ ] Et testkort av hver type er opprettet fra skjemaene og havnet i Backlog
- [ ] Teamet vet hvordan de oppretter en milepæl og setter en avhengighet
