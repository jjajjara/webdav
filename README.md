https://hub.docker.com/r/jjajjara/webdav

# Docker Run
docker run --name webdav \
  --restart unless-stopped \
  -p 80:8080 \
  -e WEBDAV_USERNAME=jjajjara \
  -e WEBDAV_PASSWORD=mypassword \
  -e UID=1000 \
  -e TZ=Asia/Seoul \
  -v /data:/media \
  jjajjara/webdav:latest

# docker-compose.yml
services:
  webdav:
    image: jjajjara/webdav:latest 
    container_name: webdav
    restart: unless-stopped
    ports:
      - "80:8080"
    environment:
      WEBDAV_USERNAME: jjajjara
      WEBDAV_PASSWORD: mypassword 
      UID: 1000
      TZ: Asia/Seoul
    volumes:
      - /data:/media
