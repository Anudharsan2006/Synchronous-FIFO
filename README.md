# Synchronous FIFO (First-In First-Out)

A Verilog RTL implementation of a **Synchronous FIFO Memory** with complete testbench verification.

## 📌 Overview

A Synchronous FIFO (First-In First-Out) is a memory buffer where both read and write operations are controlled by the same clock signal. It is widely used in digital systems for temporary data storage, buffering, and data transfer between modules operating in the same clock domain.

This project implements a parameterized synchronous FIFO in Verilog HDL with support for:

- Write Operation
- Read Operation
- Full Flag Detection
- Empty Flag Detection
- FIFO Pointer Management
- Simulation and Verification using Testbench

---

## 🚀 Features

✅ Single Clock Domain Operation

✅ Parameterized Data Width

✅ Parameterized FIFO Depth

✅ Full and Empty Status Flags

✅ Circular Buffer Implementation

✅ RTL Design in Verilog

✅ Functional Verification through Testbench

---

## 📂 Project Structure

```text
Synchronous-FIFO/
│
├── synchronous_fifo.v      # FIFO RTL Design
├── fifo_tb.v               # Testbench
├── waveform.png            # Simulation Waveform (optional)
├── README.md
└── LICENSE
```

---

## 🏗️ FIFO Architecture

```text
                +----------------+
                |  Synchronous   |
 Write Data --->|      FIFO      |---> Read Data
                |                |
 Write Enable ->|                |
 Read Enable -->|                |
                |                |
                | Full Flag      |
                | Empty Flag     |
                +----------------+
                        |
                     Clock
```

---

## ⚙️ Parameters

| Parameter | Description |
|-----------|-------------|
| DATA_WIDTH | Width of each FIFO data word |
| DEPTH | Number of storage locations |
| ADDR_WIDTH | Address width for pointers |

Example:

```verilog
parameter DATA_WIDTH = 8;
parameter DEPTH      = 16;
```

---

## 🔄 FIFO Operation

### Write Operation

When:

```verilog
wr_en = 1
```

and FIFO is not full,

data is written into FIFO memory and write pointer increments.

---

### Read Operation

When:

```verilog
rd_en = 1
```

and FIFO is not empty,

data is read from FIFO memory and read pointer increments.

---

### Full Condition

FIFO becomes full when:

```text
Number of stored elements = DEPTH
```

`full = 1`

---

### Empty Condition

FIFO becomes empty when:

```text
Number of stored elements = 0
```

`empty = 1`

---

## 🧪 Simulation

### Compile

Using ModelSim:

```bash
vlog synchronous_fifo.v
vlog fifo_tb.v
vsim fifo_tb
run -all
```

Using Icarus Verilog:

```bash
iverilog -o fifo synchronous_fifo.v fifo_tb.v
vvp fifo
```

---

## 📊 Example Simulation Scenario

| Cycle | Operation | Data | FIFO Status |
|---------|-----------|------|-------------|
| 1 | Write | 10 | Not Empty |
| 2 | Write | 20 | Not Empty |
| 3 | Write | 30 | Not Empty |
| 4 | Read | 10 | Data Removed |
| 5 | Read | 20 | Data Removed |

FIFO Output Sequence:

```text
10
20
30
```

---

## 📈 Verification

The testbench verifies:

- FIFO Reset Operation
- Multiple Write Operations
- Multiple Read Operations
- Full Condition
- Empty Condition
- Simultaneous Read & Write
- Overflow Prevention
- Underflow Prevention

---

## 🎯 Applications

- UART Communication Buffers
- Network Packet Buffers
- DMA Controllers
- FPGA Data Streaming
- Embedded Systems
- Processor Interconnects
- Digital Signal Processing (DSP)

---

## 🛠️ Tools Used

- Verilog HDL
- ModelSim
- Vivado (Optional)
- Icarus Verilog
- GTKWave

---

## 📚 Learning Outcomes

Through this project, you will understand:

- FIFO Memory Architecture
- Pointer Management
- Circular Buffer Design
- Full & Empty Flag Logic
- RTL Design Methodology
- Verilog Coding Practices
- Digital System Verification

---

## 🤝 Contributing

Contributions are welcome.

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push to your branch
5. Create a Pull Request

---

## 📄 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

**Anudharsan R R**

VLSI & FPGA Enthusiast

- GitHub: https://github.com/Anudharsan2006
- Portfolio: https://anudharsanportfolio.vercel.app/

⭐ If you found this project useful, consider giving it a star!
