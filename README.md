# ProcessorCI Infrastructure

- **Não fala Inglês? [clique aqui](./README.pt.md)**

Welcome to ProcessorCI!

**ProcessorCI** is a project aimed at modernizing the processor verification process by integrating well-established verification techniques, continuous integration, and FPGA usage.

## About this Module

This repository provides the necessary scripts and configuration files for setting up the ProcessorCI infrastructure, including Dockerfiles and shell scripts.

## Installation

1. **Clone the repository**  
Clone the repository to your local development environment:

```bash
git clone https://github.com/LSC-Unicamp/processor-ci-infrastructure.git  
cd processor-ci-infrastructure  
```

2. **Run the installer**  
Execute the `install_infrastructure.sh` script:

```bash
sudo ./install_infrastructure.sh
```

The script requires `sudo` permissions as it installs packages and enables services.  
Services and tools installed include:  
- **Docker**  
- **UFW (Uncomplicated Firewall)**  
- **RISC-V GNU Toolchain**  
- **OSS CAD Suite**

3. **Install additional toolchains**  
The scripts and Docker images install only Jenkins and open-source toolchains by default. To use proprietary tools like Vivado or Quartus, you must install them externally to the container. By default, the container is configured to integrate with external installations located under `/eda`, for example:  
`/eda/vivado/Vivado/2023.2/bin`.

## Configuration

By default, the container is pre-configured to use the global ProcessorCI standards. However, adjustments such as domain configuration may be necessary to fit your specific environment.

## Usage

### Key Features

- **CI/CD Integration**: Jenkins is pre-configured for streamlined hardware and software testing pipelines.  
- **Toolchain Support**: The infrastructure supports a mix of open-source and proprietary toolchains, enabling a flexible design workflow.  
- **Scalability**: Easily expand the infrastructure for multiple processors or FPGA targets.  

### Running the Services

After installation, services like Docker and Jenkins will be up and running. You can access Jenkins via the configured domain or IP. Additional documentation for setting up specific pipelines is available on the [official ProcessorCI documentation](https://processorci.ic.unicamp.br).

## Questions and Suggestions  

The official documentation is available at: [processorci.ic.unicamp.br](https://processorci.ic.unicamp.br/).  
For questions or suggestions, please use the GitHub Issues section. Contributions are always welcome, and all Pull Requests will be reviewed and merged when possible.  

## Contributing  

**Contributions**: If you'd like to contribute, please refer to the [CONTRIBUTING.md](./CONTRIBUTING.md) file for guidelines.  

## License  

This project is licensed under the [MIT](./LICENSE) license, granting full freedom of use.  
