# age = int(input("Enter your age here: "))

# if age >= 18:
#     print("You are eligible to apply for CNIC")
# else:
#     print("You are not eligible to apply for CNIC")


username = input("Enter your name here: ").lower()
age = int(input("Enter your age here: "))
gender = input("Enter your gender here: ").lower()
maritalstatus = input("Enter your marital status here Y/N: ").capitalize()


if gender == "female":
    if maritalstatus == "Y":    
        print(f"Hey {username}, You'll work only in the head office areas")
    else:
        print(f"")
elif gender == "male":
    if age <= 40 and age >= 20:
        print(f"Hey {username}, You can work anywhere!")

elif gender == "male":
    if age <= 60 and age >= 40:
        print(f"Hey {username}, You can only work Urban Areas!")

else:
    print("Error!!")
ls = [
    "shaheer", 
    "jamal",
    "chishti"
]

print(ls)
# ls.append("karachi")
# print(ls)

# ls[3] = "Pakistan"
# print(ls)

# ls.insert(0, "Muhammad")
# print(ls)

# ls[0:]


for i in range(1 , 5+1):
    print("Im sleepy")