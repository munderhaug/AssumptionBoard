# Eksempelkort

Fire ferdig utfylte kort: én utforsking og tre antakelser, én for hver beslutning. De viser hvordan et godt kort ser ut. Utforskingen kom først, og to av antakelsene kom fra den. Legg gjerne merke til at et *Ikke sant*-kort er et godt resultat: vi slapp å bygge noe som ikke virket.

Alle fire hører til samme læringsmilepæl. Milepælen er også bare et eksempel: dere lager deres egne.

> **LM1: Vi vet om automatisk fakturaimport er verdt å bygge** (frist 15. november)
>
> Avgjør leveransemilepæl *M2: Import i pilot*.

---

## Kort 1: Utforsking

**Tittel:** Vi vil forstå hvordan fakturaene kommer fra pilotkundene til regnskapsføreren i dag

**Viktighet:** Høy · **Eier:** designer og utvikler · **Status:** Innsikt

**Vi vil forstå…** hvordan fakturaene kommer fra pilotkundene til regnskapsføreren i dag, og hvor det stopper opp. Svaret avgjør hva vi tester først før M2.

**Vi utforsker ved å…** ha samtaler med regnskapsførere og pilotkunder om hvordan de håndterte fakturaene forrige uke, og se på eksportfilene fra regnskapssystemene pilotkundene bruker.

**Vi er ferdige når…** vi har hatt seks samtaler, eller etter to uker, det som kommer først.

**Innsikt**
- **Det vi så:** I 5 av 6 samtaler kom fakturaene som PDF på e-post, og regnskapsføreren la dem inn for hånd. Pilotkundene bruker tre ulike regnskapssystemer, og alle kan eksportere fakturaene, men i ulike formater.
- **Nye kort:** «Vi tror at vi kan importere 80 % av fakturaene automatisk» (kort 2) og «Vi tror at pilotkundene vil laste opp fakturaer selv» (kort 3).
- **Nye spørsmål:** Hvor mye tid går med til å purre på fakturaer som mangler? Ikke et kort ennå.
- **Bevis:** Miro-frame «Fakturaflyt, oppsummering av seks samtaler», 26. september.

---

## Kort 2: Ikke sant

**Tittel:** Vi tror at vi kan importere 80 % av fakturaene automatisk

**Risikotype:** Gjennomførbarhet · **Viktighet:** Høy · **Sikkerhet:** Høy · **Eier:** utvikler

**Vi tror at…** vi kan importere 80 % av kundenes fakturaer automatisk fra deres eksisterende regnskapseksporter, uten manuell kobling av felt. Kommer fra kort 1.

**Vi tester ved å…** kjøre en spike på to dager som leser 30 ekte eksportfiler fra tre pilotkunder.

**Vi har rett hvis…** minst 24 av 30 filer importeres uten manuell feltkobling.

**Beslutning og innsikt**
- **Beslutning:** Ikke sant
- **Det vi så:** 19 av 30 filer gikk gjennom. Alle de 11 feilene kom fra én leverandørs datoformat.
- **Produktimplikasjon:** Vi bygger automatisk import for de to andre leverandørene og manuell feltkobling for leverandør X. Nytt kort: «Brukere av leverandør X godtar å koble felt én gang.»
- **Bevis:** spike-branch `spike/import-test`, resultatark (fane «Runde 1»), 3. oktober.

---

## Kort 3: Validert

**Tittel:** Vi tror at pilotkundene vil laste opp fakturaer selv

**Risikotype:** Verdi · **Viktighet:** Høy · **Sikkerhet:** Middels · **Eier:** designer

**Vi tror at…** minst halvparten av pilotkundene vil laste opp fakturaer selv, i stedet for å sende dem på e-post til regnskapsføreren, hvis opplastingen tar under ett minutt. Kommer fra kort 1.

**Vi tester ved å…** gi 8 brukere hos pilotkundene en enkel opplastingsside i én uke, ved siden av e-post, og se hvem som bruker den.

**Vi har rett hvis…** minst 4 av 8 laster opp minst én faktura selv i løpet av uka.

**Beslutning og innsikt**
- **Beslutning:** Validert
- **Det vi så:** 6 av 8 lastet opp selv, og alle opplastingene tok under ett minutt. De to som ikke gjorde det, har en regnskapsfører som henter fakturaene selv.
- **Produktimplikasjon:** Opplasting blir hovedflyten i M2. E-post beholdes som reserve. Sikkerheten er middels fordi utvalget er lite og perioden kort, så vi følger med på bruken i piloten.
- **Bevis:** bruksdata fra opplastingssiden og Miro-frame «Opplastingstest uke 41, oppsummering», 14. oktober.

---

## Kort 4: Bet

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
