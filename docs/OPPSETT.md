# Manuelt oppsett i GitHub Projects

Gjør dette etter at `scripts/setup.sh` er kjørt. Menynavn i GitHub kan endre seg litt mellom oppdateringer. Hvis noe ikke stemmer, se prosjektets innstillinger (*Settings*) og GitHubs dokumentasjon for Projects.

## 1. Status-kolonnene

Åpne prosjektet → *Settings* → *Status*-feltet. Standardverdiene er *Todo*, *In Progress* og *Done*. Bytt dem ut med disse seks, i denne rekkefølgen:

1. Backlog
2. Neste opp
3. Under discovery
4. Klar for implementering
5. Implementert
6. Ikke sant

## 2. Grenser per kolonne

I tavlevisningen: åpne menyen på kolonnen og velg *Set limit*.

| Kolonne | Grense |
| --- | --- |
| Under discovery | 3 |
| Neste opp | 5 |

Kolonnen blir rød når grensen overskrides. Grensene er startpunkter. Juster etter 3–4 uker.

## 3. Felt på kortene

Skriptet har laget tre felt: **Risikotype**, **Viktighet** og **Basis**. Vis Risikotype på kortene i tavlevisningen (*Fields* i visningsmenyen), så den vises som farget etikett. Basis står tomt til kortet har forlatt discovery.

## 4. Automatisering

Åpne prosjektmenyen → *Workflows*:

- **Auto-add to project**: slå på for dette repoet, med filteret `is:issue label:antakelse`.
- **Item added to project**: sett Status til *Backlog*.
- **Item closed** og **Auto-archive items**: slå av. Ellers kan GitHub flytte eller skjule kort dere vil beholde som bevis.

Lukk issuen manuelt når kortet har nådd *Implementert* eller *Ikke sant*.

## 5. Visninger

Bruk *New view* og lagre filteret på hver visning:

| Visning | Type | Filter | Brukes til |
| --- | --- | --- | --- |
| Tavle | Board | `-status:Backlog` | Daglig standup |
| Backlog | Table | `status:Backlog,"Neste opp"`, sortert på Viktighet | Ukesmøtet |
| Kunde | Board | `status:"Klar for implementering",Implementert,"Ikke sant"` | Demo og kundeinnsyn |
| Bets å følge opp | Table | `basis:Bet status:Implementert` | Månedlig gjennomgang |
| Trenger mer research | Table | `label:trenger-mer-research` | Første punkt i ukesmøtet |

Treffer ikke et filter, sjekk skrivemåten på feltnavn og verdier i GitHubs dokumentasjon for filtrering i Projects.

## 6. Tilgang

- Teamet: skrivetilgang til repoet og prosjektet.
- Kunden: lesetilgang til repoet **og** prosjektet. Prosjektet viser bare issues fra private repoer til de som har tilgang til repoet.

## 7. Kobling til leveranse

Når et kort er *Klar for implementering*: lag leveranse-issuen i leveranseprosjektet og lenk til den fra kortet (for eksempel «Leveranse: org/app#123»), eller bruk sub-issues. Lenk også motsatt vei, slik at utviklerne ser hva leveransen bygger på og om det er `Validert` eller `Bet`.

## Sjekkliste

- [ ] Status har seks kolonner i riktig rekkefølge
- [ ] Grenser satt (3 og 5)
- [ ] Auto-add og Backlog som startstatus er på, Item closed er av
- [ ] Fem visninger er laget
- [ ] Teamet har skrivetilgang, kunden lesetilgang
- [ ] Et testkort er opprettet fra skjemaet og havnet i Backlog
