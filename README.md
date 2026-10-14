# Antakelsestavle: mal for synlig discovery

En mal som lar hele teamet eie discovery. Hvert kort på tavlen er en **antakelse**, ikke en oppgave: noe vi tror, men ikke har verifisert. Tavlen viser hva vi tester, hva som er bekreftet, hva som viste seg ikke å stemme, og hva vi bygget på gjetning med vilje.

Repoet gir deg issue-skjema, etiketter og et skript som setter opp et GitHub Project. Noen innstillinger (kolonner, grenser, visninger) kan ikke settes opp av skript og gjøres for hånd. Regn med ca. 15 minutter totalt.

## Kom i gang

1. **Lag ditt eget repo fra malen.** Trykk *Use this template* → *Create a new repository* på GitHub. Alternativt: klon dette repoet og push det til et nytt.
2. **Kjør oppsettsskriptet.** Det krever [GitHub CLI](https://cli.github.com):
   ```bash
   gh auth refresh -s project
   ./scripts/setup.sh <eier> <repo>
   ```
   `<eier>` er GitHub-brukeren eller organisasjonen, `<repo>` er navnet på det nye repoet. Skriptet lager etikettene, et Project med tre felt og kobler det til repoet.
3. **Gjør de manuelle stegene** i [docs/OPPSETT.md](docs/OPPSETT.md): kolonner, grenser, automatisering, visninger og tilgang.
4. **Hold en kort workshop** og fyll tavlen sammen. Oppskrift i [docs/HVORDAN-VI-JOBBER.md](docs/HVORDAN-VI-JOBBER.md).

## Tavlen i korte trekk

```
Backlog → Neste opp → Under discovery → Klar for implementering → Implementert
                                        Ikke sant  (avsluttes her)
```

- Maks **3** kort under discovery og **5** i Neste opp.
- Kort som har forlatt discovery merkes med **Basis**: `Validert` (vi har bevis) eller `Bet` (vi bygger uten å ha testet, med vilje).
- Ingen kort forlater discovery uten en lenke eller et notat som bevis.
- «Trenger mer research» er en etikett, ikke en kolonne.

## Innhold

```
.github/ISSUE_TEMPLATE/antakelse.yml   Skjema for nye antakelser
.github/ISSUE_TEMPLATE/config.yml      Slår av tomme issues, så alle bruker skjemaet
scripts/setup.sh                       Oppretter etiketter, Project og felt
docs/OPPSETT.md                        Manuelle steg i GitHub Projects
docs/HVORDAN-VI-JOBBER.md              Prinsipper, regler, rutiner og beslutningsnotat
```

## Tilpass

Dette er et startpunkt. Etter 3–4 uker: sjekk om grensene på 3 og 5 passer, og fjern kolonner og felt dere ikke bruker.
