# PC REQUIEREMENTS

Program Counter requierements

> *Note : Abbrevations descriptions can be found into the Lexical Register.*

-----

## PC_R001 - HOLDING ADDRESS OF CURRENT INSTRUCTION

PC shall always hold the address of the current instruction.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R002 - INSTRUCTION SIZE

PC instruction size shall be equal to XLEN.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R003 - RESET SIGNAL PRESENCE

PC shall have a reset input signal named `RST` to initialize the PC.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R004 - RESET VALUE

PC shall have a reset value named `PC_RST` equal to `0x00000000`.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R005 - RESET CONDITION

When the `RST` signal is asserted, PC shall be set to `PC_RST`.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R006 - INCREMENT SIGNAL PRESENCE

PC shall have an increment input signal named `INCR` to control the default PC increment.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R007 - INCREMENT VALUE

PC shall have an increment value named `PC_INCR` equal to `4`.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R008 - INCREMENT UPDATE CONDITION

PC value shall be incremented by `PC_INCR` only when the `INCR` signal is asserted.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R009 - INCREMENT HOLD CONDITION

When the `INCR` signal is deasserted, PC shall retain its current value.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R010 - RESET PRIORITY

Reset behavior shall take priority over `INCR` signal behavior.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

## PC_R011 - OUTPUT STABILITY

PC output shall remain stable between clock edges.

| Creator | Created Date | Edited Date | Status     | Last APPROVED | Last Editor | Last Approver |
|:--------|:------------:|:-----------:|:----------:|:-------------:|:------------|:--------------|
| Plunne  | 2025/12/31   | 2025/12/31  | `APPROVED` | 2025/12/31    | Plunne      | Plunne        |

