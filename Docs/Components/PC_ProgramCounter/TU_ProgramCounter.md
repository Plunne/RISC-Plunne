# PC UNIT TESTS

Program Counter unit tests

> *Note : Abbrevations descriptions can be found into the Lexical Register.*

-----

## PC_TU001 - PC ADDRESS SIZE

Verify that the PC output size is equal to `XLEN` .

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/03  | 2026/01/19  | `IN_PROGRESS` | 2026/01/03 | Plunne      | Plunne        |

Linked to: PC_R001

| Step | Procedure                                  | Expectations               |
|-----:|:-------------------------------------------|:---------------------------|
|    1 | Check that PC output size is equal to XLEN | `PC` size is equal to XLEN |

## PC_TU002 - SET POINTER UPDATE

Verify that when the `SP_EN` signal is asserted, the PC is updated to the value of `SP_ADDR` at the rising edge of the clock.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/08  | 2026/01/18  | `IN_PROGRESS` | 2026/01/18 | Plunne      | Plunne        |

Linked to: PC_R004, PC_R005, PC_R006

| Step | Procedure                                              | Expectations                                                          |
|-----:|:-------------------------------------------------------|:----------------------------------------------------------------------|
|    1 | Ensure clock is equal to 0                             | Clock is equal to 0                                                   |
|    2 | Ensure `RST`, `INCR` and `SP_EN` inputs are equal to 0 | `RST`, `INCR` and `SP_EN` inputs are equal to 0                       |
|    3 | Set `SP_ADDR` to a test address different to the PC    | `SP_ADDR` input holds the test adress that is not equal to PC address |
|    4 | Set `SP_EN` high for a stable period                   | `SP_EN` input has been set to 1; PC output remains unchanged          |
|    5 | Raise clock for a stable period                        | PC output updates to `SP_ADDR`; `SP_EN` input is still equal to 1     |
|    6 | Lower clock for a stable period                        | PC output remains equal to `SP_ADDR`                                  |
|    7 | Set `SP_EN` low for a stable period                    | `SP_EN` input has been set to 0; PC output remains unchanged          |
|    8 | Proceed multiple stable clock cycles                   | PC output remains unchanged                                           |

## PC_TU003 - RESET POINTER UPDATE

Verify that when the `RST` signal is asserted, the PC is set to `PC_RST` at the rising edge of the clock.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/03  | 2026/01/18  | `IN_PROGRESS` | 2026/01/03 | Plunne      | Plunne        |

Linked to: PC_R007, PC_R008, PC_R009

| Step | Procedure                                              | Expectations                                                   |
|-----:|:-------------------------------------------------------|:---------------------------------------------------------------|
|    1 | Ensure clock is equal to 0                             | Clock is equal to 0                                            |
|    2 | Ensure `RST`, `INCR` and `SP_EN` inputs are equal to 0 | `RST`, `INCR` and `SP_EN` inputs are equal to 0                |
|    3 | Ensure PC output is different from `PC_RST`            | PC output is different from `PC_RST`                           |
|    4 | Set `RST` high for a stable period                     | `RST` input has been set to 1; PC output remains unchanged     |
|    5 | Raise clock for a stable period                        | PC output updates to `PC_RST`; `RST` input is still equal to 1 |
|    6 | Lower clock for a stable period                        | PC output remains equal to `PC_RST`                            |
|    7 | Set `RST` low for a stable period                      | `RST` input has been set to 0; PC output remains unchanged     |
|    8 | Proceed multiple stable clock cycles                   | PC output remains unchanged                                    |


## PC_TU004 - INCREMENT POINTER UPDATE

Verify that when the `INCR` signal is asserted, the PC is incremented by `PC_INCR` at the rising edge of the clock.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/03  | 2026/01/18  | `IN_PROGRESS` | 2026/01/03 | Plunne      | Plunne        |

Linked to: PC_R010, PC_R011, PC_R012

| Step | Procedure                                              | Expectations                                                        |
|-----:|:-------------------------------------------------------|:--------------------------------------------------------------------|
|    1 | Ensure clock is equal to 0                             | Clock is equal to 0                                                 |
|    2 | Ensure `RST`, `INCR` and `SP_EN` inputs are equal to 0 | `RST`, `INCR` and `SP_EN` inputs are equal to 0                     |
|    3 | Capture the current PC output                          | PC output is equal to a valid address                               |
|    4 | Set `INCR` high for a stable period                    | `INCR` input has been set to 1; PC output remains unchanged         |
|    5 | Raise clock for a stable period                        | PC output increments by `PC_INCR`, `INCR` input is still equal to 1 |
|    6 | Lower clock for a stable period                        | PC output remains equal to PC capture + `PC_INCR`                   |
|    7 | Set `INCR` low for a stable period                     | `INCR` input has been set to 0; PC output remains unchanged         |
|    8 | Proceed multiple clock cycles with stable states       | PC output remains unchanged                                         |

## PC_TU005 - INCREMENT HOLD CONDITION

Verify that when the `INCR` signal is deasserted, the PC retains its current value.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/03  | 2026/01/19  | `IN_PROGRESS` | 2026/01/03 | Plunne      | Plunne        |

Linked to: PC_R013, PC_R002, PC_R003

| Step | Procedure                                              | Expectations                                    |
|-----:|:-------------------------------------------------------|:------------------------------------------------|
|    1 | Ensure clock is equal to 0                             | Clock is equal to 0                             |
|    2 | Ensure `RST`, `SP_EN` and `INCR` inputs are equal to 0 | `RST`, `SP_EN` and `INCR` inputs are equal to 0 |
|    3 | Proceed multiple clock cycles                          | PC output remains unchanged                     |

## PC_TU006 - SET POINTER PRIORITY OVER INCREMENT

Verify that when both `SP_EN` and `INCR` signals are asserted, the PC is updated to `SP_ADDR` and not incremented.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/08  | 2026/01/18  | `IN_PROGRESS` | 2026/01/08 | Plunne      | Plunne        |

Linked to: PC_R014

| Step | Procedure                                              | Expectations                                                          |
|-----:|:-------------------------------------------------------|:----------------------------------------------------------------------|
|    1 | Ensure clock is equal to 0                             | Clock is equal to 0                                                   |
|    2 | Ensure `RST`, `SP_EN` and `INCR` inputs are equal to 0 | `RST`, `SP_EN` and `INCR` inputs are equal to 0                       |
|    3 | Set `SP_ADDR` to a test address different to the PC    | `SP_ADDR` input holds the test adress that is not equal to PC address |
|    4 | Set `SP_EN` and `INCR` high for a stable period        | `SP_EN` = 1, `INCR` = 1; PC output remains unchanged                  |
|    5 | Raise clock for a stable period                        | PC output updates to `SP_ADDR`                                        |
|    6 | Lower clock for a stable period                        | PC output remains equal to `SP_ADDR`                                  |
|    7 | Set `SP_EN` and `INCR` low for a stable period         | `SP_EN` = 0, `INCR` = 0                                               |
|    8 | Proceed multiple stable clock cycles                   | PC output remains unchanged                                           |

## PC_TU007 - RESET PRIORITY OVER SET AND INCREMENT

Verify that when `RST`, `SP_EN` and `INCR` are asserted simultaneously, reset behavior has priority.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/08  | 2026/01/18  | `IN_PROGRESS` | 2026/01/08 | Plunne      | Plunne        |

Linked to: PC_R015

| Step | Procedure                                                        | Expectations                                                                            |
|-----:|:-----------------------------------------------------------------|:----------------------------------------------------------------------------------------|
|    1 | Ensure clock is equal to 0                                       | Clock is equal to 0                                                                     |
|    2 | Ensure `RST`, `SP_EN` and `INCR` inputs are equal to 0           | `RST`, `SP_EN` and `INCR` inputs are equal to 0                                         |
|    3 | Set `SP_ADDR` to a test address different to the PC and `PC_RST` | `SP_ADDR` input holds a valid test address that is not equal to PC address and `PC_RST` |
|    4 | Set `RST`, `SP_EN` and `INCR` high for a stable period           | `RST` = 1, `SP_EN` = 1, `INCR` = 1; PC output remains unchanged                         |
|    5 | Raise clock for a stable period                                  | PC output updates to `PC_RST`                                                           |
|    6 | Lower clock for a stable period                                  | PC output remains equal to `PC_RST`                                                     |
|    7 | Set `RST`, `SP_EN` and `INCR` low for a stable period            | All inputs are equal to 0                                                               |
|    8 | Proceed multiple stable clock cycles                             | PC output remains unchanged                                                             |
