# **ICS3203-CAT2-Assembly-WinnieWanjohi-140164**

## **Repository Overview**

This repository contains solutions to the CAT 2 tasks for ICS3203 - Assembly Language Programming. Each task demonstrates fundamental assembly programming concepts such as control flow, array manipulation, modular programming, and port-based data monitoring.

---

## **Repository Structure**


---

## **Task Summaries**

### **Task 1: Control Flow and Conditional Logic**

**Purpose**:  
This program demonstrates the use of branching logic in assembly language. It prompts the user to input a number and classifies it as **POSITIVE**, **NEGATIVE**, or **ZERO**. The program employs conditional jumps (`je`, `jg`, `jl`) to handle logical branching and an unconditional jump (`jmp`) to streamline flow between different classification blocks.

**Instructions**:
1. **Compile**:  
   `nasm -f elf32 task1.asm`
2. **Link**:  
   `ld -m elf_i386 -o task1 task1.o`
3. **Run**:  
   `./task1`

**Challenges**:
- Efficient management of conditional and unconditional jumps for smooth program flow.

---

### **Task 2: Array Manipulation with Looping and Reversal**

**Purpose**:  
This program reverses an array of integers in place using loops, avoiding additional memory. It demonstrates efficient memory handling and direct array operations in assembly.

**Instructions**:
1. **Compile**:  
   `nasm -f elf32 task2.asm`
2. **Link**:  
   `ld -m elf_i386 -o task2 task2.o`
3. **Run**:  
   `./task2`

**Challenges**:
- Proper handling of memory pointers and avoiding index out-of-bound errors during reversal.

---

### **Task 3: Modular Program for Factorial Calculation**

**Purpose**:  
This program calculates the factorial of a given number using a modular subroutine. It demonstrates the use of the stack for register preservation during subroutine calls.

**Instructions**:
1. **Compile**:  
   `nasm -f elf32 task3.asm`
2. **Link**:  
   `ld -m elf_i386 -o task3 task3.o`
3. **Run**:  
   `./task3`

**Challenges**:
- Accurate management of stack operations to prevent overwriting or losing register values.

---

### **Task 4: Data Monitoring and Control Using Port-Based Simulation**

**Purpose**:  
This program simulates a system that reads a sensor value and manages a motor and an alarm based on the input. It uses memory to simulate hardware behavior and manipulates bits for device control.

**Instructions**:
1. **Compile**:  
   `nasm -f elf32 task4.asm`
2. **Link**:  
   `ld -m elf_i386 -o task4 task4.o`
3. **Run**:  
   `./task4`

**Challenges**:
- Simulating hardware-like behavior with memory locations and ensuring accurate bit-level operations.

---

## **Compilation and Running Instructions**

### **Install NASM**
- Install NASM (Netwide Assembler) on your machine from [nasm.us](https://www.nasm.us).

### **Compile the Program**
- Use the following command to compile each `.asm` file:
  ```bash
  nasm -f elf32 <filename>.asm
ld -m elf_i386 -o <output_name> <filename>.o
