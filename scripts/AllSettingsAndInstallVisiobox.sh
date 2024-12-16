sudo apt update
#Install visiobox.sh and remove CityScreen Player
#sudo apt remove cityscreen-player
wget -O visiobox.sh https://cms.oohdesk.com/dist/linux-x64/visiobox.sh
chmod +x visiobox.sh && ./visiobox.sh
#
sudo su -c 'sudo apt update -y && sudo apt upgrade -y'
#Anydesk
sudo su -c 'wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -'
sudo su -c 'echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list'
sudo su -c 'sudo apt update -y'
sudo su -c 'sudo apt install anydesk -y'
#CityScreen
sudo su -c 'sudo echo "deb [trusted=yes] https://packages.cityscreen.cloud/repository/focal-releases focal main" > /etc/apt/sources.list.d/eraga.list'
#sudo su -c 'wget -qO - https://packages.cityscreen.cloud/repository/focal-releases/dists/focal/Release.gpg | sudo apt-key add -'
sudo su -c 'wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -'
sudo su -c 'sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6f999c2f1bfe311dda96f9bfd9e1deff2437df62'
sudo su -c 'sudo apt-get update -y'
sudo su -c 'sudo apt-get install cityscreen-player -y'
sudo su -c 'sudo apt install cityscreen-camgrabber -y'
#(1) Backgrpund >> Solid-black color
gsettings set org.gnome.desktop.background picture-options 'none'
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background secondary-color '#000000'
gsettings set org.gnome.desktop.background color-shading-type 'vertical'
#(2) Appearance >> Windows colors >> Dark
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
#(3) Appearance >> Dock >> Auto-hide the Dock (ON) * Position on screen [BOTTOM]
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
#(4) Remove all favorite icons in taskbar
gsettings set org.gnome.shell favorite-apps "[]"
#(5) Date & Time >> Time Zone (+05(Tashkent, Uzbekistan))
sudo timedatectl set-timezone Asia/Tashkent
gsettings set org.gnome.desktop.interface clock-format 24h
#(6) Notifications >> Do Not Distrub [ENABLE] * Lock Screen Notifications [DISABLE]
gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
#(7) Removable Media >> Never prompt or start programs on media insertion [ON]
gsettings set org.gnome.desktop.media-handling autorun-never true
#(8) Power + Privacy [Blank Screen (Never) + Privacy Blank Screen Delay (Never)]
gsettings set org.gnome.desktop.session idle-delay 0
# Power [disable]
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
# Privacy [disable]
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
#---Software&Updates >> Update & New Ubuntu version Notification = [Never]
sudo sed -i 's/^\(Prompt=\).*/\1never/' /etc/update-manager/release-upgrades
echo 'APT::Periodic::Update-Package-Lists "0"; APT::Periodic::Download-Upgradeable-Packages "0"; APT::Periodic::AutocleanInterval "0"; APT::Periodic::Unattended-Upgrade "0";' | sudo tee /etc/apt/apt.conf.d/20auto-upgrades
#---Install Gnome&Tweaks&AutoHideTopBar
sudo su -c 'sudo apt update -y && sudo apt upgrade -y'
sudo su -c 'sudo apt install gnome-shell-extensions -y'
sudo su -c 'sudo apt-get install gnome-tweaks -y'
sudo su -c 'sudo apt install gnome-shell-extension-autohidetopbar -y'
#---Hide Top-bar on
gnome-extensions enable hidetopbar@mathieu.bidon.ca
#---Ubuntu taskbar off
gnome-extensions disable ubuntu-dock@ubuntu.com
#---Disable show icons in the desktop
gnome-extensions disable desktop-icons@csoriano
#Top-Bar GUI show
gnome-extensions prefs hidetopbar@mathieu.bidon.ca
#just-perfection
sudo apt update 
sudo apt upgrade -y
sudo apt-get install git-all -y
sudo apt-get install -y gettext
git clone -b 3.36-41 https://gitlab.gnome.org/jrahmatzadeh/just-perfection.git 
./just-perfection/scripts/build.sh -i
#just-perfection extension enable && Panel option enable
gnome-extensions enable just-perfection-desktop@just-perfection
gsettings --schemadir ~/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/schemas set org.gnome.shell.extensions.just-perfection panel false
#CityScreen_Plater fix AutoStart
wget -P ~/.config/autostart https://start-application.netlify.app/startup.sh
wget -P ~/.config/autostart https://start-application.netlify.app/cityscreen-player.desktop
chmod +x ~/.config/autostart/startup.sh
chmod u+x ~/.config/autostart/cityscreen-player.desktop
export file_path=$(realpath ~/.config/autostart/startup.sh)
sed -i "s|^Exec=.*$|Exec=$file_path|" ~/.config/autostart/cityscreen-player.desktop
#restart
sleep 10 && sudo reboot
