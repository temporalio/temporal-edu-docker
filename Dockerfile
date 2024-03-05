FROM ubuntu:jammy-20240212

ENV DEBIAN_FRONTEND=noninteractive

RUN bash -c 'curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&'; \
    apt update; \
    apt install -y --no-install-recommends nodejs openjdk-17-jdk curl git make sudo vim software-properties-common; \
    add-apt-repository ppa:deadsnakes/ppa; \
    apt update; \
    apt install -y --no-install-recommends python3.12; \
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
    /home/linuxbrew/.linuxbrew/bin/brew install tctl go temporal --ignore-dependencies; \
    echo "PATH=/home/linuxbrew/.linuxbrew/bin:$PATH" >> /etc/bash.bashrc; \
    echo "alias python='python3.12'" >> /etc/bash.bashrc