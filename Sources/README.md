# ARCHITECTURE
```
RISC_Plunne/
└─ Sources/
   ├─ rtl/                  # All CPU VHDL modules
   │   ├─ core.vhd          # Core (top-level integration)
   │   ├─ alu.vhd           # Arithmetic Logical Unit
   │   ├─ bcu.vhd           # Branch Control Unit
   │   ├─ dmem.vhd          # Data Memory
   │   ├─ immu.vhd          # Immediate Unit
   │   ├─ idcd.vhd          # Instruction Decode
   │   ├─ imem.vhd          # Instruction Memory
   │   ├─ pc.vhd            # Program Counter
   │   └─ regf.vhd          # Register File
   │
   ├─ sim/                  # Testbenches files
   │   ├─ tb_core.vhd
   │   ├─ tb_alu.vhd
   │   ├─ tb_bcu.vhd
   │   ├─ tb_dmem.vhd
   │   ├─ tb_immu.vhd
   │   ├─ tb_idcd.vhd
   │   ├─ tb_imem.vhd
   │   ├─ tb_pc.vhd
   │   └─ tb_regf.vhd
   │
   └─ RISC_Plunne.xpr       # Vivado project file
```