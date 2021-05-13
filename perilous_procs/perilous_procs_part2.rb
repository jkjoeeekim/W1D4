def xnor_select(array, prc1, prc2)
    array.select { |ele| (prc1.call(ele) && prc2.call(ele)) || (!prc1.call(ele) && !prc2.call(ele))}
end

# is_even = Proc.new { |n| n % 2 == 0 }
# is_odd = Proc.new { |n| n % 2 != 0 }
# is_positive = Proc.new { |n| n > 0 }
# p xnor_select([8, 3, -4, -5], is_even, is_positive)         == [8, -5]
# p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  == [-7, -13, 12]
# p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   == [5, -10]

def filter_out!(array, &prc)
    array.select! { |ele| !prc.call(ele) }
end

# # Solve this without using Array#reject!
# arr_1 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_1) { |x| x.odd? }
# p arr_1     == [10, 6, 2]

# arr_2 = [1, 7, 3, 5 ]
# filter_out!(arr_2) { |x| x.odd? }
# p arr_2     == []

# arr_3 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_3) { |x| x.even? }
# p arr_3     == [3, 5]

# arr_4 = [1, 7, 3, 5 ]
# filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
# p arr_4 == [1, 7, 3, 5]


def multi_map(array, n=1, &prc)
    n.times { |i| array.map! { |ele| prc.call(ele) } }
    array
end

# p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      == ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   == ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   == ["pretty!!!", "cool!!!", "huh?!!!"]
# p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             == [40, 30, 20, 70]
# p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             == [400, 300, 200, 700]
# p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             == [40000, 30000, 20000, 70000]


def proctition(array, &prc)
    true_array = Array.new
    false_array = Array.new
    array.each { |ele| prc.call(ele) ? true_array << ele : false_array << ele }
    true_array.concat(false_array)
end

# p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }                 == [4, 7, 1, 3, -5, -10, -2]

# p proctition([7, 8, 3, 6, 10]) { |el| el.even? }                        == [8, 6, 10, 7, 3]

# p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }  == ["boot", "bug", "boat", "cat", "dog"]