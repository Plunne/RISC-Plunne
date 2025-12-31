# RISC-P - DOCUMENTATION

Here are located all documentation files.

They are organized like :
- A directory for each modules of the CPU
- Those directories shall be named with the prefix `<module_abbreviation>` followed by the module name (e.g. ALU_ArithmeticLogicalUnit)
- Inside those directories, there are a file for Requierements and another for Test-Benches (more could be added in the future)
- Requierements files shall be named with the prefix `REQ_` followed by the module name (e.g. REQ_ArithmeticLogicalUnit)
- Test-Benches files shall be named with the prefix `TB_` followed by the module name (e.g. TB_ArithmeticLogicalUnit)
- Requierements and Test-Benches file are currently written in Markdown following a project convention.
- Exception for Multiplexers, a directory `MUX` is in place for all Multiplexers.
- Multiplexers sub-directories shall be name with the prefix `<mux_abbreviation>` followed by the mux name (e.g. OpSel_OperandsSelector)
- Exception for Core, the directory is named Core.
- Core REQ and TB files are respectively named `REQ_Core` and `TB_Core`.

## Modules
| Module              | File     | Entity | Architecture |
|:------------------- |:-------- |:------ |:------------ |
| Core                | core.vhd | Core   | arch_Core    |
| ALU                 | alu.vhd  | ALU    | arch_ALU     |
| Register File       | regf.vhd | RegF   | arch_RegF    |
| Immediate Unit      | immu.vhd | ImmU   | arch_ImmU    |
| Instruction Decode  | idcd.vhd | IDcd   | arch_IDcd    |
| Instruction Memory  | imem.vhd | IMem   | arch_IMem    |
| Data Memory         | dmem.vhd | DMem   | arch_DMem    |
| Branch Control Unit | bcu.vhd  | BCU    | arch_BCU     |
| Program Counter     | pc.vhd   | PC     | arch_PC      |


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


## Tests-Benches Convention
- Tests-Benches shall have a TB_ID
- Tests-Benches IDs shall starts with TB followed by 3 digits (e.g. TB014)
- Tests-Benches shall be named with the prefix `<module_abbreviation>` followed by the TB_ID (e.g. IMem_TB014)
- Tests-Benches shall have a Title and a Procedure
- Tests-Benches shall be linked to one requierement or more
- Tests-Benches shall have a creation date and a creator
- Tests-Benches shall have a test date and the tester
- Tests-Benches shall have a status (PASSED or FAILED)
- Tests-Benches shall be PASSED when the test passed
- Tests-Benches shall be FAILED when the test failed