#!/bin/bash

rm -rf Chicago95
rm -rf Windows-Vista
rm -rf crystal-remix-icon-theme
git clone https://github.com/grassmunk/Chicago95.git
git clone https://github.com/B00merang-Project/Windows-Vista.git
git clone https://github.com/dangvd/crystal-remix-icon-theme.git
#------------------------------------------------------
sudo mkdir -p ~/.local/share/themes
sudo mkdir -p ~/.local/share/icons
sudo cp -r crystal-remix-icon-theme ~/.local/share/icons
sudo cp -r Windows-Vista ~/.local/share/themes
sudo cp -r Chicago95/Theme/Chicago95 ~/.local/share/themes
sudo cp -r Chicago95/Icons/Chicago95 ~/.local/share/icons
sudo cp -r Chicago95/Cursors/Chicago95_Standard_Cursors ~/.local/share/icons
#------------------------------------------------------
#Install the splash text program:
sudo cp splash/bin/select_splash /usr/bin

#------------------------------------------------------
sudo cp apps.nix /etc/nixos/apps.nix
sudo cp configuration.nix /etc/nixos/configuration.nix
sudo cp home-manager.nix /etc/nixos/home-manager.nix
cp -r home/. ~
cp -r home/.config  ~
sudo nixos-rebuild switch
echo installation finished
