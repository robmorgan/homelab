# Media Server

## TODO

- [ ] Start Page
- [ ] Remote Access
- [ ] Cloudflare Zero Trust

## Components

 * Plex
 * Jellyfin
 * Sonarr
 * Radarr
 * Jackett
 * Bazarr
 * Ombi
 * Tautulli
 * Filebrowser

## Test VPN Connectivity

If you'd like to test Gluetun connectivity from a container using the service jump into the docker compose exec console
and run the wget command below. Tested with nzbget, qbittorrent, and prowlarr containers. Ensure you open the ports
through the the gluetun container.

```sh
docker exec -it container_name bash
wget -qO- https://ipinfo.io
```

## Updating a Container Image

```sh
docker compose pull jellyseerr
docker compose up -d jellyseerr
docker image prune # dangerous
```