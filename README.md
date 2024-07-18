# docker-wazuh-agent

## Description

Wazuh Agent as Docker Image.

! This does not monitor the host systems by default, since there are no volumes mounted by default !

This can be useful if you have an log-collection-client which should use multiple instances of agents to send logs to an wazuh manager.

## Run

### docker run
Steps to start the agent
1. Build the image with `docker build ."
2. Tun the container itself:
```
docker run -e WAZUH_MANAGER='host.docker.internal' --add-host=host.docker.internal:host-gateway <your-container-name-or-id> 
```
### docker compose

By default the agent connects to a local hosted wazuh instance. Please adjust `docker-compose.yml` accordingly, afterward simply run `docker compose up`.

## Credits
Based on https://github.com/noenv/docker-wazuh-agent
