# Manuelt oppsett i GitHub Projects

Gjør dette etter at `scripts/setup.sh` er kjørt. Menynavn i GitHub kan endre seg litt mellom oppdateringer. Hvis noe ikke stemmer, se prosjektets innstillinger (*Settings*) og GitHubs dokumentasjon for Projects.

Husk at tavlen skal være levende og praktisk. Start med det minste som fungerer: kolonnene, kortskjemaet og oppfølgingsdatoen. Resten kan dere slå på når dere trenger det.

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

Skriptet har laget fem felt. *Milestone* og *Assignees* er innebygde felt i GitHub.

| Felt | Verdier | Brukes |
| --- | --- | --- |
| Oppfølging | Dato | Alle åpne kort: når vi senest ser på kortet igjen |
| Risikotype | Verdi, Brukbarhet, Gjennomførbarhet, Levedyktighet | Når backlogen vokser |
| Viktighet | Høy, Middels, Lav | Når backlogen vokser |
| Sikkerhet | Lav, Middels, Høy | Når backlogen vokser |
| Basis | Validert, Bet | Når kortet forlater discovery |

Felt dere ikke bruker ennå, kan dere skjule i visningene (*Fields* i visningsmenyen). Vis Oppfølging på alle kort. Vis Risikotype og Milestone på kortene i tavlevisningen hvis dere bruker dem.

## 4. Læringsmilepæler (teamet lager dem selv)

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

## 5. Automatisering

Åpne prosjektmenyen → *Workflows*:

- **Auto-add to project**: slå på for dette repoet, med filteret `is:issue label:antakelse`.
- **Item added to project**: sett Status til *Backlog*.
- **Item closed** og **Auto-archive items**: slå av. Status settes for hånd, og lukkede kort skal bli liggende som beslutningslogg.

**Når lukkes en issue?** Når beslutningen er tatt: kortet flyttes til *Klar for implementering* eller *Ikke sant*. Da måler fremdriftslinjen på milepælen læring, ikke leveranse. Kortet kan fortsatt flyttes til *Implementert* etterpå.

## 6. Visninger

Bruk *New view* og lagre filteret på hver visning:

| Visning | Type | Filter og oppsett | Brukes til |
| --- | --- | --- | --- |
| Tavle | Board | `-status:Backlog` | Daglig standup |
| Til oppfølging | Table | `oppfølging:<=@today`, sortert på Oppfølging | Første punkt i ukesmøtet |
| Backlog | Table | `status:Backlog,"Neste opp"`, sortert på Oppfølging (eller Viktighet og Sikkerhet, hvis dere bruker dem) | Ukesmøtet |
| Milepæler | Table | Gruppert på Milestone | Fremdrift per læringsmilepæl |
| Trenger mer research | Table | `label:trenger-mer-research` | Ukesmøtet |
| Kunde | Board | `status:"Klar for implementering",Implementert,"Ikke sant"` | Demo og kundeinnsyn |

Sortert stigende kommer Høy viktighet og Lav sikkerhet øverst, altså de kortene som bør testes først. Filtrene er ikke testet mot alle oppsett. Treffer ikke et filter, sjekk skrivemåten på feltnavn og verdier i GitHubs dokumentasjon for filtrering i Projects.

## 7. Tilgang

- Teamet: skrivetilgang til repoet og prosjektet.
- Kunden: lesetilgang til repoet **og** prosjektet. Prosjektet viser bare issues fra private repoer til de som har tilgang til repoet.
- Avhengigheter (se under) krever minst triage-tilgang til repoet.

## 8. Avhengigheter mellom kort

Ingen oppsett nødvendig. Åpne et kort → *Relationships* i sidepanelet → *Mark as blocked by* eller *Mark as blocking*. Fra terminalen: `gh issue edit <nummer> --add-blocked-by <nummer eller URL>`. Et kort med åpne blokkere får et *Blocked*-ikon på tavlen.

## 9. Kobling til dev-repo og dev-prosjekt

1. Kopier `templates/dev-repo/pull_request_template.md` til dev-repoet som `.github/pull_request_template.md`. Da oppgir hver PR hvilken antakelse den bygger på, og om den er Validert eller Bet.
2. Marker leveranse-issuer som blokkert av antakelsene de venter på:
   ```bash
   gh issue edit <nr> --repo <eier>/<dev-repo> \
     --add-blocked-by https://github.com/<eier>/<discovery-repo>/issues/<nr>
   ```
   Dev-tavlen viser da *Blocked*-ikonet til beslutningen er tatt.
3. Skriv også en lenke i teksten, som reserve: «Bygger på: org/discovery#123» i leveranse-issuen, og «Leveranse: org/app#456» på kortet.

**Test først.** At avhengigheter virker på tvers av repoer står ikke eksplisitt i GitHubs dokumentasjon. Prøv med to testrepoer, og sjekk at *Blocked*-ikonet forsvinner når blokkeren lukkes.

## Sjekkliste

- [ ] Status har seks kolonner i riktig rekkefølge
- [ ] Grenser satt (3 og 5)
- [ ] Auto-add og Backlog som startstatus er på, Item closed og Auto-archive er av
- [ ] Visningene er laget
- [ ] Teamet har skrivetilgang (minst triage), kunden lesetilgang
- [ ] Teamet vet hvordan de oppretter en milepæl og setter en avhengighet
- [ ] PR-malen er kopiert til dev-repoet
- [ ] Avhengigheter på tvers av repoer er testet med to testrepoer
- [ ] Et testkort er opprettet fra skjemaet og havnet i Backlog
