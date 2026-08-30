# Clock Divider in Verilog

A high-performance clock frequency divider that reduces a 100 MHz input clock to 1 Hz output, implemented in Verilog for FPGA and ASIC synthesis.

## 📋 Overview

This project implements a precision clock divider circuit that divides a 100 MHz input clock by exactly 50,000,000 to produce a stable 1 Hz output clock signal. This design is essential for applications requiring slower clock domains, timing circuits, or observable state changes in simulation and hardware verification.

## 🔧 Features

- **Input Frequency**: 100 MHz (10 ns period)
- **Output Frequency**: 1 Hz (1 second period)
- **Divider Ratio**: 50,000,000 (50 million)
- **Output Duty Cycle**: 50% (symmetric high/low time)
- **Asynchronous Reset**: Direct counter reset capability

## 📁 Project Structure

```
Clock-Divider/
├── src/
│   └── clock_divider.v        # Main clock divider module
├── results/
│   ├── clock_divider_schematic.jpg    # Schematic diagram
│   └── clock_divider_synthesis.jpg    # Synthesis results
├── LICENSE                    # MIT License
└── README.md                  # This file
```

---

### Frequency Calculation

**Mathematical Formula:**
```
Output Frequency = Input Frequency / (2 × Divider Count)
1 Hz = 100 MHz / (2 × 50,000,000)
1 Hz = 100,000,000 Hz / 100,000,000
```

**Timing Details:**
- **Input Period**: 10 ns (100 MHz)
- **Counter Range**: 0 to 49,999,999 (50 million states)
- **High Time**: 50 million clock cycles = 500 ms
- **Low Time**: 50 million clock cycles = 500 ms
- **Total Period**: 1,000 ms = 1 second
- **Frequency**: 1 Hz

---

## 📊 Timing Analysis

### Waveform Diagram

```
clk_100MHz:  ¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|¯|_|
             (10 ns period)

counter:     0 1 2 3 4 5 ... 49,999,999 | 0 1 2 3 ... 49,999,999
             ←──────────── 500 ms ─────→|←──────────── 500 ms ─────→

clk_1Hz:     ____________________________________________________
             0                          ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
             ←──────── 500 ms ─────────→ (1 second total period)
```

## Synthesis Analysis

### Resource Utilization

**FPGA Implementation (Typical):**

| Resource | D Flip-Flops (Registers) | LUTs (Logic) | Slices |
|----------|--------------------------|--------------|--------|
| 26-bit Counter | 26 | 4-6 | 1-2 |
| Comparator (≥) | - | 8-10 | 2-3 |
| Toggle Logic | 1 | 1-2 | 1 |
| **Total** | **27** | **13-18** | **4-6** |

## 💡 Design Characteristics

### Advantages
✅ Simple and compact implementation  
✅ Minimal resource usage (27 registers, ~18 LUTs)  
✅ High frequency input capability (>400 MHz capable)  
✅ Deterministic output (no jitter from toggle mechanism)  
✅ Suitable for FPGA and ASIC implementations  

### Limitations
⚠️ Fixed divider ratio (not programmable)  
⚠️ No enable/disable control  
⚠️ 50% duty cycle only (can be modified for 25/75/etc.)  
⚠️ Synchronous reset not implemented (only input port)  


## 🎓 Learning Concepts

### Counter-Based Frequency Division
- How counters generate precise frequencies
- Modulo arithmetic in hardware
- Toggle vs. pulse generation

### Synchronous vs. Asynchronous Design
- Clock-driven state transitions
- Edge-triggered behavior
- Setup/hold time constraints

### Fixed-Function vs. Programmable Design
- Trade-offs in area vs. flexibility
- Configuration storage
- Dynamic reconfiguration


## 🔗 Related Concepts

- **Phase-Locked Loop (PLL)**: Frequency multiplication/division
- **Digital Clock Manager (DCM)**: FPGA clock resources
- **Baud Rate Generators**: Serial communication timing
- **Prescalers**: Counter-based frequency scaling
- **DDS (Direct Digital Synthesis)**: Programmable frequency generation

---


