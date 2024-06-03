FROM steamcmd/steamcmd:ubuntu-22

RUN groupadd steam && \
    useradd -g steam -d /home/steam -m -s /bin/bash steam && \
    apt-get update && apt-get install -y netcat telnet

ENV FORCE_SERVER_UPDATE="0" \
    #SERVER="Level01_Main" \
    SERVERNAME="soulmask-docker" \
    #LOG="0" \
    MAXPLAYERS="20" \
    BACKUP="900" \
    SAVING="600" \
    #MULTIHOME="0.0.0.0" \
    PORT="8777" \
    QUERYPORT="27015" \
    #ECHOPORT="18888" \
    INITBACKUP="0" \
    BACKUPINTERVAL="600" \
    #FORCEPASSTHROUGH="1" \
    PSW="soulmask-docker" \
    ADMINPSW="soulmask-docker-admin"

USER steam
WORKDIR /home/steam
ENV HOME /home/steam
ENV USER steam

COPY --chmod=755 ./entrypoint.sh /home/steam/entrypoint.sh

ENTRYPOINT ["/home/steam/entrypoint.sh"]
