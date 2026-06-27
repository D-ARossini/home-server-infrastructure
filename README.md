# Home Server Infrastructure & Lab Linux 🐧

Bienvenue sur le dépôt de présentation de mon infrastructure réseau et serveur personnelle. Passionné d'administration système et de cybersécurité, j'utilise cet environnement de laboratoire ("Homelab") pour expérimenter, automatiser et sécuriser des services en conditions réelles, au-delà du cadre théorique de ma formation universitaire.

---

## 🛠️ Architecture & Environnement

* **Matériel :** Serveur dédié distant & Micro-serveur local (configurations sur Raspberry Pi).
* **Système d'Exploitation :** Linux (Ubuntu Server).
* **Conteneurisation :** Docker & Docker Compose (isolation, gestion des dépendances et portabilité des services).

---

## 🚀 Services Déployés & Stack Docker

Mon environnement est entièrement conteneurisé et organisé par dossiers spécifiques. Voici les briques applicatives que je maintiens de manière autonome :

* **`caddy` :** Reverse-proxy destiné à la gestion et l'automatisation des certificats SSL (HTTPS) pour sécuriser l'accès aux services.
* **`nextcloud` :** Solution de cloud personnel et de stockage pour la gestion des volumes et la persistance des données.
* **`pihole` :** Serveur DNS local et bloqueur de publicités pour sécuriser le trafic réseau, analyser les requêtes DNS et configurer un DNS menteur.
* **`uptime-kuma` :** Outil de monitoring pour surveiller la disponibilité des services et recevoir des alertes de statut en temps réel.
* **`minecraft_serveur` :** Administration, monitoring et allocation des ressources (CPU/RAM) pour un serveur de jeu privé.

---

## ⚙️ Scripts & Automatisation (Exploitation & Maintenance)

L'automatisation est au cœur de la gestion de mon infrastructure pour garantir la résilience, la maintenance et le monitoring des services :

* **`backup_project.sh` :** Script Bash d'exploitation permettant de réaliser des sauvegardes à chaud de mes volumes de données (ex: Nextcloud, Minecraft). Le script coupe proprement le conteneur Docker ciblé via `docker-compose down`, génère une archive compressée `.tar.gz` datée, relance le service en tâche de fond (`up -d`), et applique une politique de rétention en nettoyant automatiquement les archives de plus de 7 jours (`find ... -delete`).
* **`dockermaster.sh` :** Script d'administration de flotte visant à orchestrer et appliquer des actions de masse (`start`, `stop`, `status`, `build`) sur un tableau de projets Docker conteneurisés de manière séquentielle.
* **`rpi_health_report.sh` :** Script de monitoring matériel et système pour le suivi de mon Raspberry Pi. Il extrait et formate les métriques vitales : température du processeur (`thermal_zone0`), occupation de la RAM (`free -h`), espace disque des partitions (`df -h`) et multiplexage du Top 5 des processus les plus gourmands via `ps aux`.
* **`update_system.sh` :** Script d'automatisation des tâches de maintenance courantes de l'OS (mise à jour des paquets, application des upgrades et nettoyage des dépendances obsolètes via `apt autoremove`).

---

## 🧠 Projet Système : Serveur de Mémoire Distribué & Segmenté

En parallèle de mon infrastructure, je développe des projets systèmes plus bas niveau pour explorer la programmation réseau et les mécanismes des OS :

* **Architecture Multi-Processus (`fork`, `pipe`, `dup2`) :** Conception d'un serveur TCP en Python scindé en un processus Frontend (gestion et calcul de la table des segments) et un processus Backend (gestion de la mémoire physique via un `bytearray`).
* **Communication par Sockets :** Implémentation de sockets TCP synchrones pour assurer l'échange de requêtes logiques de lecture (`GET`) et d'écriture (`POST`) entre un client d'abstraction et le serveur.
* **Contrôle d'Intégrité :** Utilisation de gestionnaires de contexte pour monitorer les accès mémoires et lever des exceptions en cas de détection de corruption de données.

---

## 🔒 Architecture Réseau & Accès Distant Sécurisé (VPN / SDN)

Pour gérer cette infrastructure en situation de mobilité tout en garantissant un niveau de sécurité maximal, j'ai mis en place une architecture réseau basée sur le modèle "Zero Trust" :

* **Tailscale (Mesh VPN / SDN) :** Déploiement d'un réseau privé virtuel superposé pour interconnecter mes équipements (PC, Smartphone, Raspberry Pi). Cela me permet de manager l'infrastructure en SSH et d'accéder aux services de manière chiffrée depuis n'importe où, sans exposer de ports critiques sur l'Internet public.
* **Pi-hole nomade (DNS sécurisé) :** Configuration de Pi-hole comme serveur DNS principal à l'intérieur de mon tunnel Tailscale. Grâce à l'option d'écoute globale (`DNSMASQ_LISTENING: 'all'`), mon trafic mobile bénéficie du filtrage des publicités et d'une résolution DNS sécurisée où que je sois.
* **Nextcloud & Accès Distant :** Centralisation et synchronisation de mes données via un accès distant chiffré de bout en bout, me permettant d'avoir mon espace de stockage privé disponible à la demande sur tous mes terminaux.

---

## 🌐 Compétences Réseau Appliquées

Ce laboratoire me permet de mettre en pratique des notions fondamentales indispensables en informatique industrielle et en entreprise :
* **Réseaux & Protocoles :** Configuration des architectures réseaux, routage, et gestion des protocoles de transport (TCP/UDP).
* **Sécurité :** Gestion des droits Linux, isolation des conteneurs via des réseaux Docker internes (bridge/overlay), et restriction des ports ouverts.
