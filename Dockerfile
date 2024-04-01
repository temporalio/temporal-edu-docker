FROM ubuntu:jammy-20240212

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update; \
    apt install -y --no-install-recommends openjdk-17-jdk openjdk-17-jre-headless python3-venv python3-pip curl git make maven sudo vim software-properties-common less locales; \
    /bin/bash -c "$(curl -fsSL https://deb.nodesource.com/setup_20.x | bash - )"; \
    apt update; \
    apt install -y --no-install-recommends nodejs; \
    echo "alias python='python3'" >> /etc/bash.bashrc; \
    echo "" >> /etc/bash.bashrc; \
    echo "PATH=/home/linuxbrew/.linuxbrew/bin:$PATH" >> /etc/bash.bashrc; \
    echo "" >> /etc/bash.bashrc; \
    echo "if [ -f /workspace/.bash.cfg ]; then" >> /etc/bash.bashrc; \
    echo "    . /workspace/.bash.cfg" >> /etc/bash.bashrc; \
    echo "fi" >> /etc/bash.bashrc; \
    echo "" >> /etc/bash.bashrc; \
    locale-gen en_US.UTF-8; \
    useradd -ms /bin/bash -G sudo linuxbrew

USER linuxbrew

RUN chmod -R 755 /home/linuxbrew; \
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
    /home/linuxbrew/.linuxbrew/bin/brew install tctl go temporal --ignore-dependencies
