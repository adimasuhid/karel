# Karel

Simple implementation of [Karel the robot](https://www.cs.mtsu.edu/~untch/karel/fundamentals.html) in Ruby

## Usage

### Setup
```
x = 4
y = 1
direction = 'N'
karel = Karel.new(x, y, direction)
```

### Movement
Doing single movements
```
# Move one step to the current direction
karel.move 

# Move current direction one step counterclockwise
karel.left 

# Move current direction one step clockwise
karel.right
```

Doing multiple movements in sequence
```
command = 'MMMMLMMMRMML'
karel.follow(command)
```
