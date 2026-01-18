# RISC-P - DOCUMENTATION

Here are located all documentation files.

They are organized like :
- A directory for each modules of the CPU
- Those directories shall be named with the prefix `<module_abbreviation>` followed by the module name (e.g. ALU_ArithmeticLogicalUnit)
- Inside those directories, there are a file for Requierements and another for Test-Benches (more could be added in the future)
- Requierements files shall be named with the prefix `REQ_` followed by the module name (e.g. REQ_ArithmeticLogicalUnit)
- Test-Benches files for unit tests shall be named with the prefix `TU_` followed by the module name (e.g. TU_ArithmeticLogicalUnit)
- Test-Benches files for integration tests shall be named with the prefix `TI_` followed by the module name (e.g. TI_ArithmeticLogicalUnit)
- Test-Benches files for validation tests shall be named with the prefix `TV_` followed by the module name (e.g. TV_ArithmeticLogicalUnit)
- Requierements and Test-Benches file are currently written in Markdown following a project convention.
- Exception for Multiplexers, a directory `MUX` is in place for all Multiplexers.
- Multiplexers sub-directories shall be name with the prefix `<mux_abbreviation>` followed by the mux name (e.g. OpSel_OperandsSelector)
- Exception for Core, the directory is named Core.
- Core REQ and TB files are respectively named `REQ_Core` and `TB_Core`.

## Modules Convention
- Entities names of modules shall consist of an abbreviation of the module name from 2 to 4 letters
- In entities names, each word of the module name first letter shall be in uppercase, the rest shall be in lower case (e.g. Register File = RegF)
- All entity sources files names shall be the corresponding entity name in lowercase
- All entities architectures shall be the entity name with the prefix `arch_` (e.g. arch_RegF)
- All tests-benches sources files names shall be the corresponding entity name in lowercase with the prefix `tb_`
- All tests-benches entities names shall be the corresponding file name in lowercase
- All tests-benches architectures shall be the test-bench file name with the prefix `arch_` (e.g. arch_RegF)

| Module                  | Fichier  | Entité | Architecture |
| :---------------------- | :------- | :----- | :----------- |
| Core                    | core.vhd | Core   | arch_Core    |
| Arithmetic Logical Unit | alu.vhd  | ALU    | arch_ALU     |
| Branch Control Unit     | bcu.vhd  | BCU    | arch_BCU     |
| Data Memory             | dmem.vhd | DMem   | arch_DMem    |
| Immediate Unit          | immu.vhd | ImmU   | arch_ImmU    |
| Instruction Decode      | idcd.vhd | IDcd   | arch_IDcd    |
| Instruction Memory      | imem.vhd | IMem   | arch_IMem    |
| Program Counter         | pc.vhd   | PC     | arch_PC      |
| Register File           | regf.vhd | RegF   | arch_RegF    |

## Requierements Convention
- Requierements shall have a REQ_ID
- Requierements REQ_IDs shall start with a R followed by 3 digits (e.g. R023)
- Requierements shall be named with the prefix `<module_abbreviation>` followed by the REQ_ID (e.g. IMem_R023)
- Requierements shall have a Title and a Description
- Requierements shall have a creation date and a creator
- Requierements shall have an edition date and the editor
- Requierements shall have a status (WIP, ACCEPTED, WAITING)
- Requierements shall be WIP when in progress
- Requierements shall be ACCEPTED when has been accepted for implementation
- Requierements shall be WAITING when is ready to be reviewed

## Tests Convention
- Tests Cases shall have a type (U=Unit, I=Integration, V=Validation)
- Tests Cases shall have a Tx_ID 
- Tx_ID shall starts with the `Tx` prefix where x is the test type letter followed by 3 digits (e.g. TI014 for Test Integration 14)
- Tests Cases shall be named with the prefix `<module_abbreviation>` followed by the Tx_ID (e.g. IMem_TI014)
- Tests Cases shall have a Title and a Procedure
- Tests Cases shall be linked to one requierement or more
- Tests Cases shall have a creation date and a creator
- Tests Cases shall have a test date and the tester
- Tests Cases shall have a status (PASSED or FAILED)
- Tests Cases shall be PASSED when the test passed
- Tests Cases shall be FAILED when the test failed
- Tests Cases shall print the Tx_ID followed by the test name
- Tests Cases shall print the requierements linked to it