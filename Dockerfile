FROM jenkins/jenkins:lts

# Instalar pacotes adicionais necessários
USER root
RUN apt-get update && apt-get install -y \
    make \
    cmake \
    build-essential \
    curl \
    vim \
    python3 \
    python3-pip \
    python3-dev libtinfo-dev \
    python-is-python3 pipx python3-xmlrunner python3-serial

RUN ln -s /lib/x86_64-linux-gnu/libtinfo.so.6 /lib/x86_64-linux-gnu/libtinfo.so.5

# Instala o pacote 'locales', gera en_US.UTF-8 e configura
RUN apt-get update && apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 update-locale

RUN localedef -i en_US -f UTF-8 en_US.UTF-8
RUN echo "LANG=\"en_US.UTF-8\"" > /etc/locale.conf
RUN ln -s -f /usr/share/zoneinfo/US/Eastern /etc/localtime

# Define as variáveis de ambiente
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

# Configuração extra de plugins ou inicialização
COPY jenkins_plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

USER jenkins