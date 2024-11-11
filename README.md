# FPGA IGNITE 2024

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

This is a Multi Project Die (MPD) submission which contains designs created
during the FPGA Ignite Summer School 2024 at Heidelberg University. The designs
are listed below. More detailed descriptions can be found in the respective GitHub
projects. All designs are connected to an eFPGA created using the
[FABulous](https://github.com/FPGA-Research-Manchester/FABulous) framework.

Refer to [README](docs/source/index.md) for get the design ready for a
submission.

## Projects

### FPGAIgnite-VGA

The design consists of a pixel processing unit (PPU) to generate image patterns
and a 6-bit/64-color Video Graphics Array (VGA) Driver.

Repo: https://github.com/jhspuk/FPGAIgnite-VGA

### THE RING

An 8-bit random number generator based on ring oscillators.

Repo: https://github.com/matztron/ignite24_rng

### CXBex

CXBex is small RISC-V SoC, wich allows the user to use reconfigurable custom
instructions. The SoC is based on the [ibex](https://github.com/lowRISC/ibex)
core and implements the [Composable Custom Extension
CX](https://github.com/grayresearch/CX). The CX interface is connected to and
embedded FPGA, which allows the user to implement reconfigurable custom
instructions. The eFPGA is designed using the
[FABulous](https://github.com/FPGA-Research-Manchester/FABulous) framework.

Repo: https://github.com/TaoBi22/cxbex

### PERCIVAL

<!-- TODO: Just copied the first sentence of their repo, is that fine? -->
PERCIVAL is an application-level posit capable RISC-V core based on CVA6 that
can execute all posit instructions, including the quire fused operations.

Repo: https://github.com/ormskirk77/PERCIVAL_heidelberg

<!-- TODO: Probably remove -->
### NOVA Core


## Pinout

| Caravel MPRJ | Top Wrapper `io_in`/`io_out` bit| Fabulous Board                       |  Function                                             |
|--------------|---------------------------------|--------------------------------------|-------------------------------------------------------|
|  7           | 0                               | Middle Pin J8                        | Reset (active low)                                    |
|  8           | 1                               | Middle Pin J11                       | Select module                                         |
|  9           | 2                               | Middle Pin J13                       | Sel (Find a better description)                       |
|  10          | 3                               |                                      | Bitbang serial clock                                  |
|  11          | 4                               |                                      | Bitbang serial data                                   |
|  12          | 5                               | Bottom left and</br> top right pin J6| eFPGA UART RX                                         |
|  13          | 6                               | LED D1                               | RX LED                                                |
|  14-26       | 7-19                            | 0-12                                 | eFPGA IOs                                             |
|  27          | 20                              | 13                                   | VGA V-SYNC                                            |
|  28          | 21                              | 14                                   | VGA H-SYNC                                            |
|  29 + 30     | 22 + 23                         | 15 + 16                              | VGA Blue (2 bit)                                      |
|  31 + 32     | 24 + 25                         | 17 + 18                              | VGA Green (2 bit)                                     |
|  33 + 34     | 26 + 27                         | 19 + 20                              | VGA Red (2 bit)                                       |
|  35          | 28                              | 21                                   | NOVACORE UART RX                                      |
|  36          | 29                              | 22                                   | NOVACORE UART TX                                      |
|  37          | 30                              | 23                                   | Clock select UART TX</br> 0: user_clock_2, 1: WB clock|
