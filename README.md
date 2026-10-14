# Antakelsestavle: mal for synlig discovery

En mal som lar hele teamet eie discovery. Hvert kort på tavlen er noe teamet ikke vet ennå, ikke en oppgave. Det er enten en **antakelse** («Vi tror at…»), noe vi tror, men ikke har verifisert, eller en **utforsking** («Vi vil forstå…»), noe vi må forstå før vi vet hva vi tror. Tavlen viser hva vi utforsker og tester, hva som er bekreftet, hva som viste seg ikke å stemme, hva vi har forstått, og hva vi bygget på gjetning med vilje.

Dette er en **mal**. Den definerer ingen milepæler eller kort for dere. Teamet lager sine egne, når de trenger dem.

Tavlen skal være **levende og praktisk**, ikke et prosjektstyringsverktøy. Den er der for å hjelpe teamet å ta bedre beslutninger sammen. Fyller dere den ut fordi dere må, er den på feil kurs. Se [En levende tavle](docs/HVORDAN-VI-JOBBER.md#en-levende-tavle-ikke-prosjektstyring).

Bevisene kan ligge i Miro, Figma eller andre verktøy. Konklusjonen og hva den betyr for produktet skrives på kortet, så repoet blir beslutningsloggen.

Repoet gir deg to issue-skjemaer, PR-mal, eksempelkort, etiketter og et skript som setter opp et GitHub Project. Noen innstillinger (kolonner, grenser, visninger) gjøres for hånd, eller følger med fra et [malprosjekt](docs/OPPSETT.md#malprosjekt). Regn med ca. 20 minutter totalt.

## Kom i gang

Her er kortversjonen. Hele oppsettet steg for steg, også installasjon av GitHub CLI, står i [docs/OPPSETT.md](docs/OPPSETT.md).

1. **Lag ditt eget repo fra malen.** Trykk *Use this template* → *Create a new repository* på GitHub, og gjør det **privat**. Bruk ett repo per kunde. Skal kunden bare ha lesetilgang, må repoet eies av en organisasjon, se [Tilgang](docs/OPPSETT.md#8-tilgang). Alternativt: klon dette repoet og push det til et nytt.
2. **Kjør oppsettsskriptet** fra en lokal kopi av det nye repoet. Det krever [GitHub CLI](https://cli.github.com):
   ```bash
   gh repo clone <eier>/<repo> && cd <repo>
   gh auth refresh -s project
   ./scripts/setup.sh <eier> <repo>
   ```
   `<eier>` er GitHub-brukeren eller organisasjonen, `<repo>` er navnet på det nye repoet. Skriptet lager etikettene, et Project med tre felt og kobler det til repoet.
3. **Gjør resten for hånd** i [docs/OPPSETT.md](docs/OPPSETT.md), fra steg 4: kolonner, automatisering, visninger, grenser, tilgang, kobling til dev-repoet og et testkort. Med et malprosjekt er kolonner, visninger og grenser allerede på plass.
4. **Bruk tavlen.** Start med det dere allerede har bygd og det dere vet at dere ikke vet (se [Hvor kortene kommer fra](docs/HVORDAN-VI-JOBBER.md#hvor-kortene-kommer-fra)). [docs/HVORDAN-VI-JOBBER.md](docs/HVORDAN-VI-JOBBER.md) beskriver resten, og de fem avtalene står øverst. [Eksempelkortene](docs/EKSEMPELKORT.md) viser hvordan et godt kort ser ut.

## Tavlen i korte trekk

```
Backlog → Neste opp → Under discovery ─┬→ Klar for implementering → Implementert
                                       ├→ Ikke sant
                                       └→ Innsikt
```

- To typer kort i samme flyt. **Antakelser** testes og ender i *Klar for implementering*, *Implementert* eller *Ikke sant*. **Utforskinger** har en stoppregel og ender i *Innsikt*, med nye kort. Sammen viser sluttkolonnene det dere vet nå: hva som er testet, hva dere bevisst bygger på gjetning, og hva dere har sett, men ikke testet. Visningen *Det vi vet* viser dem samlet.
- Alle åpne kort har en **oppfølgingsdato**: når vi senest ser på kortet igjen. Det er et signal, ikke en frist å bli målt på.
- Kortene kan grupperes under **læringsmilepæler** som teamet lager selv: hva vi må vite, og innen når.
- Kort kan **blokkere hverandre** hvis dere vil, og leveranse-issuer i dev-repoet kan **blokkeres av** antakelsene de venter på.
- Maks **3** kort under discovery, begge typene til sammen, og **5** i Neste opp.
- Antakelser som har forlatt discovery merkes med **Basis**: `Validert` (vi har bevis) eller `Bet` (vi bygger uten å ha testet, med vilje). En Bet er greit, så lenge den er merket.
- Ingen kort forlater discovery uten en skrevet konklusjon: beslutning og produktimplikasjon på en antakelse, innsikt og nye kort på en utforsking, eller hvorfor det ikke ble noen.
- Issuen lukkes når beslutningen er tatt eller innsikten er skrevet, så milepælens fremdrift måler læring.
- «Trenger mer research» er en etikett, ikke en kolonne.
- Start smått: kolonnene, de to skjemaene, Oppfølging og Basis er nok. Risikotype og læringsmilepæler tar dere i bruk når dere trenger dem.

## Innhold

```
.github/ISSUE_TEMPLATE/antakelse.yml   Skjema for nye antakelser, med beslutningsnotat
.github/ISSUE_TEMPLATE/utforsking.yml  Skjema for utforskinger, med innsikt og nye kort
.github/ISSUE_TEMPLATE/config.yml      Slår av tomme issues, så alle bruker skjemaene
templates/dev-repo/pull_request_template.md   PR-mal som kopieres til dev-repoet
scripts/setup.sh                       Oppretter etiketter, Project og felt
docs/OPPSETT.md                        Oppsett steg for steg
docs/HVORDAN-VI-JOBBER.md              Fem avtaler, korttypene, kolonnene, rutiner og kobling til dev
docs/EKSEMPELKORT.md                   Fire ferdig utfylte kort: en utforsking og tre antakelser
AGENTS.md                              Instruksjoner for AI-assistenter (CLAUDE.md peker hit)
.claude/skills/                        Fire ferdigheter for AI-assistenter
.mcp.json                              Kobling til Miro og Figma for AI-assistenter
```

## AI-assistenter (valgfritt)

Tavlen virker uten AI, og alle lager kort selv, i skjemaet eller med hjelp fra en assistent. Bruker teamet AI-verktøy, ligger instruksjonene klare:

- `AGENTS.md` gir alle AI-verktøy metoden, kommandoene og grensene: hva de alltid gjør, hva de spør om først, og hva de aldri gjør. `CLAUDE.md` peker dit.
- Fire ferdigheter (skills) i `.claude/skills/`. Claude Code og GitHub Copilot finner dem selv. I andre verktøy kan du be assistenten lese fila.
  - `writing-cards` hjelper dere å gjøre spørsmål, idéer, funksjoner eller en løs tanke om til gode kort: en antakelse når dere vet hva dere tror, en utforsking når dere må forstå mer først. Den finner hva dere må finne ut av fra produkt, design, teknologi og forretning, utfordrer hvert kort og foreslår en test eller en måte å utforske på. Den oppretter issuen bare etter et ja.
  - `preparing-weekly-meeting` går gjennom tavlen og lager en kort agenda til ukesmøtet. Den endrer ingenting.
  - `summarizing-learnings` skriver et utkast til ukens læringsbrev, «Dette lærte vi», fra beslutningene og innsikten på kortene, med lenke til hvert kort. Den kan også oppsummere en læringsmilepæl. Den sender ingenting.
  - `reviewing-decisions` går gjennom ett kort før det forlater discovery: om «Det vi så» når grensen i «Vi har rett hvis…», om en Validert egentlig er en Bet, og om innsikten fra en utforsking blir presentert som testet. Den stiller spørsmål og godkjenner aldri.
- `.mcp.json` kobler Claude Code og VS Code (GitHub Copilot) til Miro og Figma. Da kan assistenten lese bevisene kortene lenker til, og utfordre konklusjonen mot dem. Hver person logger inn med egen konto (i Claude Code med `/mcp`), og assistenten ser bare det personen har tilgang til. Den skal bare lese, aldri endre. På Mirós Enterprise-plan må en admin slå på MCP-serveren først. Begge tjenestene er nye og kan endre seg. Andre verktøy med MCP-server kan legges til i samme fil.

Assistentene kan ta feil. En sjekk fra dem er aldri bevis, og teamet bestemmer. Instruksjonene er på engelsk, men assistentene svarer på norsk. Sjekk at avtalen med kunden tillater at innhold fra tavlen sendes til en AI-tjeneste.

## Personvern

Hold denne malen fri for kundedata. Kjør de ekte tavlene i private repoer. Legg ikke personopplysninger i issues: lenk til oppsummeringer av intervjuer, ikke til opptak, navn eller rådata.

## Tilpass

Dette er et startpunkt. Etter 3–4 uker: sjekk om grensene på 3 og 5 passer, spør hva dere gjør bare fordi dere må, og fjern kolonner, felt og avtaler dere ikke bruker.

Et repo som er laget fra malen, får ikke senere endringer i malen. Vil dere ha med en forbedring, kopier den over for hånd. Historikken i malen viser hva som er endret.
