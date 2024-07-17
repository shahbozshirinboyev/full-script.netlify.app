sudo crontab -l | { cat; echo "00 06 * * * sudo apt update && sudo apt upgrade -y"; } |sudo crontab -
