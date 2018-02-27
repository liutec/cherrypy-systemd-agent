#!/usr/bin/env bash


if [ ! "$#" -eq 3 ]; then
	echo "Usage: deploy.sh server 0.0.0.0 8080"
	exit 1
fi

NAME="$1"
IP="$2"
PORT="$3"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

systemctl stop $NAME.socket &> /dev/null
systemctl stop $NAME.service &> /dev/null

sed "s|{{ip}}|${IP}|g; s|{{port}}|${PORT}|g" systemd.socket.tpl >/etc/systemd/system/$NAME.socket
sed "s|{{dir}}|${DIR}|g" systemd.service.tpl >/etc/systemd/system/$NAME.service
sed "s|{{ip}}|${IP}|g; s|{{port}}|${PORT}|g" server.conf.tpl >server.conf

systemctl daemon-reload

echo "systemctl start ${NAME}.socket"
echo "systemctl status ${NAME}.socket"

