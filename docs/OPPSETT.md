# Oppsett steg for steg

Slik setter du opp en antakelsestavle for en ny kunde, fra tomt repo til en tavle teamet kan bruke i workshopen. Regn med ca. 20 minutter. Gjør stegene i rekkefølge, siden flere bygger på de forrige.

Menynavn i GitHub kan endre seg litt mellom oppdateringer. Hvis noe ikke stemmer, se prosjektets innstillinger (*Settings*) og GitHubs dokumentasjon for Projects.

Husk at tavlen skal være levende og praktisk. Start med det minste som fungerer: kolonnene, kortskjemaet og oppfølgingsdatoen. Resten kan dere slå på når dere trenger det.

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

Skriptet lager etikettene `antakelse` og `trenger-mer-research`, et Project med fem felt, og kobler prosjektet til repoet. Til slutt skriver det ut prosjektnummeret. Prosjektet finner du under fanen *Projects* i repoet.

Kjør skriptet bare én gang per tavle, for det lager et nytt Project hver gang. Stopper det med en feil etter at prosjektet er laget, slett det halvferdige prosjektet før du prøver igjen. Finn nummeret med `gh project list --owner <eier>` og slett med `gh project delete <nr> --owner <eier>`.

Feltene skriptet lager. *Milestone* og *Assignees* er innebygde felt i GitHub.

| Felt | Verdier | Brukes |
| --- | --- | --- |
| Oppfølging | Dato | Alle åpne kort: når vi senest ser på kortet igjen |
| Risikotype | Verdi, Brukbarhet, Gjennomførbarhet, Levedyktighet | Når backlogen vokser |
| Viktighet | Høy, Middels, Lav | Når backlogen vokser |
| Sikkerhet | Lav, Middels, Høy | Når backlogen vokser |
| Basis | Validert, Bet | Når kortet forlater discovery |

## 4. Status-kolonnene

Åpne prosjektet → *Settings* → *Status*-feltet. Standardverdiene er *Todo*, *In Progress* og *Done*. Bytt dem ut med disse seks, i denne rekkefølgen:

1. Backlog
2. Neste opp
3. Under discovery
4. Klar for implementering
5. Implementert
6. Ikke sant

## 5. Automatisering

*Backlog* må finnes (steg 4) før du kan velge den her. Åpne prosjektmenyen → *Workflows*:

- **Auto-add to project**: slå på for dette repoet, med filteret `is:issue label:antakelse`.
- **Item added to project**: sett Status til *Backlog*.
- **Item closed** og **Auto-archive items**: slå av. Status settes for hånd, og lukkede kort skal bli liggende som beslutningslogg.

**Når lukkes en issue?** Når beslutningen er tatt: kortet flyttes til *Klar for implementering* eller *Ikke sant*. Da måler fremdriftslinjen på milepælen læring, ikke leveranse. Kortet kan fortsatt flyttes til *Implementert* etterpå.

## 6. Visninger

Lag visningene med *New view*, eller gjør om en visning som finnes fra før. Lagre filteret på hver visning:

| Visning | Type | Filter og oppsett | Brukes til |
| --- | --- | --- | --- |
| Tavle | Board | `-status:Backlog` | Daglig standup |
| Til oppfølging | Table | `oppfølging:<=@today`, sortert på Oppfølging | Første punkt i ukesmøtet |
| Backlog | Table | `status:Backlog,"Neste opp"`, sortert på Oppfølging (eller Viktighet og Sikkerhet, hvis dere bruker dem) | Ukesmøtet |
| Milepæler | Table | Gruppert på Milestone | Fremdrift per læringsmilepæl |
| Trenger mer research | Table | `label:trenger-mer-research` | Ukesmøtet |
| Kunde | Board | `status:"Klar for implementering",Implementert,"Ikke sant"` | Demo og kundeinnsyn |

Felt dere ikke bruker ennå, kan dere skjule i visningene (*Fields* i visningsmenyen). Vis Oppfølging på alle kort. Vis Risikotype og Milestone på kortene i tavlevisningen hvis dere bruker dem.

Sortert stigende kommer Høy viktighet og Lav sikkerhet øverst, altså de kortene som bør testes først. Skrivemåten er sjekket mot [GitHubs dokumentasjon for filtrering i Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/customizing-views-in-your-project/filtering-projects) 14.10.2026, men filtrene og sorteringen er ikke prøvd i et ekte prosjekt ennå. Dokumentasjonen sier ingenting om æ, ø og å i feltnavn, så sjekk `oppfølging:<=@today` først. Treffer ikke et filter, sjekk skrivemåten på feltnavn og verdier i dokumentasjonen.

## 7. Grenser per kolonne

I visningen *Tavle* fra steg 6: åpne menyen på kolonnen og velg *Set limit*.

| Kolonne | Grense |
| --- | --- |
| Under discovery | 3 |
| Neste opp | 5 |

Kolonnen blir rød når grensen overskrides. Grensene er startpunkter. Juster etter 3–4 uker.

## 8. Tilgang

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

Lag et kort: *Issues* → *New issue* → *Antakelse*. Sjekk at:

- tittelen er forhåndsutfylt med «Vi tror at»,
- kortet får etiketten `antakelse`,
- kortet dukker opp i prosjektet under *Backlog*.

Sett dagens dato i Oppfølging og sjekk at kortet vises i *Til oppfølging*. Slett testkortet etterpå (*Delete issue* nederst i sidepanelet på issuen).

Nå er tavlen klar. Hold workshopen som beskrevet i [Kom i gang med teamet](HVORDAN-VI-JOBBER.md#kom-i-gang-med-teamet).

## Når dere er i gang

Dette trenger ikke settes opp på forhånd.

### Læringsmilepæler (teamet lager dem selv)

Malen definerer ingen milepæler. Teamet oppretter dem selv når de trenger å gruppere kort rundt noe de må vite, for eksempel i workshopen. De bruker GitHubs egne milepæler i repoet (*Issues* → *Milestones* → *New milestone*):

- **Tittel:** det vi må vite.
- **Frist:** når vi må vite det.
- **Beskrivelse:** hvilken leveransemilepæl den eventuelt avgjør.

Fra kommandolinjen:

```bash
gh api repos/<eier>/<repo>/milestones \
  -f title="<det vi må vite>" \
  -f due_on="<ÅÅÅÅ-MM-DD>T23:59:59Z" \
  -f description="<hva den avgjør>"
```

En issue kan bare ha én milepæl, og milepæler hører til ett repo. Bruk derfor ett discovery-repo per kunde.

### Avhengigheter mellom kort

Ingen oppsett nødvendig. Åpne et kort → *Relationships* i sidepanelet → *Mark as blocked by* eller *Mark as blocking*. Fra terminalen (GitHub CLI 2.94.0 eller nyere): `gh issue edit <nummer> --add-blocked-by <nummer eller URL>`. Et kort med åpne blokkere får et *Blocked*-ikon på tavlen.

## Sjekkliste

- [ ] GitHub CLI er installert og har tilgang til Projects
- [ ] Repoet er laget fra malen og er privat, i en organisasjon hvis kunden bare skal lese
- [ ] Skriptet er kjørt: to etiketter og et prosjekt med fem felt, koblet til repoet
- [ ] Status har seks kolonner i riktig rekkefølge
- [ ] Auto-add og Backlog som startstatus er på, Item closed og Auto-archive er av
- [ ] Visningene er laget
- [ ] Grenser satt (3 og 5)
- [ ] Teamet har skrivetilgang (minst triage), kunden lesetilgang
- [ ] PR-malen er kopiert til dev-repoet
- [ ] Avhengigheter på tvers av repoer er testet med to testrepoer
- [ ] Et testkort er opprettet fra skjemaet og havnet i Backlog
- [ ] Teamet vet hvordan de oppretter en milepæl og setter en avhengighet
