#!/bin/bash

# Variables passées au script
CONTEXTE_BORNE=$1

# Se placer dans le répertoire des sources
SRC=src
cd $SRC || exit

# Variables internes
declare -a repertoires=(
  "$CONTEXTE_BORNE"
  "$CONTEXTE_BORNE/App"
  "$CONTEXTE_BORNE/Domaine"
  "$CONTEXTE_BORNE/Domaine/DTO"
  "$CONTEXTE_BORNE/Domaine/Entity"
  "$CONTEXTE_BORNE/Domaine/Factory"
  "$CONTEXTE_BORNE/Domaine/Service"
  "$CONTEXTE_BORNE/Domaine/Traits"
  "$CONTEXTE_BORNE/Domaine/VO"
  "$CONTEXTE_BORNE/Infra"
  "$CONTEXTE_BORNE/Infra/Repository"
  "$CONTEXTE_BORNE/Infra/Service"
  "$CONTEXTE_BORNE/Resources"
  "$CONTEXTE_BORNE/UI"
  "$CONTEXTE_BORNE/UI/Command"
  "$CONTEXTE_BORNE/UI/Controller"
  "$CONTEXTE_BORNE/UI/templates"
)

# Fonctions
creer_repertoire () {
  mkdir -p "$1"
  cd "$1" || exit
  touch .gitkeep
  cd - || exit
}

# Créer les répertoires du contexte borné
arraylength=${#repertoires[@]}
for (( i=0; i<${arraylength}; i++ ));
do
   creer_repertoire "${repertoires[$i]}"
done

# App
# /App

# Domaine
  # Creer l'entité principale du contexte
  ENTITE_PRINCIPALE="$CONTEXTE_BORNE/Domaine/Entity/$CONTEXTE_BORNE.php"
  echo "<?php" > "$ENTITE_PRINCIPALE"
  echo "declare(strict_types=1);" >> "$ENTITE_PRINCIPALE"
  echo "" >> "$ENTITE_PRINCIPALE"
  echo "namespace $CONTEXTE_BORNE\\Domaine\\Entity\\$CONTEXTE_BORNE;" >> "$ENTITE_PRINCIPALE"
  echo "" >> "$ENTITE_PRINCIPALE"
  echo "class $CONTEXTE_BORNE" >> "$ENTITE_PRINCIPALE"
  echo "{" >> "$ENTITE_PRINCIPALE"
  echo "    // TODO : Implémenter la classe." >> "$ENTITE_PRINCIPALE"
  echo "}" >> "$ENTITE_PRINCIPALE"
  rm "$CONTEXTE_BORNE/Domaine/Entity/.gitkeep"
# /Domaine

# Infra
# /Infra

# Resources
  # Créer le fichier services.yaml
  echo "services:" > "$CONTEXTE_BORNE/Resources/services.yaml"

  # Créer le fichier routes.yaml
  echo "controllers:" > "$CONTEXTE_BORNE/Resources/routes.yaml"
  echo "    resource: ../src/$CONTEXTE_BORNE/UI/Controller/" >> "$CONTEXTE_BORNE/Resources/routes.yaml"
  echo "    type: annotation" >> "$CONTEXTE_BORNE/Resources/routes.yaml"
# /Resources

# UI
  # Création du template de base
  cp ../scripts/templates/templates/base.html.twig "$CONTEXTE_BORNE/UI/templates/base.html.twig"
  rm "$CONTEXTE_BORNE/UI/templates/.gitkeep"

  # Ajouter un path dans le fichier twig.yaml pour la config du path
  echo "twig:" >> ../config/packages/twig.yaml
  echo "    default_path: '%kernel.project_dir%/templates'" >> ../config/packages/twig.yaml
  echo "    paths:" >> ../config/packages/twig.yaml
  echo "        '$CONTEXTE_BORNE/UI/templates': '$CONTEXTE_BORNE'" >> ../config/packages/twig.yaml
# /UI

