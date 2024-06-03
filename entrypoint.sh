#!/bin/bash

echo "$SERVERNAME soulmask server initialization.."

update=0

if ! test -f "/home/steam/soulmask-server/StartServer.sh"; then
    echo "First server initialization."
    update=1
elif [[ $FORCE_SERVER_UPDATE == "1" ]]; then
    echo "Force server update activated."
    update=1
fi

if [[ $update == "1" ]]; then
    steamcmd +force_install_dir /home/steam/soulmask-server/ +login anonymous +app_update 3017300 validate +quit
else
    echo "Update skipped."
fi

args="-SteamServerName=\"$SERVERNAME\" -MaxPlayers=$MAXPLAYERS -backup=$BACKUP -saving=$SAVING -Port=$PORT -QueryPort=$QUERYPORT -backupinterval=$BACKUPINTERVAL -PSW=\"$PSW\" -adminpsw=\"$ADMINPSW\""

if [[ $INITBACKUP == "1" ]]; then
    args="$args -initbackup"
fi

pushd "/home/steam/soulmask-server"
./StartServer.sh $args
popd
