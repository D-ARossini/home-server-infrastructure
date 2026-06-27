#!/bin/bash

# --- CONFIGURATION ---
PROJECT_NAME=$1
BASE_DIR="/home/antha/docker-stack"
BACKUP_DIR="/home/antha/backups"

# --- VÉRIFICATIONS ---
if [ -z "$PROJECT_NAME" ]; then
  echo "ERREUR : Vous devez spécifier un nom de projet (ex: nextcloud)"
  exit 1
fi

PROJECT_DIR="$BASE_DIR/$PROJECT_NAME"
DATA_DIR="$PROJECT_DIR/data"

if [ ! -d "$PROJECT_DIR" ]; then
  echo "ERREUR : Le dossier $PROJECT_DIR n'existe pas."
  exit 1
fi

# --- NOM DU FICHIER ---
TIMESTAMP=$(date +"%Y-%m-%d_%Hh%Mm")
BACKUP_FILE="$BACKUP_DIR/${PROJECT_NAME}_${TIMESTAMP}.tar.gz"

echo "----------------------------------------------------"
echo "Sauvegarde de $PROJECT_NAME démarrée : $(date)"
echo "Fichier de destination : $BACKUP_FILE"

# --- ARRÊTER LE SERVICE (SÉCURITÉ) ---
echo "Arrêt du service $PROJECT_NAME..."
# !! VÉRIFIEZ le chemin avec "which docker-compose" !!
/usr/bin/docker-compose -f "$PROJECT_DIR/docker-compose.yml" down
echo "Service arrêté."

# --- CRÉER L'ARCHIVE ---
echo "Archivage du dossier $DATA_DIR..."
tar -czf "$BACKUP_FILE" -C "$PROJECT_DIR" data
echo "Archive créée."

# --- REDÉMARRER LE SERVICE ---
echo "Redémarrage du service $PROJECT_NAME..."
/usr/bin/docker-compose -f "$PROJECT_DIR/docker-compose.yml" up -d
echo "Service redémarré."

# --- NETTOYER LES VIEILLES SAUVEGARDES ---
echo "Nettoyage des sauvegardes de plus de 7 jours..."
find "$BACKUP_DIR" -name "${PROJECT_NAME}_*.tar.gz" -type f -mtime +7 -delete
echo "Nettoyage terminé."
echo "Sauvegarde de $PROJECT_NAME terminée."
echo "----------------------------------------------------"
