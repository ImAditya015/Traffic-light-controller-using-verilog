# Traffic Light Controller (Behavioral Verilog)


## 📌 Overview
This project implements a simple traffic light controller using **behavioral modeling in Verilog**. The controller cycles through:
- **RED (5 cycles)**
- **GREEN (5 cycles)**
- **YELLOW (2 cycles)**


The project includes:
- Verilog design file
- Testbench
- Waveform generation
- RTL schematic generation instructions


---

Basic Working of the 4-Way Traffic Light Controller

A traffic light controller controls the flow of vehicles at a 4-way intersection (North, East, South, West).
Each direction gets a Green → Yellow → Red sequence, one after another.

The controller ensures:

Only one direction gets Green at a time

The next direction gets its turn in a fixed order

Safety timing is maintained while switching signals

This is done using a Finite State Machine (FSM).

🚦 Functioning / Operation

The controller cycles through these 8 states:

North Green

North Yellow

East Green

East Yellow

South Green

South Yellow

West Green

West Yellow

How the cycle works:

When North has Green, all others have Red

After Green duration, North gets Yellow

Immediately after Yellow, control passes to East

East gets Green, then Yellow

Then South

Then West

After West Yellow → cycle restarts at North Green

This creates a continuous traffic movement cycle.

__

Main Components Used in the Controller
1. Clock Signal

Provides timing for the controller

Determines how long each light remains in Green or Yellow

Every state transition happens on a clock edge

2. Reset Input

Forces the controller back to the initial state (North Green)

Useful during power-up or emergency reset

3. FSM (Finite State Machine)

This is the brain of the controller.
It stores the current state and decides the next state.

FSM contains:

State register → holds current state

Next-state logic → determines next state

Output logic → sets lights for each direction

4. Counters / Timers

Each state has a fixed time duration

Example: Green 10 cycles, Yellow 3 cycles

A counter counts clock cycles

When counter expires → move to next state

5. Signal Output Logic

The controller outputs for each direction:

Green

Yellow

Red

Exactly one direction has Green/Yellow at a time; all others are Red.

__

Important Concepts Used in This Project
1. Behavioral Modeling in Verilog

The design uses behavioral Verilog, meaning:

Logic is described using always blocks

Code describes how the system behaves, not specific gates

Makes FSM and timing easy to write

Example keywords:

always @(posedge clk)

case(state)

if / else

2. Finite State Machine (FSM) Design

This is the most important concept.

Your system uses:

Moore FSM (outputs depend only on state)

8 states (4 Green + 4 Yellow)

Transitions controlled by a counter

3. State Encoding

States can be encoded as:

Binary (00, 01, 10, ...)

One-hot (0001, 0010, 0100...)

Parameterized constants using localparam

Your design uses readable names like:

localparam N_GREEN = 3'd0;
localparam N_YELLOW = 3'd1;
...


This improves clarity and avoids magic numbers.

4. Timing Control Using Counters

Each state has a fixed time duration.

Example:

Green = 10 cycles

Yellow = 3 cycles

A counter increments every clock cycle and resets at state change.

5. Synchronous Logic

Everything updates on posedge clk, ensuring reliable behavior.

6. Combinational Output Logic

Lights for each direction are set based on the current state using case statements.
