# FPGA IGNITE 2024

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

This is a Multi Project Die (MPD) submission which contains designs created
during the FPGA Ignite Summer School 2024 at Heidelberg University. The designs
are listed below. More detailed descriptions can be found in the respective GitHub
projects. All designs are connected to an eFPGA created using the
[FABulous](https://github.com/FPGA-Research-Manchester/FABulous) framework.

Refer to [README](docs/source/index.md) for get the design ready for a
submission.

<!-- TODO: check what to do with the links, probably copy the repos so they will
not get lost if they are deleted -->

## Projects

### FPGAIgnite-VGA

The design consists of a pixel processing unit (PPU) to generate image patterns
and a 6-bit/64-color Video Graphics Array (VGA) Driver.

Repo: https://github.com/jhspuk/FPGAIgnite-VGA

### THE RING

An 8-bit random number generator based on ring oscillators.

Repo: https://github.com/matztron/ignite24_rng

### CXBex

CXBex is a small RISC-V SoC, which allows the user to use reconfigurable custom
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


## Pinout

| Caravel MPRJ IO | Top Wrapper `io_in`/`io_out` bit| Fabulous Board                       |  Function                       | Default GPIO config  |
|--------------|---------------------------------|--------------------------------------|---------------------------------|----------------------|
|  7           | 0                               | Middle Pin J8                        | External Clock                  | INPUT_NOPULL         |
|  8           | 1                               | Middle Pin J11                       | CLK_SEL_0                       | INPUT_NOPULL         |
|  9           | 2                               | Middle Pin J13                       | CLK_SEL_1                       | INPUT_NOPULL         |
|  10          | 3                               |                                      | Bitbang serial clock            | INPUT_NOPULL         |
|  11          | 4                               |                                      | Bitbang serial data             | INPUT_NOPULL         |
|  12          | 5                               | Bottom left and</br> top right pin J6| eFPGA UART RX                   | INPUT_NOPULL         |
|  13          | 6                               | LED D1                               | RX LED                          | OUTPUT               |
|  14-25       | 7-18                            | 0-11                                 | eFPGA IOs                       | BIDIRECTIONAL        |
|  26          | 19                              | 12                                   | Select module                   | INPUT_NOPULL         |
|  27          | 20                              | 13                                   | Sel (Find a better description) | INPUT_NOPULL         |
|  28          | 21                              | 14                                   | VGA V-SYNC                      | OUTPUT               |
|  29          | 22                              | 15                                   | VGA H-SYNC                      | OUTPUT               |
|  30 + 31     | 23 + 24                         | 16 + 17                              | VGA Blue (2 bit)                | OUTPUT               |
|  32 + 33     | 25 + 26                         | 18 + 19                              | VGA Green (2 bit)               | OUTPUT               |
|  34 + 35     | 27 + 28                         | 20 + 21                              | VGA Red (2 bit)                 | OUTPUT               |
|  36          | 29                              | 22                                   | Reset (active low)              | INPUT_NOPULL         |
|  37          | 30                              | 23                                   | External Clock shifted          | INPUT_NOPULL         |


### Clock selection



| MPRJI IO_8/CLK_SEL_0 | MPRJ IO_9/CLK_SEL_1 | Clock source                 |
|----------------------|---------------------|------------------------------|
|  0                   |  X                  | external (IO_7)              |
|  1                   |  0                  | wishbone (10 MHz)            |
|  1                   |  1                  | user_clock2 (default 10 MHz) |
