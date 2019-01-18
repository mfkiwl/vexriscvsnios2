# VexRiscV vs. Nios2 benchmarks

## Boards overview

| Board          | FPGA       |Softcore CPU | Status           |
|----------------|------------|-------------|------------------|
| Terasic Sockit | Cyclone V  | Nios2 gen2  | ControlCore only |
| propietary     | Cyclone IV | Nios2 gen2  | ControlCore only |
| DE10 nano      | Cyclone IV | Nios2 gen2  | planned          |
| Arty-7 35T     | Artix-7    | SiFive E310 | planned          |
| Arty-7 35T     | Artix-7    | VexRiscV    | planned          |

## Nios2 configurations

### Basic core configuration

* Nios2f
* tidly coupled instruction memory: 16kB
* tidly coupled data memory: 16kB
* instruction cache: 2 kB
* data cache: 2 kB
* io region (non cached): 128 kB
* no vectored interrupt controller
* single periodic irq input shared by periodic timer and JTAG port for debugging

#### Integer Arithmetic

* Device Hardware: SRT Radix-2
* Multiply implementation: 3 16-bit multipliers
* Multiply extended implementation: 1 16-bit multiplier
* Shift/Rotate implementation: Logik elements (pipelined)

**cycle performance:** 

* Multiply: 1 cycle
* Extended Multiply 2 cycles
* Shift/Rotate: 1 cycle
* Divide: 35 cycles

## Nios2 FPGA footprints

**1. Basic configuratuion without floating point**

|                                 |                                             |
|---------------------------------|:--------------------------------------------|
| Quartus Prime Version           | 18.1.0 Build 625 09/12/2018 SJ Lite Edition |
| Family                          | Cyclone V                                   |
| Device                          | 5CSXFC6D6F31C6                              |
| Logic utilization (in ALMs)     | 2,863 / 41,910 ( 7 % )                      |
| Total registers                 | 4152                                        |
| Total block memory bits         | 835,648 / 5,662,720 ( 15 % )                |
| Total DSP Blocks                | 4 / 112 ( 4 % )                             |
| Total PLLs                      | 1 / 15 ( 7 % )                              |

|                                    |                                             |
|------------------------------------|:--------------------------------------------|
| Flow Status                        | Successful - Thu Jan 17 12:46:12 2019       |
| Quartus Prime Version              | 18.1.0 Build 625 09/12/2018 SJ Lite Edition |
| Family                             | Cyclone IV E                                |
| Device                             | EP4CE75F23C7                                |
| Total logic elements               | 6,507 / 75,408 ( 9 % )                      |
|     Total combinational functions  | 5,943 / 75,408 ( 8 % )                      |
|     Dedicated logic registers      | 3,834 / 75,408 ( 5 % )                      |
| Total registers                    | 3834                                        |
| Total memory bits                  | 835,648 / 2,810,880 ( 30 % )                |
| Embedded Multiplier 9-bit elements | 8 / 400 ( 2 % )                             |
| Total PLLs                         | 1 / 4 ( 25 % )                              |


**2. Basic configuration with floating point**

|                                 |                                             |
|---------------------------------|:--------------------------------------------|
| Quartus Prime Version           | 18.1.0 Build 625 09/12/2018 SJ Lite Edition |
| Family                          | Cyclone V                                   |
| Device                          | 5CSXFC6D6F31C6                              |
| Logic utilization (in ALMs)     | 3,827 / 41,910 ( 9 % )                      |
| Total registers                 | 4861                                        |
| Total block memory bits         | 851,552 / 5,662,720 ( 15 % )                |
| Total DSP Blocks                | 8 / 112 ( 7 % )                             |
| Total PLLs                      | 1 / 15 ( 7 % )                              |

|                                 |                                             |
|-----------------------------------|:------------------------------------------|
| Quartus Prime Version           | 18.1.0 Build 625 09/12/2018 SJ Lite Edition |
| Family                          | Cyclone IV E                                |
| Device                          | EP4CE75F23C7                                |
| Total logic elements            | 8,962 / 75,408 ( 12 % )                     |
|   Total combinational functions | 8,235 / 75,408 ( 11 % )                     |
|   Dedicated logic registers     | 4,519 / 75,408 ( 6 % )                      |
| Total registers                 | 4519                                        |
| Total memory bits               | 851,552 / 2,810,880 ( 30 % )                |
| Embedded Multiplier 9-bit elements | 18 / 400 ( 5 % )                         |
| Total PLLs                      | 1 / 4 ( 25 % )                              |

## Nios2 FPGA max clock (85C Model)

| Fmax      | Clock Name          | Note       | FPU |
|-----------|---------------------|------------|-----|
| 104.01 MHz| altera_reserved_tck | Cyclone IV |  no |
| 103.28 MHz| altera_reserved_tck | Cyclone V  |  no |
| 131.72 MHz| altera_reserved_tck | Cyclone IV | yes |
| 104.53 MHz| altera_reserved_tck | Cyclone V  | yes |
