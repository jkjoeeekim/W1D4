def is_prime?(num)
    return false if num < 2

    (2...num).none? { |divisor| num % divisor == 0 }
end

def nth_prime(num)
    primes = []
    i = 2
    until primes.length == num
        primes << i if is_prime?(i)
        i += 1
    end
    primes.last
end

def prime_range(min, max)
    (min..max).to_a.select { |num| is_prime?(num) }
end