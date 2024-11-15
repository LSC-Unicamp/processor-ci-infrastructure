FROM jenkins/jenkins:lts

# Instalar pacotes adicionais necessários
USER root
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    python3 \
    python3-pip \
    python3-dev

# Configuração extra de plugins ou inicialização
COPY jenkins_plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

USER jenkins
