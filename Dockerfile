FROM ubuntu:latest

RUN apt-get update && apt-get install -y cron curl

RUN mkdir /usr/share/elastic-backup
WORKDIR /usr/share/elastic-backup
RUN touch elastic-backup.log

ADD entrypoint.sh ./
ADD backup.sh ./
ADD crontab /etc/cron.d/elastic-backup
RUN crontab /etc/cron.d/elastic-backup

ENV TZ "Europe/Stockholm"
ENV REPOSITORY_NAME backup
ENV INDICES *
ENV SNAPSHOT_NAME snapshot

CMD ./entrypoint.sh
