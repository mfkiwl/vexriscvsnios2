# VexRiscV versus Nios2 benchmarks

Collection of performance benchmarks for FPGA softcores.

The purpose of this project is to compare footprint and hardware performance of FPGA softcores - with the focus on Risc-V and Nios2. A minimal core ("*ControlCore*"), which only has some tightly coupled instruction and data RAM and an external Bus interface for peripheral IO, external memory and dual ported memory. For comparison the structure of the *ControlCore* for the softcore variants is as similar as possible. Two different variants with and without single precision hardware floating support ist considered. Also different FPGA boards are considered and tested as far as available. For better comparison of the FPGA footprint, peripheral logic is very minimal.

## CurrentStatus:

* Everything new and untested
* complete board designs for:
  - *DE10 nano* board for Cyclone IV footprint timing constraints defined. Can be used as reference with "small" *ControlCore* without FPU.
  - *Terasic Sockit* board (for Cyclone V) timing constraints defined. Can be used as reference with "regular" *ControlCore* including FPU.
  
  Other boards yet to be done.

See actual data [here](nios2footprints.md)

