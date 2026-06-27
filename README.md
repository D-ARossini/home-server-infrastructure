# Home Server Infrastructure & Lab Linux 🐧

Bienvenue sur le dépôt de présentation de mon infrastructure réseau et serveur personnelle. Passionné d'administration système et de cybersécurité, j'utilise cet environnement de laboratoire ("Homelab") pour expérimenter, automatiser et sécuriser des services en conditions réelles, au-delà du cadre théorique de ma formation universitaire.

---

## 🛠️ Architecture & Environnement

* **Matériel :** Serveur dédié distant & Micro-serveur local (configurations sur Raspberry Pi).
* **Système d'Exploitation :** Linux (Distributions orientées serveur/sécurité).
* **Conteneurisation :** Docker & Docker Compose (isolation, gestion des dépendances et portabilité des services).

---

## 🚀 Services Déployés & Stack Docker

Mon environnement est entièrement conteneurisé et organisé par dossiers spécifiques. Voici les briques applicatives que je maintiens de manière autonome :

* **`caddy` :** Reverse-proxy avec gestion et automatisation des certificats SSL (HTTPS) pour sécuriser l'accès à mes services.
* **`nextcloud` :** Solution de cloud personnel et de stockage pour la gestion des volumes et la persistance des données.
* **`vaultwarden` :** Gestionnaire de mots de passe auto-hébergé (Bitwarden en Rust) pour centraliser et chiffrer mes identifiants.
* **`pihole` :** Serveur DNS local et bloqueur de publicités pour sécuriser le trafic réseau et analyser les requêtes DNS.
* **`uptime-kuma` :** Outil de monitoring pour surveiller la disponibilité de mes services et recevoir des alertes en temps réel.
* **`minecraft_serveur` :** Administration et allocation des ressources (CPU/RAM) pour un serveur de jeu privé.

---

## 🔒 Architecture Réseau & Accès Distant Sécurisé (VPN / SDN)

Pour gérer cette infrastructure en situation de mobilité tout en garantissant un niveau de sécurité maximal, j'ai mis en place une architecture réseau basée sur le modèle "Zero Trust" :

* **Tailscale (Mesh VPN / SDN) :** Déploiement d'un réseau privé virtuel superposé pour interconnecter mes équipements (PC, Smartphone, Raspberry Pi). Cela me permet de manager l'infrastructure en SSH et d'accéder aux services de manière chiffrée depuis n'importe où, sans exposer de ports critiques sur l'Internet public.
* **Pi-hole nomade (DNS sécurisé) :** Configuration de Pi-hole comme serveur DNS principal à l'intérieur de mon tunnel Tailscale. Où que je sois, mon trafic mobile bénéficie du filtrage des publicités, du blocage des trackers et d'une résolution DNS sécurisée.
* **Nextcloud & Accès Distant :** Centralisation et synchronisation de mes données via un accès distant chiffré de bout en bout, me permettant d'avoir mon espace de stockage privé disponible à la demande sur tous mes terminaux.

---

## 🌐 Compétences Réseau Appliquées

Ce laboratoire me permet de mettre en pratique des notions fondamentales indispensables en informatique industrielle et en entreprise :
* **Réseaux & Protocoles :** Configuration des architectures réseaux, routage, et gestion des protocoles de transport (TCP/UDP).
* **Sécurité :** Gestion des droits Linux, isolation des conteneurs via des réseaux Docker internes (bridge/overlay), et restriction des ports ouverts.
