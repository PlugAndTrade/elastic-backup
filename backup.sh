#!/usr/bin/env sh

. /usr/share/elastic-backup/env.sh
echo "REPOSITORY_NAME=$REPOSITORY_NAME"
echo "INDICES=$INDICES"
echo "SNAPSHOT_NAME=$SNAPSHOT_NAME"
curl -s -X POST -d "{ \"indices\": \"$INDICES\" }" "http://elastic:9200/_snapshot/$REPOSITORY_NAME/${SNAPSHOT_NAME}_$(date +"%Y%m%d%H%M")?wait_for_completion=true"
echo "\n*** Backup complete ***"
