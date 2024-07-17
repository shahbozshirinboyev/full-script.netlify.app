sudo crontab -l | { cat; echo "59 23 * * * /sbin/shutdown -r now"; } |sudo crontab -
sudo crontab -l | { cat; echo "59 06 * * * /sbin/shutdown -r now"; } |sudo crontab -
