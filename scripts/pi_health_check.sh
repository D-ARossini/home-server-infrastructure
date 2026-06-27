#!/bin/bash

echo "___  Rapport De Santé Raspberry Pi ___"
echo " "

# 1. Etat du CPU et de la température
echo "## Température du CPU :"
# Affiche la température
cat /sys/class/thermal/thermal_zone0/temp
echo " "

# 2. Utilisation de la RAM (8go)
echo "## Utlisation de la RAM (mémoire) :"
# Affiche la mémoire libre et utilisée en formal lisible (h)
free -h
echo " "

# 3. Utilisation du stockage (carte SD/SSD)
echo "## Utilisation du stockage (Fichier) :"
# Affiche l'utilisation des partitions montées en format lisible (h)
df -h
echo " "

# 4. Processus gourmand les plus importants
echo "## Processus les plus gourmands (Top 5) :"
# Affiche la liste des processus triée par utilisateurs du CPU
ps aux --sort=-%cpu | head -n 6
echo " "

echo "___ Fin De Rapport ___"
