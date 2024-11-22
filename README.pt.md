# ProcessorCI Infrastructure

[![Build Status](https://github.com/LSC-Unicamp/processor-ci-infrastructure/actions/workflows/build.yml/badge.svg)](https://github.com/LSC-Unicamp/processor-ci-infrastructure/actions/workflows/build.yml)

Bem-vindo ao ProcessorCI!

**ProcessorCI** é um projeto que busca modernizar o processo de verificação de processadores, integrando técnicas consolidadas de verificação, integração contínua e uso de FPGAs.

## Sobre este Módulo

Este repositório fornece os scripts e arquivos de configuração necessários para configurar a infraestrutura do ProcessorCI, incluindo Dockerfiles e scripts shell.

## Instalação

1. **Clone o repositório**  
Clone o repositório para o seu ambiente de desenvolvimento local:

```bash
git clone https://github.com/LSC-Unicamp/processor-ci-infrastructure.git  
cd processor-ci-infrastructure  
```

2. **Execute o instalador**  
Execute o script `install_infrastructure.sh`:

```bash
sudo ./install_infrastructure.sh
```

O script exige permissões de `sudo`, pois instala pacotes e habilita serviços.  
Os serviços e ferramentas instalados incluem:  
- **Docker**  
- **UFW (Uncomplicated Firewall)**  
- **RISC-V GNU Toolchain**  
- **OSS CAD Suite**

3. **Instale toolchains adicionais**  
Os scripts e imagens Docker instalam apenas o Jenkins e toolchains de código aberto por padrão. Para utilizar ferramentas proprietárias como Vivado ou Quartus, elas devem ser instaladas externamente ao container. Por padrão, o container está configurado para integrar instalações externas localizadas em `/eda`, por exemplo:  
`/eda/vivado/Vivado/2023.2/bin`.

## Configuração

Por padrão, o container está pré-configurado para utilizar os padrões globais do ProcessorCI. No entanto, ajustes como configuração de domínio podem ser necessários para atender às necessidades específicas do seu ambiente.

## Uso

### Principais Recursos

- **Integração CI/CD**: O Jenkins é pré-configurado para pipelines de teste de hardware e software.  
- **Suporte a Toolchains**: A infraestrutura suporta uma combinação de toolchains de código aberto e proprietárias, oferecendo flexibilidade no fluxo de trabalho de design.  
- **Escalabilidade**: Expanda facilmente a infraestrutura para múltiplos processadores ou alvos FPGA.  

### Executando os Serviços

Após a instalação, serviços como Docker e Jenkins estarão em execução. Você pode acessar o Jenkins via o domínio ou IP configurado. Documentação adicional para configuração de pipelines específicos está disponível na [documentação oficial do ProcessorCI](https://processorci.ic.unicamp.br).

## Dúvidas e Sugestões  

A documentação oficial está disponível em: [processorci.ic.unicamp.br](https://processorci.ic.unicamp.br/).  
Dúvidas e sugestões podem ser enviadas na seção de Issues no GitHub. Contribuições são sempre bem-vindas, e todos os Pull Requests serão revisados e mesclados sempre que possível.  

## Contribuindo  

**Contribuições**: Caso deseje contribuir, consulte o arquivo [CONTRIBUTING.md](./CONTRIBUTING.md) para obter diretrizes.  

## Licença  

Este projeto é licenciado sob a licença [MIT](./LICENSE), garantindo total liberdade de uso.
