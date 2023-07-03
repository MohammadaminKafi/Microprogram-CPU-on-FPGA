from ManoAssembler import Assembler, MicroAssembler

if __name__ == "__main__":
    assembly_program = open('main_mul_12.8.txt', 'r').read().split('\n')
    for i in range(len(assembly_program)):
        assembly_program[i] = assembly_program[i].split()

    assembly_microprogram = open('main_micro_mul_12.8.txt', 'r').read().split('\n')
    for i in range(len(assembly_microprogram)):
        assembly_microprogram[i] = assembly_microprogram[i].split()

    
    # assembling code
    microassembler = MicroAssembler(assembly_microprogram)
    microassembler.assemble()
    assembler = Assembler(assembly_program, microassembler.get_first_pass_table())
    assembler.assemble()

    # writting coe file
    with open ('main_mem.coe', 'w') as f:
        f.write('memory_initialization_radix=2;\n')
        f.write('memory_initialization_vector=\n')
        for i in range(2047):
            if i in assembler.second_pass_table.keys():
                f.write(assembler.second_pass_table[i] + ',\n')
            else:
                f.write('0' * 16 + ',\n')
        if 2047 in assembler.second_pass_table.keys():
            f.write(assembler.second_pass_table[2047] + ';')
        else:
            f.write('0' * 16 + ';')

    with open ('micro_mem.coe', 'w') as f:
        f.write('memory_initialization_radix=2;\n')
        f.write('memory_initialization_vector=\n')
        for i in range(127):
            if i in microassembler.second_pass_table.keys():
                f.write(microassembler.second_pass_table[i] + ',\n')
            else:
                f.write('0' * 20 + ',\n')
        if 127 in microassembler.second_pass_table.keys():
            f.write(microassembler.second_pass_table[2047] + ';')
        else:
            f.write('0' * 20 + ';')