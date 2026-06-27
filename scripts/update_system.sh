cat update_system.sh 
#!/bin/zsh
sudo apt update && sudo apt upgrade -y &&  sdo apt autoremove -y
echo "Système mis à jour."
