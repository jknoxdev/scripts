#!/bin/bash
set -e

# Define color codes
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[1;31m'
RESET='\033[0m'

echo -e "${BLUE}[*] Updating system...${RESET}"
sudo apt update && sudo apt upgrade -y

echo -e "${BLUE}[*] Creating package install list...${RESET}"
PACKAGES=(
  nmap netcat-traditional curl wget python3-venv
  gobuster sqlmap nikto hydra john hashcat
  smbclient enum4linux seclists exploitdb
  whois dnsrecon tcpdump dirb net-tools lftp
  wireshark tshark ftp rlwrap gdb build-essential git
)

VALID_PACKAGES=()

for pkg in "${PACKAGES[@]}"; do
  if apt-cache show "$pkg" > /dev/null 2>&1; then
    VALID_PACKAGES+=("$pkg")
    echo -e "${GREEN}[+] Found package: $pkg${RESET}"
  else
    echo -e "${YELLOW}[!] Package not found in repo: $pkg${RESET}"
  fi
done

if [ ${#VALID_PACKAGES[@]} -eq 0 ]; then
  echo -e "${RED}[✘] No valid packages found. Something's wrong with your repo.${RESET}"
  exit 1
fi

echo -e "${BLUE}[*] Installing available tools...${RESET}"
sudo apt install -y "${VALID_PACKAGES[@]}"

echo -e "${BLUE}[*] Setting up Python virtual environment 'kali' in ~/venvs...${RESET}"
mkdir -p ~/venvs
python3 -m venv ~/venvs/kali

echo -e "${BLUE}[*] Activating 'kali' venv and installing Python tools...${RESET}"
source ~/venvs/kali/bin/activate
pip install --upgrade pip
pip install pwntools

# echo -e "${BLUE}[*] Updating ExploitDB local database...${RESET}"
# searchsploit -u

echo -e "${GREEN}[✔] OSCP tool setup complete.${RESET}"
echo -e "${YELLOW}[ℹ] To activate venv: source ~/venvs/kali/bin/activate${RESET}"
echo -e "${YELLOW}[ℹ] To run Wireshark as user: sudo usermod -aG wireshark \$USER && newgrp wireshark${RESET}"


echo -e "${BLUE}[*] ...installing searchsploit...${RESET}"

sudo su
cd /opt
git clone https://gitlab.com/exploit-database/exploitdb.git

ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit
cp -n /opt/exploitdb/.searchsploit_rc ~/
vim ~/.searchsploit_rc
cd ~



echo -e "${BLUE}[*] ...installing seclists ...${RESET}"
cd /usr/share/
git clone --depth 1 https://github.com/danielmiessler/SecLists.git
mv SecLists seclists
cd ~
exit

cd ~


echo -e "${BLUE}[*] ...installing metasploit ...${RESET}"
cd ~
mkdir ~/apps
chdir ~/apps
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall

echo -e "${BLUE}[*] ...installing burp ...${RESET}"
thunar https://portswigger.net/burp/documentation/desktop/getting-started/download-and-install
read -n 1 "press here when burp is downloaded into ~/Downloads"
chmod ug+x ~/Downloads/burpsuite_community_linux* 
sh ~/Downloads/burpsuite_community_linux*

