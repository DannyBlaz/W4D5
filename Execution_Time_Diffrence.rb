def my_min(arr)
    arr.each_with_index do |ele1, i1|
        minimum = true
        arr.each_with_index do |ele2, i2|
            next if i1 == i2
            minimum = false if ele2 < ele1
        end
        return ele1 if minimum
    end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def my_min_v2(arr)
    current_min = arr[0]
    (1...arr.length).each do |idx|
        current_min = arr[idx] if arr[idx] < current_min
    end
    current_min
end
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_v2(list)

# Largest Contiguous Sub-sum

def largest_contiguous_subsum(arr)
    new_arr = []
    arr.each_with_index do |ele1, idx1|

        arr.each_with_index do |ele2, idx2|

            if idx1 <= idx2
                new_arr << arr[idx1..idx2]
            end
        end

    end
    current_max = new_arr[0].sum
    new_arr.each do |sub|
        current_max = sub.sum if sub.sum > current_max
    end
    current_max

end

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) #=> 8

# list2 = [-5, -1, -3]
# p largest_contiguous_subsum(list2) # => -1 (from [-1])


def largest_contiguous_subsum_v2(arr)
    current_sum = arr[0]
    largest_sum = arr[0]
    (1...arr.length).each do |idx|
          if arr[idx] + current_sum < 0
            largest_sum = 0
            next
          else
            largest_sum += current_sum + arr[idx]
        end
    end
    largest_sum
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_v2(list) #=> 8

list2 = [-5, -1, -3]
p largest_contiguous_subsum_v2(list2) # => -1 (from [-1])