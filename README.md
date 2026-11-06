
# INFR 3110 Make Up Assignment
---
### Name : Ashley Hacker
### Student Number : 100942843
---
# Object Oriented Programming
---

### Description
There are 5 classes, GameManager, SnakeFactory, Player, Apple, Tail. 

#### GameManager
Handles collecting apple logic, references everything else. Passes data around where it's needed. Also has a lose() function

#### Player
Handles everything related to moving the player and the tail and collision detection with the tail.

#### SnakeFactory
Handles spawning

#### Tail
This is literally unused I think but it's in there anyway

#### Apple
Handles apple pickup detection

The GameManager handles most things, below you can see how everything is architectured.

## UML Diagram
<img width="1033" height="464" alt="Drawing 2026-11-05 19 43 25 excalidraw" src="https://github.com/user-attachments/assets/8186f6d4-991c-464e-ac0f-329103d8eaea" />

---
# Singleton Pattern
---
### Purpose
Single instance class that can be referenced anywhere by anything

### Implementation
GameManager is a singleton autoload, it interfaces with everything. Interacts with the player, factory, apples, etc.


---
# Factory Pattern
---

### Purpose
Class that handles complicated spawning logic so nothing else has to. Instead of the player having to handle complicated spawn logic it happens here and the player calls it. Well actually in this case the GameManager does but who CARES.

### Implementation

SnakeFactory.gd handles the spawning of apples and tail pieces for the snake
---
# References
---
https://www.startpage.com/av/proxy-image?piurl=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fthumbnails%2F020%2F899%2F511%2Fsmall_2x%2Fred-apple-isolated-on-white-png.png&sp=1793923752T91394321c2f606072c0b2a4762044d1f6c223f18ce99609267c3f69269d60c11

## Steamhappy
https://store.steampowered.com/
