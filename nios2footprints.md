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
| Flow Status                     | Successful - Wed Jan 16 17:54:01 2019       |
| Quartus Prime Version           | 18.1.0 Build 625 09/12/2018 SJ Lite Edition |
| Family                          | Cyclone V                                   |
| Device                          | 5CSXFC6D6F31C6                              |
| Logic utilization (in ALMs)     | 3,827 / 41,910 ( 9 % )                      |
| Total registers                 | 4861                                        |
| Total block memory bits         | 851,552 / 5,662,720 ( 15 % )                |
| Total DSP Blocks                | 8 / 112 ( 7 % )                             |
| Total PLLs                      | 1 / 15 ( 7 % )                              |

## Nios2 FPGA max clock (85C Model)

**1. Basic configuratuion without floating point**

|           |                 |                     |      |
|-----------|-----------------|---------------------|------|
| Fmax      | Restricted Fmax | Clock Name          | Note |
| 98.59 MHz | 98.59 MHz       | altera_reserved_tck |      |

**2. Basic configuration with floating point**

|            |                 |                     |      |
|------------|-----------------|---------------------|------|
| Fmax       | Restricted Fmax | Clock Name          | Note |
| 104.53 MHz | 104.53 MHz      | altera_reserved_tck |      |

