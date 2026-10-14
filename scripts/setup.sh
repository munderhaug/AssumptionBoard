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

echo "4/4 Oppretter felt (Risikotype, Viktighet, Sikkerhet, Basis, Oppfølging) ..."
gh project field-create "$NUMBER" --owner "$OWNER" --name "Risikotype" \
  --data-type "SINGLE_SELECT" \
  --single-select-options "Verdi,Brukbarhet,Gjennomførbarhet,Levedyktighet"
gh project field-create "$NUMBER" --owner "$OWNER" --name "Viktighet" \
  --data-type "SINGLE_SELECT" \
  --single-select-options "Høy,Middels,Lav"
# Oppfølging er datoen vi senest ser på et åpent kort igjen (ikke en frist).
# Risikotype, Viktighet og Sikkerhet kan dere ignorere til backlogen vokser.
# Rekkefølgen på valgene er bevisst: sortert stigende kommer Høy viktighet
# og Lav sikkerhet først, altså de kortene som bør testes først.
gh project field-create "$NUMBER" --owner "$OWNER" --name "Sikkerhet" \
  --data-type "SINGLE_SELECT" \
  --single-select-options "Lav,Middels,Høy"
gh project field-create "$NUMBER" --owner "$OWNER" --name "Basis" \
  --data-type "SINGLE_SELECT" \
  --single-select-options "Validert,Bet"
gh project field-create "$NUMBER" --owner "$OWNER" --name "Oppfølging" \
  --data-type "DATE"

echo
echo "Ferdig. Prosjekt nummer $NUMBER er opprettet og koblet til $FULL_REPO."
echo
echo "Gjenstår (kan ikke gjøres via skript), se docs/OPPSETT.md fra steg 4:"
echo "  - Endre Status-kolonnene"
echo "  - Slå på automatisering (auto-add og Backlog som startstatus)"
echo "  - Lag visningene"
echo "  - Sett grenser: 3 under discovery, 5 i neste opp"
echo "  - Gi teamet skrivetilgang (minst triage) og kunden lesetilgang"
echo "  - Kopier PR-malen til dev-repoet"
echo "  - Prøv med et testkort"
echo
echo "Læringsmilepæler lager teamet selv, når de trenger dem."
