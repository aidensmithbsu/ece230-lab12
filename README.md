# Finite State Machine Lab

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Aiden Smith, Max Martinez

## Summary
In this lab, we made two different implementations of a finite state machine: One Hot and Binary. These implementations differ in state encoding, flip-flop count and logic complexity.
The state machine we implemented is described with this table:
| Current State | Next State (w=0) | Next State (w=1) | Output (z) |
| ------------- | ---------------- | ---------------- | ---------- |
| A | B | D | 0 |
| B | C | D | 0 |
| C | C | D | 1 |
| D | B | E | 0 |
| E | B | E | 1 |


## Lab Questions

### Compare and contrast One Hot and Binary encodings
| One Hot encoding                                | Binary encoding                                                   |
| ----------------------------------------------- | ----------------------------------------------------------------- |
| One bit set at a time<br>(A=00001, B=00010, C=00100, D=01000, E=10000) | Binary numbers<br>(A=000 (0), B=001 (1), C=010 (2), D=011 (3), E=100 (4)) |
| Requires N flip-flops for N states              | Requires log<sub>2</sub>(N) flip-flops for N states               |
| Simpler "next state" and output logic           | More complex "next state" and output logic, often requires k-maps |

### Which method did your team find easier, and why?
The One Hot method was easier for us. Since this method encodes each state as a single bit, only one bit needs to be tested to see if we are in a certain state, and only one bit needs to be set to enter a new state. This makes the functions smaller and more readable.
For example: We output `z=1` when in state `C` or `E`, so `z = C | E`. We can get to state `D`  from state `A`, `B` or `C` when `w=1`, so `D = w & (A | B | C)`.

Binary encoding, on the other hand, required us to solve k-maps for the output and next state logic, resulting in more complex sums of products for each output and next state bit.<br>
For example: The function for `z` became `z = (~Q2 & Q1 & ~Q0) | (Q2 & ~Q1 & ~Q0)`. There is no single "state D" bit in binary encoding. Instead, "state D" is encoded across all bits
as `011`, so the logic to "enter state D" is spread across all bits (which also include logic to enter all the other states), making the functions less human readable. K-maps needed to be used to find optimized functions for each state bit.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
If flip-flops are a constrained resource on the FPGA, then binary encoding should be used to save flip-flops.
