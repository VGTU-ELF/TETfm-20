#!/usr/bin/env bash

IP=$1
TEMPLATE_HOSTNAME="cckd-saukrs-TODO"

sshpass -p osboxes.org ssh-copy-id -o StrictHostKeyChecking=no osboxes@${IP}

echo "Komandų receptas:"
echo
echo ".................................................................................................................."
exec 8<>1; cat << \
------------------------------------------------------------------------------------------------------------------------ |
sudo -p '' -S bash -c 'echo osboxes ALL=\\\(ALL:ALL\\\) NOPASSWD: ALL | tee /etc/sudoers.d/osboxes' <<< osboxes.org

echo -e '127.0.2.1\\\t${TEMPLATE_HOSTNAME}' | sudo tee -a /etc/hosts
sudo hostnamectl set-hostname ${TEMPLATE_HOSTNAME}
hostnamectl

sudo timedatectl set-timezone Europe/Vilnius
timedatectl

sudo localectl set-locale LC_TIME=C.UTF-8
localectl
date

# Add nearer APT mirror?

# sudo sed -i.BACKUP-1 's|us.archive.ubuntu.com|ubuntu.mirror.vu.lt|' /etc/apt/sources.list
# sudo sed -i.BACKUP-2 's|security.ubuntu.com|ubuntu.mirror.vu.lt|' /etc/apt/sources.list

echo -n "Upgreidinam? "; read
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y vim colordiff

echo -n "Rebūtinam? "; read
nohup sudo -b bash -c 'sleep 2; reboot'
------------------------------------------------------------------------------------------------------------------------
tee /dev/fd/8
echo ".................................................................................................................."
echo

while read -u 8 REMOTE_CMD; do
    [ "$REMOTE_CMD" = "" ] && continue
    echo
   #echo "Remote CMD is: $REMOTE_CMD"
    ssh osboxes@${IP} "$REMOTE_CMD"
    [ $? -eq 0 ] && continue
    echo
    echo "Command failed, skipping the remainder."
    break
done
exec 8<>-
exit

# TODO ping-wait for ${IP}
echo
echo -n "Jau VM gyva? "; read

ssh osboxes@${IP} "echo install Docker here or in another script ?"
ssh osboxes@${IP}
