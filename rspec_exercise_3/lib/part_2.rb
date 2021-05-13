require 'byebug'

def element_count(array)
    count = Hash.new(0)
    array.each { |ele| count[ele] += 1 }
    count
end

def char_replace!(str, hash)
    # debugger
    str.each_char.with_index { |char, idx| hash[char] == nil ? char : str[idx] = hash[char] }
end

def product_inject(array)
    array.inject(:*)
end