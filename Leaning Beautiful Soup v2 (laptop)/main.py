import random
from datetime import time

print("1. Rock\n2. Paper\n3. Scissors")

user = int(input("Enter your choice here[Enter only numbers]: "))
robot = random.randrange(1, 3)


if user != robot:
    if user == 1 and robot == 2:
        print("User wins!")
    if user == 1 and robot == 3:
        print("User wins")
