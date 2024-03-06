FROM ubuntu:jammy-20240212

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update; \
    apt install -y --no-install-recommends openjdk-17-jdk openjdk-17-jre-headless curl git make maven sudo vim software-properties-common; \
    /bin/bash -c "$(curl -fsSL https://deb.nodesource.com/setup_20.x | bash - )"; \
    add-apt-repository ppa:deadsnakes/ppa; \
    apt update; \
    apt install -y --no-install-recommends python3.12 nodejs; \
    echo "alias python='python3.12'" >> /etc/bash.bashrc; \
    echo "PATH=/home/linuxbrew/.linuxbrew/bin:$PATH" >> /etc/bash.bashrc; \
    useradd -ms /bin/bash -G sudo linuxbrew

USER linuxbrew

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
    /home/linuxbrew/.linuxbrew/bin/brew install tctl go temporal --ignore-dependencies