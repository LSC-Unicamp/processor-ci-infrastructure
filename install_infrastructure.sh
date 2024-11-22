#!/usr/bin/bash

# Função para instalar dependências no Debian/Ubuntu
install_debian() {
    echo "Detectado Debian/Ubuntu."
    sudo apt update
    sudo apt install -y meson libevent-dev libjson-c-dev make git curl  gzip wget \
        clang docker docker-compose build-essential cmake ufw

}

# Função para instalar dependências no Fedora
install_fedora() {
    echo "Detectado Fedora."
    sudo dnf install -y meson libevent-devel json-c-devel make git curl gzip wget clang docker docker-compose cmake ufw
}

# Função para instalar dependências no Arch
install_arch() {
    echo "Detectado Arch."
    sudo pacman -Syu --noconfirm meson libevent json-c make git curl gzip wget clang docker docker-compose base-devel cmake ufw
}

install_centos() {
    echo "Detectado Cent oS."
    sudo yum install -y meson libevent-devel json-c-devel make git curl gzip wget clang docker docker-compose cmake ufw
}

# Detectando a distribuição
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        debian)
            install_debian
            ;;
        ubuntu)
            install_debian
            ;;
        fedora)
            install_fedora
            ;;
        arch)
            install_arch
            ;;
        centos)
            install_centos
            ;;
        *)
            echo "Distribuição não suportada: $ID"
            exit 1
            ;;
    esac
else
    echo "Não foi possível detectar a distribuição."
    exit 1
fi

# Criando diretorio de trabalho
echo "Criando diretório de trabalho..."

mkdir -p /eda
mkdir -p /jenkins

cd /eda

# clonando repositorio
echo "Clonando repositórios..."

git clone --recursive https://github.com/LSC-Unicamp/processor-ci-controller.git
git clone https://github.com/LSC-Unicamp/processor-ci.git
git clone --recursive https://github.com/LSC-Unicamp/processor-ci-tests.git
git clone https://github.com/LSC-Unicamp/processor-ci-website.git
git clone https://github.com/LSC-Unicamp/processor-ci-infrastructure.git
git clone https://github.com/LSC-Unicamp/processor_ci_communication.git


# Instalando OSS-CAD-Suite
echo "Instalando OSS-CAD-Suite..."

cd /eda

wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2024-11-19/oss-cad-suite-linux-x64-20241119.tgz

tar -xvzf oss-cad-suite-linux-x64-20241119.tgz
rm oss-cad-suite-linux-x64-20241119.tgz

curl -sSL https://raw.githubusercontent.com/lushaylabs/openfpgaloader-ubuntufix/main/setup.sh | sh

# Instalando RISCV-TOOLCHAIN
echo "Instalando RISCV-TOOLCHAIN..."

cd /eda

git clone --recursive https://github.com/riscv-collab/riscv-gnu-toolchain.git

cd riscv-gnu-toolchain

mkdir -p /eda/riscv

./configure --prefix=/eda/riscv

make -j$(nproc)

echo "Instalação concluída com sucesso!"

# Configurando UFW

sudo ufw allow ssh
sudo ufw allow "Nginx Full"

# Configurando cron

# Define a nova entrada para o crontab
NEW_CRON_JOB="0 23 * * * /eda/processor-ci-infrastructure/update_repositories.sh"

# Verifica se a tarefa já existe no crontab
(crontab -l 2>/dev/null | grep -Fxq "$NEW_CRON_JOB") && {
    echo "Tarefa já existe no crontab."
    exit 0
}

# Adiciona a nova tarefa ao crontab
(crontab -l 2>/dev/null; echo "$NEW_CRON_JOB") | crontab -

echo "Tarefa adicionada ao crontab com sucesso!"

# Configurando docker

sudo systemctl enable docker
sudo systemctl start docker

# Configurando docker-compose

# docker path: /eda/processor-ci-infraestructure/docker-compose.yml

cd /eda/processor-ci-infraestructure/

docker-compose up -d

echo "Docker-compose configurado com sucesso!"

