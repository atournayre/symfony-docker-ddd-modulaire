#!/bin/sh

CONTEXTE_BORNE=$1

SRC=src
cd $SRC || exit

REP_CONTEXTE_BORNE=$CONTEXTE_BORNE
REP_APP=$CONTEXTE_BORNE/App
REP_DOMAINE=$CONTEXTE_BORNE/Domaine
REP_INFRA=$CONTEXTE_BORNE/Infra
REP_RESSOURCES=$CONTEXTE_BORNE/Resources
REP_UI=$CONTEXTE_BORNE/UI

creer_repertoire () {
  mkdir -p "$1"
  cd "$1" || exit
  touch .gitkeep
  cd - || exit
}

creer_repertoire "$REP_CONTEXTE_BORNE"
creer_repertoire "$REP_APP"
creer_repertoire "$REP_DOMAINE"
creer_repertoire "$REP_INFRA"
creer_repertoire "$REP_RESSOURCES"
creer_repertoire "$REP_UI"

echo "services:" > "$CONTEXTE_BORNE/Resources/services.yaml"

