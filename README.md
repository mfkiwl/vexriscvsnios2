# VexRiscV versus Nios2 benchmarks

Collection of performance benchmarks for FPGA softcores.

The purpose of this project is to compare footprint and hardware performance of FPGA softcores - with the focus on Risc-V and Nios2. A minimal core ("*ControlCore*"), which only has some tightly coupled instruction and data RAM and an external Bus interface for peripheral IO, external memory and dual ported memory. For comparison the structure of the *ControlCore* for the softcore variants is as similar as possible. Two different variants with and without single precision hardware floating support are considered. Also different FPGA boards are considered and tested as far as available. For better comparison of the FPGA footprint, peripheral logic is very minimal.

## ControlCore functional structure

For better comparison the diagram is showing the functional structure implemented in *hardware/ControlCore.qsys* 
![Alt text](img/ControlCore_nios2.png?raw=true "")

Please note, that this is not the complete board SoC, but should be seen as a building block which typically would be instantiated with another CPU. It also can be instantiated more than once. *ContolCore* has no application specific IO IP. This should be mapped to the *controlcore_io* Avalon master. A more detailel interface of the *ControlCore* shows this diagram:
![Alt text](img/ControlCore.png?raw=true "")

For footprint and fmax benchmarking, the boardlevel design is kept very simple. The boardlevel implementation in *hardware/SingleCoreTest_Sockit_c5* is shown here as an example.
![Alt text](img/Toplevel_Sockit.png?raw=true "")
*SingleAxisCore* only implements a timer to generate a periodic interrupt.


## CurrentStatus:

* Everything new and untested
* complete board designs for:
  - *DE10 nano* board for Cyclone IV footprint timing constraints defined. Can be used as reference with "small" *ControlCore* without FPU.
  - *Terasic Sockit* board (for Cyclone V) timing constraints defined. Can be used as reference with "regular" *ControlCore* including FPU.
  
  Other boards yet to be done.

See actual data [here](nios2footprints.md)

