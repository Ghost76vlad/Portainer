mkdir -p /data/portainer/data
cat <<EOF> /data/portainer-compose.yml

version: "3.3"
services:
  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    environment:
      - TZ=Europe/Moscow
    ports:
      - "8000:8000"
      - "9443:9443"
    restart: always
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /data/portainer/data:/data

EOF

docker-compose -f portainer-compose.yml up -d