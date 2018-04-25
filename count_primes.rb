# Count the number of prime numbers less than a non-negative number, n.

# Example: if n = 2, return 0, if n = 3, return 1, if n = 4, return 2, if n = 5, return 2

# Works for n < 400,000
$prime_num_cache = {2 => true}

def count_primes(n)
    return 0 if n <= 2 

    # initialize prime_count
    prime_count = 1
    
    # iterate range (2...n), check each value if it's a prime number. If true, then increase counter
    (3...n).each do |num|
        next if num % 2 == 0
        if $prime_num_cache[num]
            prime_count += 1 
        else
            prime_count += 1 if is_prime?(num)
        end 
    end 

    prime_count
end 

def is_prime?(n)
    return true if n == 2
    # odd_nums = (3...n).select { |el| el % 2 != 0 }
    (3...n).each do |divisor|
        return false if n % divisor == 0
    end 

    # store prime in global cache, which can then be referred to in primary fcn
    $prime_num_cache[n] = true
    true
end 


# p count_primes(499979) # very slow with above implementation
# p count_primes(10000) == 1229
# p count_primes(5) == 2
# p count_primes(2) == 0
# p count_primes(3) == 1
# p count_primes(4) == 2


# Sieve of Eratosthenes algorithm is one of the most efficient algorithms to find all primes less than n, when n is smaller than 10 million.
# https://www.geeksforgeeks.org/sieve-of-eratosthenes/
def count_primes_efficient(n)
   return 0 if n <= 2

    # create boolean array of length n 
    bool_arr = Array.new(n, true)
    idx = 2

    # iterate bool_arr with index. Begin at 2, change el = false if idx is multiple of 2. 
    # But why idx^2??? Because idx * idx is the largest factor of n. For example, if n = 100, the largest factor is 10. This means that all values less than 10 are possible factors of 10. For each of those indices <= 10, you want to increment bool_arr by each indices <= 10. Understand this prevents the need to iterate from (2...n) in a for loop, significantly optimizing runtime.
    while idx * idx <= n
        # first check the following: next if el == false, which means it's been visited
        if bool_arr[idx] == false 
            idx += 1
            next 
        end 
        # otherwise, continue at 3. at indices that are multiple of 3, change el == false. Iterate process until you reach end of bool_arr
        (idx * 2...n).step(idx) do |idx2|
            next if bool_arr[idx2] == false 

            bool_arr[idx2] = false 
        end 

        idx += 1
    end 

    primes_arr = bool_arr[2..-1].select { |el| el == true }
    primes_arr.length 
end 

p count_primes_efficient(1500000) == 114155
p count_primes_efficient(999983) == 78497
p count_primes_efficient(499979) == 41537
p count_primes_efficient(10000) == 1229
p count_primes_efficient(5) == 2
p count_primes_efficient(13) == 5
p count_primes_efficient(17) == 6
p count_primes_efficient(2) == 0
p count_primes_efficient(3) == 1
p count_primes_efficient(4) == 2