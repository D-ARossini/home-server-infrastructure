cat update_system.sh 
#!/bin/zsh
sudo apt update && sudo apt upgrade -y &&  sudo apt autoremove -y
echo "Système mis à jour."
