#Learning sets:

#Sets are unordered collections of unique elements.
#Sets are mutable, but elements of sets must be immutable.
#Sets are used to store a collection of items that need to be accessed randomly.


#Creating a set
# set1 = set([1, 2, 3, 4, 5, 5])
# # print(set1)

# print(set1)

# r = input("Enter a string: ")

# if r == r[::-1]: #r -- r 
#     print("Palindrome") 
# else:
#     print("Not Palindrome")

# print(r[::-1])
# username = input("Here: ")


# cities = ["Karachi", "Lahore", "Islamabad", "Quetta", "Peshawar"]
# for i in range(len(cities)):
#     print("ShaheerJamal ")
    
# #task
# ls = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# for temp in ls:
#     # print(temp)
#     for ntemp in temp:
#         print(ntemp)
        
# for i in range(10, 1, -1):
#     print(i)
    
# #print even no from 1 to 10 - task
# for i in range(1, 11):
#     if i % 2 == 0:
#         print(i)
        
        
# #task
# total = 0
# for i in range(1, 6):
#     a = int(input("Enter a number: "))
#     total += a #total = total + a
# print(total)

dict1 = {
    "fname": "Shaheer",
    "lname": "Jamal",
    "age": 19,
    "weight":55
}

# for i in dict1:
#     print(i, dict1[i])

for i, j in dict1.items():
    print(f"This is key: {i},\nThis is value: {j}")