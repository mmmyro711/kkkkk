#!/bin/bash

# Exit script on any errors
set -e

# Update package lists
sudo apt update -y

# Install desired packages
sudo apt install git curl wget default-jre default-jdk -y

# Remove unused packages
sudo apt autoremove -y

# Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y

# Start and enable Jenkins service
sudo systemctl start jenkins.service
sudo systemctl status jenkins.service
sudo systemctl enable jenkins.service

# Inform the user about a potential reboot requirement
echo "Package updates, installations, and Jenkins setup complete. A system reboot may be required for some changes to take effect."

exit 0