# Check if the Integer is a palindrome without converting into a string.
# 12345 returns false 
# 12321 returns true
# Assume num >= 0
def is_palindrome?(num)
    return true if num < 10
    
    # initialize variables 
    arr = []

    # figure out how to store each integer in num into an array.
    while num % 10 > 0
        arr.push(num % 10)
        num = num / 10
    end 

    # from there, we'll get something like this: [1, 2, 3, 2, 1]. Compare popped and shifted values 
    while arr.length > 1
        return false if arr.pop != arr.shift
    end 
    
    true 
end 

p is_palindrome?(12345) == false
p is_palindrome?(12321) == true
p is_palindrome?(123321) == true