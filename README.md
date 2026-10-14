# Antakelsestavle: mal for synlig discovery

En mal som lar hele teamet eie discovery. Hvert kort på tavlen er en **antakelse**, ikke en oppgave: noe vi tror, men ikke har verifisert. Tavlen viser hva vi tester, hva som er bekreftet, hva som viste seg ikke å stemme, og hva vi bygget på gjetning med vilje.

Dette er en **mal**. Den definerer ingen milepæler eller kort for dere. Teamet lager sine egne, når de trenger dem.

Tavlen skal være **levende og praktisk**, ikke et prosjektstyringsverktøy. Den er der for å hjelpe teamet å ta bedre beslutninger sammen. Fyller dere den ut fordi dere må, er den på feil kurs. Se [En levende tavle](docs/HVORDAN-VI-JOBBER.md#en-levende-tavle-ikke-prosjektstyring).

Bevisene kan ligge i Miro, Figma eller andre verktøy. Konklusjonen og hva den betyr for produktet skrives på kortet, så repoet blir beslutningsloggen.

Repoet gir deg issue-skjema, PR-mal, eksempelkort, etiketter og et skript som setter opp et GitHub Project. Noen innstillinger (kolonner, grenser, visninger) gjøres for hånd. Regn med ca. 20 minutter totalt.

## Kom i gang

1. **Lag ditt eget repo fra malen.** Trykk *Use this template* → *Create a new repository* på GitHub, og gjør det **privat**. Bruk ett repo per kunde. Alternativt: klon dette repoet og push det til et nytt.
2. **Kjør oppsettsskriptet.** Det krever [GitHub CLI](https://cli.github.com):
   ```bash
   gh auth refresh -s project
   ./scripts/setup.sh <eier> <repo>
   ```
   `<eier>` er GitHub-brukeren eller organisasjonen, `<repo>` er navnet på det nye repoet. Skriptet lager etikettene, et Project med fem felt og kobler det til repoet.
3. **Gjør de manuelle stegene** i [docs/OPPSETT.md](docs/OPPSETT.md): kolonner, grenser, automatisering, visninger, tilgang og kobling til dev-repoet.
4. **Hold en kort workshop** og fyll tavlen sammen. Oppskrift i [docs/HVORDAN-VI-JOBBER.md](docs/HVORDAN-VI-JOBBER.md), og bruk [eksempelkortene](docs/EKSEMPELKORT.md) til å vise hvordan et godt kort ser ut.

## Tavlen i korte trekk

```
Backlog → Neste opp → Under discovery → Klar for implementering → Implementert
                                        Ikke sant  (avsluttes her)
```

- Alle åpne kort har en **oppfølgingsdato**: når vi senest ser på kortet igjen. Det er et signal, ikke en frist å bli målt på.
- Kortene kan grupperes under **læringsmilepæler** som teamet lager selv: hva vi må vite, og innen når.
- Kort kan **blokkere hverandre**, og leveranse-issuer i dev-repoet kan **blokkeres av** antakelsene de venter på.
- Maks **3** kort under discovery og **5** i Neste opp.
- Kort som har forlatt discovery merkes med **Basis**: `Validert` (vi har bevis) eller `Bet` (vi bygger uten å ha testet, med vilje).
- Ingen kort forlater discovery uten en skrevet konklusjon og produktimplikasjon.
- Issuen lukkes når beslutningen er tatt, så milepælens fremdrift måler læring.
- «Trenger mer research» er en etikett, ikke en kolonne.
- Start smått: Risikotype, Viktighet og Sikkerhet tar dere i bruk når backlogen blir så stor at dere trenger dem.

## Innhold

```
.github/ISSUE_TEMPLATE/antakelse.yml   Skjema for nye antakelser, med beslutningsnotat
.github/ISSUE_TEMPLATE/config.yml      Slår av tomme issues, så alle bruker skjemaet
.github/pull_request_template.md       PR-mal som kopieres til dev-repoet
scripts/setup.sh                       Oppretter etiketter, Project og felt
docs/OPPSETT.md                        Manuelle steg i GitHub Projects
docs/HVORDAN-VI-JOBBER.md              Prinsipper, avtaler, rutiner, avhengigheter og kobling til dev
docs/EKSEMPELKORT.md                   Tre ferdig utfylte kort: Validert, Ikke sant og Bet
```

## Personvern

Hold denne malen fri for kundedata. Kjør de ekte tavlene i private repoer. Legg ikke personopplysninger i issues: lenk til oppsummeringer av intervjuer, ikke til opptak, navn eller rådata.

## Tilpass

Dette er et startpunkt. Etter 3–4 uker: sjekk om grensene på 3 og 5 passer, spør hva dere gjør bare fordi dere må, og fjern kolonner, felt og avtaler dere ikke bruker.
