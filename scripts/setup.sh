#!/usr/bin/env bash
# Setter opp etiketter og et GitHub Project for antakelsestavlen.
#
# Bruk:   ./scripts/setup.sh <eier> <repo> [prosjekttittel]
# Eksempel: ./scripts/setup.sh mitt-selskap kunde-x-discovery "Discovery"
#
# Krever GitHub CLI (gh) med project-tilgang:
#   gh auth refresh -s project
#
# Skriptet oppretter alltid et NYTT Project. Kjør det bare én gang per tavle.
# Kolonner (Status), grenser, automatisering og visninger kan ikke settes opp
# via gh. De gjøres manuelt, eller følger med fra et malprosjekt (se under og
# «Malprosjekt» i docs/OPPSETT.md).

set -euo pipefail

# Malprosjekt: et ferdig oppsatt Project som kopieres i stedet for å bygge
# feltene på nytt, på formen <eier>/<nummer>. Settes én gang i malen.
# Tom verdi: skriptet lager prosjektet fra bunnen av.
MALPROSJEKT="${MALPROSJEKT:-}"

if [ "$#" -lt 2 ]; then
  echo "Bruk: $0 <eier> <repo> [prosjekttittel]" >&2
  exit 1
fi

OWNER="$1"
REPO="$2"
TITLE="${3:-Discovery}"
FULL_REPO="$OWNER/$REPO"

if [ -n "$MALPROSJEKT" ] && ! [[ "$MALPROSJEKT" =~ ^[^/]+/[0-9]+$ ]]; then
  echo "MALPROSJEKT må ha formen <eier>/<nummer>, f.eks. mitt-selskap/3. Nå: $MALPROSJEKT" >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "Fant ikke GitHub CLI (gh). Installer fra https://cli.github.com" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Du er ikke logget inn. Kjør: gh auth login" >&2
  exit 1
fi

echo "1/4 Oppretter etiketter i $FULL_REPO ..."
gh label create "antakelse" --repo "$FULL_REPO" --color "1d76db" \
  --description "Noe vi tror, men ikke har verifisert" --force
gh label create "utforsking" --repo "$FULL_REPO" --color "5319e7" \
  --description "Noe vi må forstå før vi vet hva vi tror" --force
gh label create "trenger-mer-research" --repo "$FULL_REPO" --color "fbca04" \
  --description "Testen ga ikke svar. Trenger en skarpere test" --force

if [ -n "$MALPROSJEKT" ]; then
  echo "2/4 Kopierer malprosjektet $MALPROSJEKT til \"$TITLE\" ..."
  if ! NUMBER=$(gh project copy "${MALPROSJEKT#*/}" --source-owner "${MALPROSJEKT%/*}" \
      --target-owner "$OWNER" --title "$TITLE" --format json --jq '.number'); then
    echo "Kunne ikke kopiere malprosjektet. Kan du lese det, og har du project-tilgang? Kjør: gh auth refresh -s project" >&2
    exit 1
  fi
else
  echo "2/4 Oppretter prosjektet \"$TITLE\" ..."
  if ! NUMBER=$(gh project create --owner "$OWNER" --title "$TITLE" --format json --jq '.number'); then
    echo "Kunne ikke opprette prosjektet. Mangler du project-tilgang? Kjør: gh auth refresh -s project" >&2
    exit 1
  fi
fi

echo "3/4 Kobler prosjektet til $FULL_REPO ..."
gh project link "$NUMBER" --owner "$OWNER" --repo "$REPO"

if [ -n "$MALPROSJEKT" ]; then
  echo "4/4 Feltene følger med fra malprosjektet."
else
  echo "4/4 Oppretter felt (Risikotype, Basis, Oppfølging) ..."
  # Oppfølging er datoen vi senest ser på et åpent kort igjen (ikke en frist).
  # Risikotype kan dere ignorere til dere trenger den. Viktighet og Sikkerhet
  # lages ikke her. Trenger dere dem, se «Flere felt» i docs/OPPSETT.md.
  gh project field-create "$NUMBER" --owner "$OWNER" --name "Risikotype" \
    --data-type "SINGLE_SELECT" \
    --single-select-options "Verdi,Brukbarhet,Gjennomførbarhet,Levedyktighet"
  gh project field-create "$NUMBER" --owner "$OWNER" --name "Basis" \
    --data-type "SINGLE_SELECT" \
    --single-select-options "Validert,Bet"
  gh project field-create "$NUMBER" --owner "$OWNER" --name "Oppfølging" \
    --data-type "DATE"
fi

echo
echo "Ferdig. Prosjekt nummer $NUMBER er opprettet og koblet til $FULL_REPO."
echo
echo "Gjenstår (kan ikke gjøres via skript), se docs/OPPSETT.md fra steg 4:"
if [ -n "$MALPROSJEKT" ]; then
  echo "  - Sjekk at kolonnene, workflowene, visningene og grensene kom med"
  echo "  - Slå på auto-add med filteret is:issue (følger ikke med i kopien)"
else
  echo "  - Endre Status-kolonnene (syv, med Innsikt sist)"
  echo "  - Slå på automatisering (auto-add med filteret is:issue, og Backlog som startstatus)"
  echo "  - Lag visningene"
  echo "  - Sett grenser: 3 under discovery, 5 i neste opp"
fi
echo "  - Bytt ut README med en beskrivelse av tavlen"
echo "  - Gi teamet skrivetilgang (minst triage) og kunden lesetilgang"
echo "  - Kopier PR-malen til dev-repoet"
echo "  - Prøv med et testkort av hver type"
echo
echo "Læringsmilepæler lager teamet selv, når de trenger dem."
