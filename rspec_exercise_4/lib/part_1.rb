def my_reject(array, &prc)
    array.select { |ele| !prc.call(ele) }
end

def my_one?(array, &prc)
    count = 0
    array.each { |ele| count += 1 if prc.call(ele) }
    count == 1
end

def hash_select(hash, &prc)
    # hash.each { |key, value| hash.tap { |h| h.delete(key) } if !prc.call(key, value) }
    
    # hash.each { |key, value| hash.delete(key) if !prc.call(key, value) }

    hash.delete_if { |key, value| !prc.call(key, value) }
end

def xor_select(array, prc1, prc2)
    array.select do |ele|
        (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))
    end
end

def proc_count(num, array)
    array.count { |prc| prc.call(num) }
end