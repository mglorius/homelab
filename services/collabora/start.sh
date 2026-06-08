#!/bin/bash
# Collabora CODE - Start Script
# Nextcloud VM (192.168.60.9) | nc.michaelglorius.de
# Passwort wird aus .env geladen (nicht im Repo)

source "$(dirname "$0")/.env"

docker stop NEXTCLOUDOFFICE 2>/dev/null && echo "Container gestoppt."
docker rm NEXTCLOUDOFFICE 2>/dev/null && echo "Container entfernt."

docker run -t -d \
  -p 192.168.60.9:9980:9980 \
  -e "aliasgroup1=https://nc.michaelglorius.de:443,https://nc\\.michaelglorius\\.de:443" \
  -e "server_name=nc.michaelglorius.de" \
  -e "username=${COLLABORA_USER}" \
  -e "password=${COLLABORA_PASSWORD}" \
  --name NEXTCLOUDOFFICE \
  --memory="4G" \
  --memory-swap="4G" \
  -e "lang=de_DE" \
  -e "dictionaries=de_DE en_GB en_US" \
  -e "extra_params=--o:home_mode.enable=true --o:ssl.enable=false --o:ssl.termination=true --o:net.post_allow.host[0]=::ffff:192.168.60.9 --o:net.post_allow.host[1]=::ffff:192.168.50.20" \
  --add-host nc.michaelglorius.de:192.168.60.9 \
  --add-host nc.michaelglorius:192.168.60.97 \
  --volume "/usr/share/fonts/truetype/:/opt/collaboraoffice/share/fonts/truetype/local/:ro" \
  --restart always \
  collabora/code

echo ""
echo "Warte 10 Sekunden auf Start..."
sleep 10
docker ps | grep collabora
