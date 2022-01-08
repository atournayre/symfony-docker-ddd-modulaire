#!/bin/sh

# Variables passées au script
CONTEXTE_BORNE=$1

# Se placer dans le répertoire des sources
SRC=src
cd $SRC || exit

# Variables internes
REP_CONTEXTE_BORNE=$CONTEXTE_BORNE
REP_APP=$CONTEXTE_BORNE/App
REP_DOMAINE=$CONTEXTE_BORNE/Domaine
REP_INFRA=$CONTEXTE_BORNE/Infra
REP_RESSOURCES=$CONTEXTE_BORNE/Resources
REP_UI=$CONTEXTE_BORNE/UI

# Fonctions
creer_repertoire () {
  mkdir -p "$1"
  cd "$1" || exit
  touch .gitkeep
  cd - || exit
}

# Créer les répertoires du contexte borné
creer_repertoire "$REP_CONTEXTE_BORNE"
creer_repertoire "$REP_APP"
creer_repertoire "$REP_DOMAINE"
creer_repertoire "$REP_INFRA"
creer_repertoire "$REP_RESSOURCES"
creer_repertoire "$REP_UI"
creer_repertoire "$REP_UI/Controller"
creer_repertoire "$REP_UI/templates"

# Créer le fichier services.yaml
echo "services:" > "$CONTEXTE_BORNE/Resources/services.yaml"

# Créer le fichier routes.yaml
echo "controllers:" > "$CONTEXTE_BORNE/Resources/routes.yaml"
echo "    resource: ../src/$CONTEXTE_BORNE/UI/Controller/" >> "$CONTEXTE_BORNE/Resources/routes.yaml"
echo "    type: annotation" >> "$CONTEXTE_BORNE/Resources/routes.yaml"

