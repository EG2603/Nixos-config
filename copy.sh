rm -rf Chicago95
rm -rf Windows-Vista
rm -rf crystal-remix-icon-theme
git clone https://github.com/grassmunk/Chicago95.git
git clone https://github.com/B00merang-Project/Windows-Vista.git
git clone https://github.com/dangvd/crystal-remix-icon-theme.git
#------------------------------------------------------
sudo mkdir -r /usr/share/themes
sudo mkdir -r /usr/share/icons
sudo cp -r crystal-remix-icon-theme /usr/share/icons
sudo cp -r Windows-Vista /usr/share/themes
sudo cp -r Chicago95/Theme/Chicago95 /usr/share/themes
sudo cp -r Chicago95/Icons/Chicago95 /usr/share/icons
sudo cp -r Chicago95/Cursors/Chicago95_Standard_Cursors /usr/share/icons
#------------------------------------------------------
sudo cp apps.nix /etc/nixos/apps.nix
sudo cp configuration.nix /etc/nixos/configuration.nix
sudo cp home-manager.nix /etc/nixos/home-manager.nix
cp -r home/. ~
cp -r home/.config  ~
