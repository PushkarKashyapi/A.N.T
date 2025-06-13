!/bin/bash

DOT_DIR="$project_name"

 FOR BACKUP
BACKUP_DIR="hello"

DIRECT INTO HOME
TARGET_DIR="$HOME"

echo "Syncing all dot files from devenvshare to your system"

echo "/$DOT_DIR/dotfile"

if [ ! -d "/$DOT_DIR/dotfile" ]
  then
 echo "Directory not found at $DOT_DIR"

exit 1
fi

if ! command -v rsync &> /dev/null; then

sudo yum install rsync

fi

BACKUP PURPOSE
echo "Creating Backup"

sleep 3

rsync -av --no-perms --no-owner --no-group "/$DOT_DIR/dotfile"/ "/$BACKUP_DIR"/

echo " Injecting into system"

sleep 3

rsync -av --no-perms --no-owner --no-group "/$DOT_DIR/dotfile"/ "$TARGET_DIR"/
echo "/$TARGET_DIR"
echo "Environment synced succesfully"


cd /root
source .bashrc
