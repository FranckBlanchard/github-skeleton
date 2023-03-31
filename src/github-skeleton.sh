#!/bin/bash

# Script: github-skeleton
# Description: Script pour créer une structure de projet GitHub avec des fichiers et répertoires de base
# Auteur: [votre nom]
# Date: [date de création]

# Vérifie que le nombre de paramètres est égal à 1
if [ $# -ne 1 ]; then
  echo "Utilisation: $0 <nom-du-projet>"
  exit 1
fi

# Stocke le nom du projet dans une variable
PROJECT_NAME=$1

###########################
## Partie à personaliser ##
###########################

# Définit le nom de l'auteur et son email
AUTHOR=""
EMAIL=""

# Liste des répertoires à créer
DIRECTORIES=(
    src
    tests
    examples
)

#####################################
## Fin de la partie à personaliser ##
#####################################

# Crée le répertoire du projet
mkdir $PROJECT_NAME
cd $PROJECT_NAME

# Crée le fichier index.php à la racine du projet
echo "<?php" >> index.php
echo "" >> index.php
echo "/**" >> index.php
echo " * Nom du projet : $PROJECT_NAME" >> index.php
echo " * Auteur : $AUTHOR" >> index.php
echo " * Email : $EMAIL" >> index.php
echo " * Date de création : $(date +%Y-%m-%d)" >> index.php
echo " */" >> index.php
echo "" >> index.php

# Crée le fichier .gitignore
echo "vendor/" >> .gitignore
echo "composer.lock" >> .gitignore

# Crée les répertoires et fichiers exemples
for directory in "${DIRECTORIES[@]}"
do
    mkdir "$directory"
done

# Crée le fichier README.md
echo "# $PROJECT_NAME" >> README.md
echo "" >> README.md
echo "## Description" >> README.md
echo "" >> README.md
echo "## Installation" >> README.md
echo "" >> README.md
echo "## Utilisation" >> README.md
echo "" >> README.md
echo "## Contribuer" >> README.md
echo "" >> README.md
echo "## Licence" >> README.md
echo "" >> README.md

# Crée le fichier LICENSE
touch LICENSE

# Crée le fichier composer.json
echo "{" >> composer.json
echo "  \"name\": \"$PROJECT_NAME\"," >> composer.json
echo "  \"description\": \"Description de votre projet\"," >> composer.json
echo "  \"authors\": [" >> composer.json
echo "    {" >> composer.json
echo "      \"name\": \"$AUTHOR\"," >> composer.json
echo "      \"email\": \"$EMAIL\"" >> composer.json
echo "    }" >> composer.json
echo "  ]" >> composer.json
echo "}" >> composer.json

# Affiche un message de confirmation avec le nom du projet
echo "Le projet $PROJECT_NAME a été créé avec succès."
