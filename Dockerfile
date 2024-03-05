FROM ubuntu:jammy-20240212
#FROM debian:bookworm-20240211-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN bash -c 'curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&'; \
    apt update; \
    apt install -y --no-install-recommends nodejs openjdk-17-jdk curl git make sudo vim software-properties-common; \
    #apt install -y --no-install-recommends nodejs openjdk-17-jdk curl git python3-venv software-properties-common; \
    add-apt-repository ppa:deadsnakes/ppa; \
    apt update; \
    apt install -y --no-install-recommends python3.12; \
    #/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
    git clone https://github.com/Homebrew/brew /opt/homebrew; \
    #/home/linuxbrew/.linuxbrew/bin/brew install tctl go temporalio/brew/tcld --ignore-dependencies; \
    /opt/homebrew/bin/brew update --force --quiet; \
    /opt/homebrew/bin/brew install tctl go --ignore-dependencies; \
    /opt/homebrew/bin/brew install temporalio/brew/tcld --ignore-dependencies; \
    curl -sSf https://temporal.download/cli.sh | sh; \
    echo "PATH=/root/.temporalio/bin:/opt/homebrew/bin:$PATH" >> /etc/bash.bashrc; \
    echo "alias python='python3'" >> /etc/bash.bashrc