# VexRiscV versus Nios2 benchmarks

Collection of performance benchmarks for FPGA softcores.

The purpose of this project is to compare footprint and hardware performance of FPGA softcores - with the focus on Risc-V and Nios2. A minimal core ("*ControlCore*"), which only has some tightly coupled instruction and data RAM and an external Bus interface for peripheral IO, external memory and dual ported memory. For comparison the structure of the *ControlCore* for the softcore variants is as similar as possible. Two different variants with and without single precision hardware floating support ist considered. Also different FPGA boards are considered and tested as far as available. For better comparison of the FPGA footprint, peripheral logic is very minimal.

## CurrentStatus:

* Everything new and untested
* complete board design of *DE10 nano* board for Cyclone IV footprints and fmax design checked. Can be used as reference with "small" *ControlCore* without FPU. Other boards yet to be done.
* Memory footprints of *ControlCore* for Cyclone IV and Cyclone V are done. Only a physical sys_clk is connected yet. Note: since no peripheral logic is connected, some logic of the *ControlCore* may be eliminated by the design system. See actual data is [here](nios2footprints.md)

