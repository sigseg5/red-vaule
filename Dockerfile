FROM debian:11-slim

LABEL maintainer="sigseg5 main@main.com"

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

# Envrionment config
ENV HOME=/demhack \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/demhack/install \
    NO_VNC_HOME=/demhack/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x960 \
    VNC_PW=hack \
    VNC_VIEW_ONLY=false
WORKDIR $HOME

# Add all install scripts for further steps
ADD ./src/common/install/ ./src/debian/ $INST_SCRIPTS/

# Install updates
USER 0
RUN apt update && apt upgrade -y

# Install some common tools
RUN $INST_SCRIPTS/tools.sh

# Install vnc tools
RUN $INST_SCRIPTS/vnc.sh

# Install xfce UI
RUN $INST_SCRIPTS/xfce_ui.sh
ADD ./src/common/xfce/ $HOME/

# Install Chromium browser
RUN $INST_SCRIPTS/chromium.sh

# Configure startup
ADD ./src/common/scripts $STARTUPDIR
RUN $INST_SCRIPTS/postinstall.sh $STARTUPDIR $HOME

### Copy welcome page 
ADD ./web-welcome $HOME/web-welcome/

USER 1000

### Install Russian CA
RUN $INST_SCRIPTS/install_certs.sh

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--wait"]
