# Manuelt oppsett i GitHub Projects

Gjør dette etter at `scripts/setup.sh` er kjørt. Menynavn i GitHub kan endre seg litt mellom oppdateringer. Hvis noe ikke stemmer, se prosjektets innstillinger (*Settings*) og GitHubs dokumentasjon for Projects.

## 1. Læringsmilepæler

Hvert kort hører til én læringsmilepæl. Vi bruker GitHubs egne *Milestones* i repoet. De har frist og fremdriftslinje, og de kan brukes til å gruppere og filtrere i prosjektet.

Opprett dem i repoet under *Issues* → *Milestones* → *New milestone*:

- **Tittel:** det vi må vite, for eksempel «LM1: Vi vet om automatisk fakturaimport er verdt å bygge».
- **Frist:** når vi må vite det.
- **Beskrivelse:** hvilken leveransemilepæl den avgjør, for eksempel «Avgjør M2: Import i pilot».

Eller fra kommandolinjen:

```bash
gh api repos/<eier>/<repo>/milestones \
  -f title="LM1: Vi vet om automatisk fakturaimport er verdt å bygge" \
  -f due_on="2026-11-15T23:59:59Z" \
  -f description="Avgjør M2: Import i pilot"
```

Start med 1–3 milepæler. En issue kan bare ha én milepæl, og milepæler hører til ett repo. Bruk derfor ett discovery-repo per kunde.

## 2. Status-kolonnene

Åpne prosjektet → *Settings* → *Status*-feltet. Standardverdiene er *Todo*, *In Progress* og *Done*. Bytt dem ut med disse seks, i denne rekkefølgen:

1. Backlog
2. Neste opp
3. Under discovery
4. Klar for implementering
5. Implementert
6. Ikke sant

## 3. Grenser per kolonne

I tavlevisningen: åpne menyen på kolonnen og velg *Set limit*.

| Kolonne | Grense |
| --- | --- |
| Under discovery | 3 |
| Neste opp | 5 |

Kolonnen blir rød når grensen overskrides. Grensene er startpunkter. Juster etter 3–4 uker.

## 4. Felt på kortene

Skriptet har laget fem felt. *Milestone* og *Assignees* er innebygde felt i GitHub.

| Felt | Verdier | Brukes |
| --- | --- | --- |
| Risikotype | Verdi, Brukbarhet, Gjennomførbarhet, Levedyktighet | Alle kort |
| Viktighet | Høy, Middels, Lav | Alle kort |
| Sikkerhet | Lav, Middels, Høy | Alle kort: hvor godt bevisene i dag underbygger det vi mener |
| Basis | Validert, Bet | Når kortet forlater discovery |
| Oppfølging | Dato | Bare på Bet-kort |

Vis Risikotype og Milestone på kortene i tavlevisningen (*Fields* i visningsmenyen).

## 5. Automatisering

Åpne prosjektmenyen → *Workflows*:

- **Auto-add to project**: slå på for dette repoet, med filteret `is:issue label:antakelse`.
- **Item added to project**: sett Status til *Backlog*.
- **Item closed** og **Auto-archive items**: slå av. Status settes for hånd, og lukkede kort skal bli liggende som beslutningslogg.

**Når lukkes en issue?** Når beslutningen er tatt: kortet flyttes til *Klar for implementering* eller *Ikke sant*. Da måler fremdriftslinjen på milepælen læring, ikke leveranse. Kortet kan fortsatt flyttes til *Implementert* etterpå, og Bet-kort følges opp selv om de er lukket.

## 6. Visninger

Bruk *New view* og lagre filteret på hver visning:

| Visning | Type | Filter og oppsett | Brukes til |
| --- | --- | --- | --- |
| Tavle | Board | `-status:Backlog` | Daglig standup |
| Backlog | Table | `status:Backlog,"Neste opp"`, sortert på Viktighet og så Sikkerhet | Ukesmøtet |
| Milepæler | Table | Gruppert på Milestone | Fremdrift per læringsmilepæl |
| Bets å følge opp | Table | `basis:Bet`, sortert på Oppfølging | Ukesmøtet |
| Trenger mer research | Table | `label:trenger-mer-research` | Første punkt i ukesmøtet |
| Kunde | Board | `status:"Klar for implementering",Implementert,"Ikke sant"` | Demo og kundeinnsyn |

Sortert stigende kommer Høy viktighet og Lav sikkerhet øverst, altså de kortene som bør testes først. Filtrene er ikke testet mot alle oppsett. Treffer ikke et filter, sjekk skrivemåten på feltnavn og verdier i GitHubs dokumentasjon for filtrering i Projects.

## 7. Tilgang

- Teamet: skrivetilgang til repoet og prosjektet.
- Kunden: lesetilgang til repoet **og** prosjektet. Prosjektet viser bare issues fra private repoer til de som har tilgang til repoet.

## 8. Kobling til leveranse

- Kopier `.github/pull_request_template.md` til leveranserepoene. Da oppgir hver PR hvilken antakelse den bygger på, og om den er Validert eller Bet.
- Når et kort er *Klar for implementering*: lag leveranse-issuen i leveranseprosjektet og lenk til den fra kortet (for eksempel «Leveranse: org/app#123»). Lenk også motsatt vei.

## Sjekkliste

- [ ] 1–3 læringsmilepæler er opprettet, med frist og hvilken leveransemilepæl de avgjør
- [ ] Status har seks kolonner i riktig rekkefølge
- [ ] Grenser satt (3 og 5)
- [ ] Auto-add og Backlog som startstatus er på, Item closed og Auto-archive er av
- [ ] Seks visninger er laget
- [ ] Teamet har skrivetilgang, kunden lesetilgang
- [ ] PR-malen er kopiert til leveranserepoene
- [ ] Et testkort er opprettet fra skjemaet og havnet i Backlog
