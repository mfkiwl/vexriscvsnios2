# VexRiscV vs. Nios2 benchmarks

## Nios2 configurations

**Basic core configuration:**

* Nios2f
* tidly coupled instruction memory: 16kB
* tidly coupled data memory: 16kB
* instruction cache: 2 kB
* data cache: 2 kB
* io region (non cached): 128 kB
* no vectored interrupt controller
* single periodic irq input shared by periodic timer and JTAG port for debugging

## Nios2 FPGA footprints

**1. Basic configuratuion without floating point**

|                                 |                                             |
|---------------------------------|:--------------------------------------------|
| Quartus Prime Version           | 18.1.0 Build 625 09/12/2018 SJ Lite Edition |
| Family                          | Cyclone V                                   |
| Device                          | 5CSXFC6D6F31C6                              |
| Logic utilization (in ALMs)     | 2,832 / 41,910 ( 7 % )                      |
| Total registers                 | 4143                                        |
| Total block memory bits         | 835,648 / 5,662,720 ( 15 % )                |
| Total DSP Blocks                | 4 / 112 ( 4 % )                             |
| Total PLLs                      | 1 / 15 ( 7 % )                              |


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
| Total logic elements            | 8,946 / 75,408 ( 12 % )                     |
|   Total combinational functions | 8,239 / 75,408 ( 11 % )                     |
|   Dedicated logic registers     | 4,519 / 75,408 ( 6 % )                      |
| Total registers                 | 4719                                        |
| Total memory bits               | 851,552 / 2,810,880 ( 30 % )                |
| Embedded Multiplier 9-bit elements | 18 / 400 ( 5 % )                         |
| Total PLLs                      | 1 / 4 ( 25 % )                              |

## Nios2 FPGA max clock (85C Model)

**1. Basic configuratuion without floating point**

|           |                 |                     |      |
|-----------|-----------------|---------------------|------|
| Fmax      | Restricted Fmax | Clock Name          | Note |
| 98.59 MHz | 98.59 MHz       | altera_reserved_tck |      |

**2. Basic configuration with floating point**

  * Cyclone V:
  
|            |                 |                     |      |
|------------|-----------------|---------------------|------|
| Fmax       | Restricted Fmax | Clock Name          | Note |
| 104.53 MHz | 104.53 MHz      | altera_reserved_tck |      |

  * Cyclone IV:
  
|            |                 |                     |      |
|------------|-----------------|---------------------|------|
| Fmax       | Restricted Fmax | Clock Name          | Note |
| 127.29 MHz | 127.29 MHz      | altera_reserved_tck |      |

