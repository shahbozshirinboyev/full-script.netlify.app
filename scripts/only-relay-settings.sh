#Relay_autostart
wget -P ~/.config/autostart https://relay-setting.netlify.app/relay_setting.sh
wget -P ~/.config/autostart https://relay-setting.netlify.app/relay_setting.sh.desktop
chmod +x ~/.config/autostart/relay_setting.sh
chmod u+x ~/.config/autostart/relay_setting.sh.desktop
sudo usermod -a -G dialout $USER
export file_path=$(realpath ~/.config/autostart/relay_setting.sh)
sed -i "s|^Exec=.*$|Exec=$file_path|" ~/.config/autostart/relay_setting.sh.desktop
sleep 5 && reboot 
