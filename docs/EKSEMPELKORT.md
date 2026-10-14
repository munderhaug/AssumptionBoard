# Eksempelkort

Tre ferdig utfylte kort, ett for hver beslutning. Bruk dem i workshopen, så teamet ser hvordan et godt kort ser ut før de skriver sine egne. Legg gjerne merke til at et *Ikke sant*-kort er et godt resultat: vi slapp å bygge noe som ikke virket.

Alle tre hører til samme læringsmilepæl. Milepælen er også bare et eksempel: dere lager deres egne.

> **LM1: Vi vet om automatisk fakturaimport er verdt å bygge** (frist 15. november)
>
> Avgjør leveransemilepæl *M2: Import i pilot*.

---

## Kort 1: Ikke sant

**Tittel:** Vi tror at vi kan importere 80 % av fakturaene automatisk

**Risikotype:** Gjennomførbarhet · **Viktighet:** Høy · **Sikkerhet:** Høy · **Eier:** utvikler

**Vi tror at…** vi kan importere 80 % av kundenes fakturaer automatisk fra deres eksisterende regnskapseksporter, uten manuell kobling av felt.

**Vi tester ved å…** kjøre en spike på to dager som leser 30 ekte eksportfiler fra tre pilotkunder.

**Vi har rett hvis…** minst 24 av 30 filer importeres uten manuell feltkobling.

**Beslutning og innsikt**
- **Beslutning:** Ikke sant
- **Det vi så:** 19 av 30 filer gikk gjennom. Alle de 11 feilene kom fra én leverandørs datoformat.
- **Produktimplikasjon:** Vi bygger automatisk import for de to andre leverandørene og manuell feltkobling for leverandør X. Nytt kort: «Brukere av leverandør X godtar å koble felt én gang.»
- **Bevis:** spike-branch `spike/import-test`, resultatark (fane «Runde 1»), 3. oktober.

---

## Kort 2: Validert

**Tittel:** Vi tror at pilotkundene vil laste opp fakturaer selv

**Risikotype:** Verdi · **Viktighet:** Høy · **Sikkerhet:** Middels · **Eier:** designer

**Vi tror at…** minst halvparten av pilotkundene vil laste opp fakturaer selv, i stedet for å sende dem på e-post til regnskapsføreren, hvis opplastingen tar under ett minutt.

**Vi tester ved å…** teste en klikkbar prototype med 8 brukere hos pilotkundene og spørre hvordan de sender fakturaer i dag.

**Vi har rett hvis…** minst 5 av 8 fullfører opplastingen på under ett minutt og sier de ville brukt den i stedet for e-post.

**Beslutning og innsikt**
- **Beslutning:** Validert
- **Det vi så:** 6 av 8 fullførte på under ett minutt og ville brukt den. De to som ikke ville, har en regnskapsfører som henter fakturaene selv.
- **Produktimplikasjon:** Opplasting blir hovedflyten i M2. E-post beholdes som reserve. Sikkerheten er middels fordi utvalget er lite, så vi måler faktisk bruk i piloten.
- **Bevis:** Miro-frame «Prototypetest uke 40, oppsummering», 7. oktober.

---

## Kort 3: Bet

**Tittel:** Vi tror at brukerne forstår statusikonene uten forklaring

**Risikotype:** Brukbarhet · **Viktighet:** Lav · **Sikkerhet:** Middels · **Eier:** designer · **Oppfølging:** 1. desember

**Vi tror at…** brukerne forstår de fire statusikonene på fakturalisten uten hjelpetekst.

**Vi tester ved å…** ikke teste før lansering. Ikonene følger et kjent mønster, og de er enkle å endre.

**Vi har rett hvis…** det kommer færre enn 5 henvendelser til support om fakturastatus per måned.

**Beslutning og innsikt**
- **Beslutning:** Bet
- **Det vi så:** Ikke testet. Ikonene er hentet fra designsystemet, der de brukes i to andre produkter.
- **Produktimplikasjon:** Bygges som skissert. Hvis vi får flere henvendelser enn grensen, legger vi til en tekst ved siden av ikonet.
- **Bevis:** lenke til komponentene i designsystemet.
- **Hvis Bet, måling vi følger:** antall supporthenvendelser merket «fakturastatus».
