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
    python3-dev \
    python-is-python3

# Instala o pacote 'locales', gera en_US.UTF-8 e configura
RUN apt-get update && apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Define as variáveis de ambiente
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

# Configuração extra de plugins ou inicialização
COPY jenkins_plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

USER jenkins
