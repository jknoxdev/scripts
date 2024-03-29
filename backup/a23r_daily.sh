#!/bin/bash


echo "----------backing up----------"

cd /net/d7omv/export/d7omvfs/backups/a23r/
tar -cvzf ./homedir_$(date +%Yw%Wd%w%Z%H%m).lzop ~/
