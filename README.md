# MIPS Assembly Program

This project contains a simple **MIPS assembly** program written in the MARS / SPIM format (`.s` file).  
It demonstrates basic low-level operations such as:

- Arithmetic computation  
- Branching and conditional execution  
- Loops  
- User input/output using MIPS syscalls  
- Register manipulation  

---

## 🧠 Features

### ➤ Arithmetic operations  
The program performs operations using integer registers.

### ➤ Conditional branching  
Uses instructions such as:

- `beq`
- `bne`
- `blt`
- `bgt`

to implement decision-making logic.

### ➤ Looping  
A simple loop is implemented using labels and conditional jumps.

### ➤ Syscalls  
Reads user input and prints formatted output.

---

## 📁 File Included

- `atm_pin_program.s`

---

## ▶️ How to Run (MARS or SPIM)

### 🔹 **Using MARS**
1. Download MARS:  
   https://courses.missouristate.edu/kenvollmar/mars/
2. Open `atm_pin_program.s`
3. Assemble → Run

### 🔹 **Using QtSPIM**
1. Download QtSPIM:  
   http://spimsimulator.sourceforge.net/
2. Open the `.s` file
3. Load → Run

---

## 🎓 What This Project Demonstrates

- Understanding of MIPS registers (`$t0-$t9`, `$s0-$s7`)  
- Implementing simple algorithms in assembly  
- Manual control flow (no high-level constructs)  
- Memory and register-level thinking  
- Basic I/O through system calls  

This project showcases low-level programming and machine-level reasoning—useful for showing hardware/software understanding in a portfolio.
