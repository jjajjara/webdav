https://hub.docker.com/r/jjajjara/webdav

<h2>Usage Instructions</h2>

<h3>Docker Run</h3>
<pre><code>docker run --name webdav \
  --restart unless-stopped \
  -p 80:8080 \
  -e WEBDAV_USERNAME=jjajjara \
  -e WEBDAV_PASSWORD=mypassword \
  -e UID=1000 \
  -e TZ=Asia/Seoul \
  -v /data:/media \
  jjajjara/webdav:latest
</code></pre>

<h3>Docker Compose</h3>
<pre><code>services:
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
</code></pre>
