#!/bin/bash


echo "----------backing up----------"
# autofs
# cd /net/d7omv/export/d7omvfs/backups/a23t/
# manual fstab
# cd /mnt/nfs/d7omv/d7omvfs/backups/a23t 

# cd ~/
# echo "tar -cvzf ./homedir_$(date +%Yw%Wd%wh%H%m).lzop ~/"



# trying out both ways.. first we will try pull from server
# https://www.cyberciti.biz/faq/howto-use-tar-command-through-network-over-ssh-session/
# add to crontab -e after testing

# /usr/bin/ssh arx@p6t "sudo tar -cf - -C /home/arx/ | gzip -9c" > "/mnt/data/arx/fs/60-69 Projects/66 Homelab/66.31 w541_p6t_backup/p6t_arx_homedir_$(date +\%Y\%m%dt%H\%M).tar.gz"

# i don't like this, getting stuck cause I don't want to open up root perms...

# method 2
# pipe over ssh
# http://www.linux-admins.net/2010/09/backing-up-with-tar-over-ssh.html

# tar zcvf - /home | ssh server "cat > inky-homes.tgz"

# tar czvf - /home/arx/ | ssh tnas23 "cd /mnt/data/arx/fs/60-69 Projects/66 Homelab/66.31 w541_p6t_backup/ ; echo "p6t_arx_homedir_$(date +\%Y\%m%dt%H\%M).tgz"; pwd"

sudo tar -zcvf - /home/arx/ | ssh tnas23 "cd '/mnt/data/arx/fs/60-69 Projects/66 Homelab/66.31 w541_p6t_backup/' ; cat > "p6t_arx_homedir_$(date +\%Y\%m%dt%H\%M).tgz" " 
