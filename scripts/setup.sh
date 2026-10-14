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
# via gh og gjøres manuelt, se docs/OPPSETT.md.

set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Bruk: $0 <eier> <repo> [prosjekttittel]" >&2
  exit 1
fi

OWNER="$1"
REPO="$2"
TITLE="${3:-Discovery}"
FULL_REPO="$OWNER/$REPO"

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
gh label create "trenger-mer-research" --repo "$FULL_REPO" --color "fbca04" \
  --description "Testen ga ikke svar. Trenger en skarpere test" --force

echo "2/4 Oppretter prosjektet \"$TITLE\" ..."
if ! NUMBER=$(gh project create --owner "$OWNER" --title "$TITLE" --format json --jq '.number'); then
  echo "Kunne ikke opprette prosjektet. Mangler du project-tilgang? Kjør: gh auth refresh -s project" >&2
  exit 1
fi

echo "3/4 Kobler prosjektet til $FULL_REPO ..."
gh project link "$NUMBER" --owner "$OWNER" --repo "$REPO"

echo "4/4 Oppretter felt ..."
gh project field-create "$NUMBER" --owner "$OWNER" --name "Risikotype" \
  --data-type "SINGLE_SELECT" \
  --single-select-options "Verdi,Brukbarhet,Gjennomførbarhet,Levedyktighet"
gh project field-create "$NUMBER" --owner "$OWNER" --name "Viktighet" \
  --data-type "SINGLE_SELECT" \
  --single-select-options "Høy,Middels,Lav"
gh project field-create "$NUMBER" --owner "$OWNER" --name "Basis" \
  --data-type "SINGLE_SELECT" \
  --single-select-options "Validert,Bet"

echo
echo "Ferdig. Prosjekt nummer $NUMBER er opprettet og koblet til $FULL_REPO."
echo
echo "Gjenstår (kan ikke gjøres via skript), se docs/OPPSETT.md:"
echo "  - Endre Status-kolonnene"
echo "  - Sett grenser: 3 under discovery, 5 i neste opp"
echo "  - Slå på automatisering (auto-add og Backlog som startstatus)"
echo "  - Lag visningene"
echo "  - Gi teamet skrivetilgang og kunden lesetilgang"
