


FROM node:latest
EXPOSE 3000
WORKDIR /Code
COPY .bashrc /tmp/.bashrc-additions
COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]

# Install at a root level all of the basic programs needed
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "openssh-server"]
RUN ["apt-get", "install", "-y", "sudo"]
RUN ["apt-get", "install", "-y", "git"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "nano"]
RUN ["apt-get", "install", "-y", "tig"]

RUN git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
RUN cat ~/.bashrc /tmp/.bashrc-additions > ~/.bashrc