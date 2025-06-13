!/bin/bash


SYNC_SCRIPT="/$project_name/scripts/sync.sh"

echo " Starting update from $finaler_url..."


if [ ! -d "$finaler_url" ]; then
    echo " Error: $REPO_DIR does not exist. Please run init.sh first."
    exit 1
fi

cd "$finaler_url" || exit 1


echo " Pulling latest changes from GitHub..."
git fetch origin
git branch
git status

git pull origin main

if [ $? -ne 0 ]; then
    echo " Git pull failed! Please check network or repo access."
    exit 1
fi



if [ -x "$SYNC_SCRIPT" ]; then
    echo " Running sync.sh..."
    bash "$SYNC_SCRIPT"
else
    echo "sync.sh not found or not executable at $SYNC_SCRIPT"
fi

cd /devenvshare/docker

cp /$finaler_url/* .

echo " Update complete."
exit 0

