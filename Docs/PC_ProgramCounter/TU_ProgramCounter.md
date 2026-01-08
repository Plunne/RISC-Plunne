# PC UNIT TESTS

Program Counter unit tests

> *Note : Abbrevations descriptions can be found into the Lexical Register.*

-----

## PC_TU001 - PC ADDRESS VALIDITY

Verify that the PC output always represents a valid instruction address.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/03  | 2026/01/03  | `IN_PROGRESS` | 2026/01/03 | Plunne      | Plunne        |

Linked to: PC_R001, PC_R002, PC_R003

| Step | Procedure                                        | Expectations                             |
|-----:|:-------------------------------------------------|:-----------------------------------------|
|    1 | Ensure clock is equal to 0                       | Clock is equal to 0                      |
|    2 | Proceed multiple clock cycles with stable states | PC output is a valid instruction address |

## PC_TU002 - SET POINTER UPDATE

Verify that when the `SET` signal is asserted, the PC is updated to the value of `NEW` at the rising edge of the clock.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/08  | 2026/01/08  | `IN_PROGRESS` | 2026/01/08 | Plunne      | Plunne        |

Linked to: PC_R004, PC_R005, PC_R006

| Step | Procedure                                       | Expectations                                                             |
|-----:|:------------------------------------------------|:-------------------------------------------------------------------------|
|    1 | Ensure clock is equal to 0                      | Clock is equal to 0                                                      |
|    2 | Ensure `RST` input is equal to 0                | `RST` input is equal to 0                                                |
|    3 | Ensure `INCR` input is equal to 0               | `INCR` input is equal to 0                                               |
|    4 | Set `NEW` to a test address different to the PC | `NEW` input holds the test adress that is not equal to PC address        |
|    5 | Set `SET` high for a stable period              | `SET` input has been set to 1; PC output remains unchanged               |
|    6 | Raise clock for a stable period                 | PC output updates to the value of `NEW`; `SET` input is still equal to 1 |
|    7 | Lower clock for a stable period                 | PC output remains unchanged                                              |
|    8 | Set `SET` low for a stable period               | `SET` input has been set to 0; PC output remains unchanged               |
|    9 | Proceed multiple stable clock cycles            | PC output remains unchanged                                              |

## PC_TU003 - RESET VALUE INITIALIZATION

Verify that when the `RST` signal is asserted, the PC is set to `PC_RST` at the rising edge of the clock.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/03  | 2026/01/03  | `IN_PROGRESS` | 2026/01/03 | Plunne      | Plunne        |

Linked to: PC_R007, PC_R008, PC_R009

| Step | Procedure                                   | Expectations                                                   |
|-----:|:--------------------------------------------|:---------------------------------------------------------------|
|    1 | Ensure clock is equal to 0                  | Clock is equal to 0                                            |
|    2 | Ensure `INCR` input is equal to 0           | `INCR` input is equal to 0                                     |
|    3 | Ensure `RST` input is equal to 0            | `RST` input is equal to 0                                      |
|    4 | Ensure PC output is different from `PC_RST` | PC output is different from `PC_RST`                           |
|    5 | Set `RST` high for a stable period          | `RST` input has been set to 1; PC output remains unchanged     |
|    6 | Raise clock for a stable period             | PC output updates to `PC_RST`; `RST` input is still equal to 1 |
|    7 | Lower clock for a stable period             | PC output remains unchanged                                    |
|    8 | Set `RST` low for a stable period           | `RST` input has been set to 0; PC output remains unchanged     |
|    9 | Proceed multiple stable clock cycles        | PC output remains unchanged                                    |


## PC_TU004 - INCREMENT VALUE UPDATE

Verify that when the `INCR` signal is asserted, the PC is incremented by `PC_INCR` at the rising edge of the clock.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/03  | 2026/01/03  | `IN_PROGRESS` | 2026/01/03 | Plunne      | Plunne        |

Linked to: PC_R010, PC_R011, PC_R012

| Step | Procedure                                        | Expectations                                                        |
|-----:|:-------------------------------------------------|:--------------------------------------------------------------------|
|    1 | Ensure clock is equal to 0                       | Clock is equal to 0                                                 |
|    2 | Ensure `RST` input is equal to 0                 | `RST` input is equal to 0                                           |
|    3 | Ensure `INCR` input is equal to 1                | `INCR` input has been set to 1                                      |
|    4 | Capture the current PC output                    | PC output is equal to a valid address                               |
|    5 | Raise clock for a stable period                  | PC output increments by `PC_INCR`, `INCR` input is still equal to 1 |
|    6 | Lower clock for a stable period                  | PC output remains unchanged                                         |
|    7 | Set `INCR` low for a stable period               | `INCR` input has been set to 0; PC output remains unchanged         |
|    8 | Proceed multiple clock cycles with stable states | PC output remains unchanged                                         |

## PC_TU005 - INCREMENT HOLD CONDITION

Verify that when the `INCR` signal is deasserted, the PC retains its current value.

| Creator | Created Date | Edited Date | Status        | Last Test  | Last Tester | Last Approver |
|:--------|:------------:|:-----------:|:--------------|:----------:|:------------|:--------------|
| Plunne  |  2026/01/03  | 2026/01/03  | `IN_PROGRESS` | 2026/01/03 | Plunne      | Plunne        |

Linked to: PC_R013

| Step | Procedure                                | Expectations                |
|-----:|:-----------------------------------------|:----------------------------|
|    1 | Ensure clock is equal to 0               | Clock is equal to 0         |
|    2 | Ensure `RST` input is equal to 0         | `RST` input is equal to 0   |
|    3 | Ensure `INCR` input is equal to 0        | `INCR` input is equal to 0  |
|    5 | Raise clock for a stable period          | PC output remains unchanged |
|    6 | Lower clock for a stable period          | PC output remains unchanged |
|    7 | Optionally toggle `INCR` to 0 repeatedly | PC output remains unchanged |
