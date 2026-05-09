# 4-bit Parallel-In Parallel-Out (PIPO) Register - Verilog

## Overview

This project implements a 4-bit Parallel-In Parallel-Out (PIPO) register using Verilog HDL. The register loads 4-bit parallel input data and transfers it directly to the output on the positive edge of the clock when the load signal is enabled.

---

## Design Description

### PIPO Register

* Accepts 4-bit parallel input data (`din_i`)
* Transfers input directly to output
* Data loads only when `load_i` is HIGH
* Uses synchronous reset
* Triggered on positive edge of clock

---

## Module Details

### PIPO Module

```verilog
module PIPO(
   input [3:0] din_i,
   input load_i,
   input clk_i,
   input rst_i,
   output reg [3:0] dout_o
);
```

### Inputs

* `din_i`  → 4-bit parallel input
* `load_i` → Load enable signal
* `clk_i`  → Clock signal
* `rst_i`  → Active HIGH reset

### Output

* `dout_o` → 4-bit parallel output

---

## Working Principle

At every positive edge of the clock:

1. If reset is active:

   * Output becomes `0000`

2. Else if load is HIGH:

   * Input data is loaded into output

3. Else:

   * Previous output value is retained

---

## Functional Behavior

| Reset | Load | Operation              |
| ----- | ---- | ---------------------- |
| 1     | X    | Clear output           |
| 0     | 1    | Load input into output |
| 0     | 0    | Hold previous value    |

---

## Testbench Description

The testbench performs the following operations:

* Generates clock signal
* Applies reset initially
* Loads different 4-bit values
* Tests hold condition when load is LOW
* Displays simulation activity using `$monitor`
* Dumps waveform into `PIPO.vcd`

---

## Simulation Sequence

### Step 1: Reset Active

```verilog
rst_ti = 1'b1;
```

Output clears to:

```text
0000
```

### Step 2: Load Enabled

```verilog
load_ti = 1'b1;
din_ti = 4'b1010;
```

Output becomes:

```text
1010
```

### Step 3: Load Disabled

```verilog
load_ti = 1'b0;
din_ti = 4'b1111;
```

Output remains:

```text
1010
```

### Step 4: Load Enabled Again

Output updates to:

```text
1111
```

---

## Sample Simulation Output

```text
Time: 10 | Load: 1, Clk: 1 | Input: a | Output: a
Time: 20 | Load: 0, Clk: 1 | Input: f | Output: a
Time: 40 | Load: 1, Clk: 1 | Input: f | Output: f
```

---

## Waveform

Generated waveform file:

```text
PIPO.vcd
```

View using GTKWave:

```bash
gtkwave PIPO.vcd
```

---

## How to Run (Icarus Verilog)

### Compile

```bash
iverilog -o pipo PIPO.v
```

### Run Simulation

```bash
vvp pipo
```

### Open Waveform

```bash
gtkwave PIPO.vcd
```

---

## Notes

* This design uses behavioral modeling
* Register updates only on positive clock edge
* Output retains previous value when load is LOW
* Synchronous reset clears the output register

---

## Applications

* Temporary data storage
* Buffer registers
* Data transfer systems
* Digital communication systems
* Register-based architectures

---
