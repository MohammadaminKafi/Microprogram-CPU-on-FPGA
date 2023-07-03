# Microprogram CPU on FPGA
A microprogram CPU implemented and tested on Xilinx Spartan 6 slx9 as final project of hardware description language and digital systems design course

Project includes 3 IP Cores:
1. main memory: Block RAM 2048x16
2. micro memory: Block RAM 128x20
3. clock manager: Clock Wizard

Files include an assembler which uses `main.txt` and `main_micro.txt` to generate required `.coe` files for memory cores initialization
