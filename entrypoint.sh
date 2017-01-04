#!/usr/bin/env sh

echo "export TZ=$TZ" >> env.sh
echo "export REPOSITORY_NAME=$REPOSITORY_NAME" >> env.sh
echo "export INDICES=$INDICES" >> env.sh
echo "export SNAPSHOT_NAME=$SNAPSHOT_NAME" >> env.sh

curl -s -X POST -d "{ \"type\": \"fs\", \"settings\": { \"location\": \"$REPOSITORY_NAME\", \"compress\": true } }" "http://elastic:9200/_snapshot/$REPOSITORY_NAME"

if [ "$?" = "0" ]; then
  echo "\nRepository successfully set up"
  cron && tail -f elastic-backup.log
else
  echo "\nFailed to set up repository"
fi
