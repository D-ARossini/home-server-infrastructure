#!/bin/bash
#dockermaster: Gère les actions de base sur les projets docker

ACTIION=$1 #action demandée (start, stop, status, build)

#liste des chemins absolus vers les futurs projets docker (à modifier au fil du temps)
PROJECTS=(
        "/home/antha/nextcloud_data"
        "/home/antha/minecraft"
        "/home/antha/discord"
)
if [ -z "$ACTION" ]; then
        echo  "Usage: dockermaster [start | stop | status | build]"
        exit 1
fi

echo "Exécution de l action '$ACTION' sur les projets Docker..."
echo "_________________________________________________________"

for dir in "${PROJECTS[@]}"; do
        if [ -d "$dir" ] && [ -f "$dir/docker-compose.yml" ]; then
                echo "---> Project : $(basename "$dir")"

                sudo docker-compose -f "$dir/docker-compose.yml" "$ACTION"

                if [ $? -ne 0 ]; then
                        echo "ERREUR lors de l'exécution de l'action $ACTION sur $dir"
                fi
                echo " "

        elif [ ! -d "$dir" ]; then
                echo "Avertissement: le répertoire $dir n'existe pas."
        fi
done

echo "Opération terminée."
