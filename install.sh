#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

printf "${BLUE}Updating System${NC} \\n"
echo " "
sudo apt update

printf "${BLUE}Installing Dependencies${NC}"
sudo apt -y install python3-setuptools git-core python3-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev pkg-config libgl1-mesa-dev libgles2-mesa-dev \
   libgstreamer1.0-dev \
   gstreamer1.0-plugins-{bad,base,good,ugly} \
   gstreamer1.0-{omx,alsa} libmtdev-dev \
   xclip xsel libjpeg-dev 

echo " "
printf "${BLUE}Do you want to install kivy in a virtual environment. A virtual environment will prevent possible installation conflicts with other Python versions and packages. It’s optional but strongly recommended [Y/n] ${NC}"
read answer
echo " "

if [ "$answer" == 'y' ];then

  echo " "
  printf "${GREEN}OK, Installing in virtual environment${NC} \\n"

  echo " "
  printf "${GREEN}Removing Existing Virtual Environment If Created${NC} \\n"
  sudo rm -r ~/kivy_venv
  virtual_env=true

  echo " "
  printf "${GREEN}Installing virtualenv with pip${NC} \\n"
  python3 -m pip install --upgrade pip setuptools virtualenv

  echo " "
  printf "${GREEN}Creating Virtual Environment${NC} \\n"
  python3 -m virtualenv ~/kivy_venv

  echo " "
  printf "${GREEN}Activating the virtual environment${NC} \\n"
  source ~/kivy_venv/bin/activate

fi

echo " "
printf "${GREEN}Installing kivy with pip${NC} \\n"
python3 -m pip install kivy[base] kivy_examples

echo " "
printf "${GREEN}Running Demo Program${NC} \\n"
python3 ~/kivy_venv/share/kivy-examples/demo/showcase/main.py

echo " "
printf "${GREEN}Installation Over${NC} \\n" 

if [ "$virtual_env" = true ]; then
  printf "${RED}You will need to activate the virtual environment everytime you use kivy \\n"  
  printf "${RED}Use the command 'source ~/kivy_venv/bin/activate' to activate the virtual environment${NC} \\n"  
fi
