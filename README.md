# elastic-backup
Simple backup service built on cron.

The backup will run at midnight each weekday (mon - fri).

## Docker image

Build the image using `docker build -t elastic-backup .`.
There are no build arguments.

## Docker container configuration

### Environment variables

The following environment variables (with defaults) are available:
 * `TZ` (`Europe/Stockholm`) - Timezone for cron
 * `REPOSITORY_NAME` (`backup`) - The name of the repository
 * `INDICES` (`*`) - The indices to back up
 * `SNAPSHOT_NAME` (`snapshot`) - The base name of each snapshot, `_${date +"%Y%m%d%H%M"}` is appended using the provided timezone.

Eg. `-e TZ=UTC`, `-e REPOSITORY_NAME=daily-backup`.

### Link elasticsearch
Link elasticsearch using the name `elastic`, eg `--link elasticsearch-01:elastic`.

### Example

`docker run --link elasticsearch-01:elastic -e REPOSITORY_NAME=my_backup -e INDICES=orders,users --name elastic-backup-01 elastic-backup`

*NOTE:* Assuming the image was built using the tag `elastic-backup`.
