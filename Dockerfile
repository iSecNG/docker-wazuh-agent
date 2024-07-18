FROM debian:bookworm-slim

LABEL maintainer="sn0b4ll@isecng"
LABEL version="4.8.0"
LABEL description="Wazuh Agent"

COPY entrypoint.sh /

RUN apt-get update && apt-get install -y \
  procps curl apt-transport-https gnupg2 inotify-tools

RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && chmod 644 /usr/share/keyrings/wazuh.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
  
RUN apt-get update

# Set the deployment varibales beforehand, see here: https://documentation.wazuh.com/current/user-manual/agent/deployment-variables/deployment-variables-linux.html
# WAZUH_AGENT_NAME
# WAZUH_AGENT_GROUP
# WAZUH_MANAGER
# WAZUH_MANAGER_PORT
# WAZUH_REGISTRATION_PASSWORD

ENTRYPOINT ["/entrypoint.sh"]
