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

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

def my_min_v2(arr)
    current_min = arr[0]
    (1...arr.length).each do |idx|
        current_min = arr[idx] if arr[idx] < current_min
    end
    current_min
end
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_v2(list)