#!/bin/bash

backup_dir="/home/admin"
archive_name="system_backup_$(date +'%Y%m%d').tar.gz"

#system backup and compress into a tar.gz archive
tar czf "$backup_dir/$archive_name" /home/admin

#permission change
chmod 400 "$backup_dir/$archive_name"

crontab -e
0 1 * * * /home/admin/system_backup.sh
