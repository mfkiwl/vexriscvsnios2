# VexRiscV vs. Nios2 benchmarks

## Boards overview

| Board          | FPGA       |Softcore CPU | Status           | ControlCore |
|----------------|------------|-------------|------------------|-------------|
| Terasic Sockit | Cyclone V  | Nios2 gen2  | full board design| regular     |
| propietary     | Cyclone IV | Nios2 gen2  | ControlCore only | regular     |
| DE10 nano      | Cyclone IV | Nios2 gen2  | full board design| small       |
| Arty-7 35T     | Artix-7    | SiFive E310 | planned          | ?           |
| Arty-7 35T     | Artix-7    | VexRiscV    | planned          | ?           |

## Nios2 configurations

### Basic core configuration

Due to limitation of some evaluation boards available memory there is a small ControlCore variant. But essentially the structure should else be the same in both configurations.

**regular ControlCore**

* Nios2f
* tightly coupled instruction memory: 16kB
* tightly coupled data memory: 16kB
* on chip dual ported memory: 16kB
* instruction cache: 2 kB
* data cache: 2 kB
* io region (non cached): 128 kB
* no vectored interrupt controller
* single periodic irq input shared by periodic timer and JTAG port for debugging

**small ControllCore**

Same as above, but:

* tightly coupled instruction memory: 8kB
* tightly coupled data memory: 4kB
* on chip dual ported memory: 8kB
* no instruction cache
* no data cache

If not otherwise noted, the results refer to the regular variant.

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
| Logic utilization (in ALMs)     | 2,872 / 41,910 ( 7 % )                      |
| Total registers                 | 4169                                        |
| Total block memory bits         | 835,648 / 5,662,720 ( 15 % )                |
| Total DSP Blocks                | 4 / 112 ( 4 % )                             |
| Total PLLs                      | 1 / 15 ( 7 % )                              |

|                                    |                                             |
|------------------------------------|:--------------------------------------------|
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

**small ControlCore**:

|  DE10 nano                         |                                             |
|------------------------------------|:--------------------------------------------|
| Quartus Prime Version              | 18.1.0 Build 625 09/12/2018 SJ Lite Edition |
| Family                             | Cyclone IV E                                |
| Device                             | EP4CE22F17C6                                |
| Total logic elements               | 5,607 / 22,320 ( 25 % )                     |
|   Total combinational functions    | 5,153 / 22,320 ( 24 % )                     |
|   Dedicated logic registers        | 3,309 / 22,320 ( 15 % )                     |
| Total registers                    | 3309                                        |
| Total pins                         | 9 / 154 ( 6 % )                             |
| Total memory bits                  | 439,808 / 608,256 ( 72 % )                  |
| Embedded Multiplier 9-bit elements | 8 / 132 ( 6 % )                             |
| Total PLLs                         | 1 / 4 ( 25 % )                              |

**2. Basic configuration with floating point**

|    Terasic Sockit               |                                             |
|---------------------------------|:--------------------------------------------|
| Quartus Prime Version           | 18.1.0 Build 625 09/12/2018 SJ Lite Edition |
| Family                          | Cyclone V                                   |
| Device                          | 5CSXFC6D6F31C6                              |
| Logic utilization (in ALMs)     | 4064 / 41,910 ( 10 % )                      |
| Total registers                 | 5218                                        |
| Total block memory bits         | 851,552 / 5,662,720 ( 15 % )                |
| Total pins                      |                                             |
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

**small ControlCore**:

|                                 |                                             |
|-----------------------------------|:------------------------------------------|
| Quartus Prime Version           | 18.1.0 Build 625 09/12/2018 SJ Lite Edition |
| Family                          | Cyclone IV E                                |
| Device                          | EP4CE22F17C6                                |
| Total logic elements            | 8,113 / 22,320 ( 36 % )                     |
|   Total combinational functions | 7,428 / 22,320 ( 33 % )                     |
|   Dedicated logic registers     | 3,994 / 22,320 ( 18 % )                     |
| Total registers                 | 4240                                        |
| Total memory bits               | 455,712 / 608,256 ( 75 % )                  |
| Embedded Multiplier 9-bit elements | 18 / 132 ( 14 % )                        |
| Total PLLs                      | 1 / 4 ( 25 % )                              |


## Nios2 FPGA max clock (85C Model)

| Fmax      | Clock Name          | Note       | FPU | Core variant | Board    |
|-----------|---------------------|------------|-----|--------------|----------|
| 100.61 MHz| altera_reserved_tck | Cyclone V  |  no | regular      |          |
| 120.0  MHz| sys_clk             | Cyclone V  | yes | regular      | Sockit   |
| 104.01 MHz| altera_reserved_tck | Cyclone IV |  no | regular      |          |
| 140.0  MHz| sys_clk             | Cyclone IV |  no | small        | DE10_nano|
| 131.72 MHz| altera_reserved_tck | Cyclone IV | yes | regular      |          |
| 146.76 MHz| altera_reserved_tck | Cyclone IV | yes | small        |          |


## Dhrystone benchmarks (Preliminary collection)

| Board          | FPGA       |Softcore CPU | Status     | Dhrystones/MHz | DMIPS/MHz | core freq. |
|----------------|------------|-------------|------------|----------------|-----------|------------|
| Terasic Sockit | Cyclone V  | Nios2 gen2  | TODO       |                |           |            |
| propietary     | Cyclone IV | Nios2 gen2  | TODO       |                |           |            |
| DE10 nano      | Cyclone IV | Nios2 gen2  | TODO       |                |           |            |
| Arty-7 35T     | Artix-7    | SiFive E31  | 1)         | 3017           |   1.72    |    65 MHz  |
| Arty-7 35T     | Artix-7    | SiFive E31  | 2)         | 2959           |   1.68    |    65 MHz  |
| Arty-7 35T     | Artix-7    | VexRiscV    | planned    |                |           |            |

1) based on sifive_coreip_E31_FPGA_Evaluation_v19_02. Dhrystone v 2.1 benchmark compiled with gcc 8.1.0 -O3
2)  gcc 8.1.0 -O2
