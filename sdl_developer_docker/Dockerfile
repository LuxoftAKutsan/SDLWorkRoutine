FROM ubuntu:16.04

RUN apt-get update && apt install -y sudo cowsay

RUN apt-get update && apt install -y git tmux wget zsh vim fonts-powerline gitk meld tree mc

# ZSH config
RUN git clone https://github.com/robbyrussell/oh-my-zsh /opt/oh-my-zsh
RUN cp /opt/oh-my-zsh/templates/zshrc.zsh-template .zshrc 
RUN cp -r /opt/oh-my-zsh .oh-my-zsh 
RUN mkdir /home/developer
RUN cp /opt/oh-my-zsh/templates/zshrc.zsh-template /home/developer/.zshrc
RUN cp -r /opt/oh-my-zsh /home/developer/.oh-my-zsh 
RUN sed  "s/robbyrussell/bira/" -i /home/developer/.zshrc
RUN echo "PROMPT=\$(echo \$PROMPT | sed 's/%m/%f\$IMAGE_NAME/g')" >> /home/developer/.zshrc
RUN echo "RPROMPT=''" >> /home/developer/.zshrc

# Tmux config 
RUN echo "set -g prefix C-a" >> ~/.tmux.conf
WORKDIR /opt
RUN git clone https://github.com/gpakosz/.tmux.git
COPY setup_tmux.sh /opt/startup/setup_tmux.sh

# Sublime instalation
ARG SUBLIME_BUILD="${SUBLIME_BUILD:-3176}"
RUN wget https://download.sublimetext.com/sublime-text_build-"${SUBLIME_BUILD}"_amd64.deb --no-check-certificate
RUN dpkg -i -R sublime-text_build-"${SUBLIME_BUILD}"_amd64.deb


# SSH setup 
RUN echo $HOME
ARG ssh_prv_key
ARG ssh_pub_key
RUN apt-get update && \
    apt-get install -y \
    git openssh-server libmysqlclient-dev 
RUN mkdir -p /root/.ssh
RUN chmod 0700 /root/.ssh 
RUN ssh-keyscan github.ford.com > /root/.ssh/known_hosts
RUN echo $ssh_prv_key
RUN echo $ssh_pub_key
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa 
RUN echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub 
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa.pub
RUN ls -la /root/.ssh/ 
RUN eval "$(ssh-agent)" && ssh-add
COPY ssh_setup.sh /opt/startup/

# SDL build evironment
RUN apt update && apt install libexpat1-dev
RUN apt update && apt install -y libssl-dev libbluetooth3 libbluetooth-dev libudev-dev libusb-1.0 bluez-tools sqlite3 libsqlite3-dev
RUN apt update && apt install -y build-essential g++ python-dev autotools-dev libicu-dev build-essential libbz2-dev
RUN apt update && apt install -y clang-format-3.6

# ATF build environment
RUN apt update && apt install -y liblua5.2 libxml2 libxml2-dev lua-lpeg g++ qt5-default libqt5webkit5-dev libqt5websockets5-dev net-tools 
ENV QMAKE /usr/bin/qmake

RUN apt update && apt install -y qtcreator
COPY QtCreatorConfigs /home/developer/.config/QtProject
RUN chmod a+rw /home/developer/.config/QtProject

COPY entrypoint.sh /usr/bin/
ENTRYPOINT ["/bin/bash", "-e", "/usr/bin/entrypoint.sh"]
CMD ["/bin/zsh"]
