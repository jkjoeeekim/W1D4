def proper_factors(num)
    (1...num).to_a.select { |int| num % int == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(num)
    ideal_nums = []
    n = 6

    until ideal_nums.length == num
        ideal_nums << n if perfect_number?(n)
        n += 1
    end

    ideal_nums
end