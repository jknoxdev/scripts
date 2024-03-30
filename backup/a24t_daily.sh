#!/bin/bash


echo "----------backing up----------"
# autofs
# cd /net/d7omv/export/d7omvfs/backups/a23t/
# manual fstab
cd /mnt/nfs/d7omv/d7omvfs/backups/a24t
tar -cvzf ./homedir_$(date +%Yw%Wd%wh%H%m).lzop ~/
