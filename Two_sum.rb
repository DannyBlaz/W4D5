require "byebug"
def two_sum_v1?(arr, target)

    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            if idx1 < idx2
                return true if ele1 + ele2 == target
            end
        end
    end
    false
end

arr = [0, 1, 5, 7]



def two_sum_v2?(arr,target)
sorted = quick_sort(arr)
    sorted.each_with_index do |ele, idx|
        # debugger
        search_value = target - ele
        search_index = bsearch(sorted, search_value)
        return true if (idx != search_index && search_index != nil)
    end  
false
end

def quick_sort(arr)
    return arr if arr.length <= 1
    pivot = arr.first
    left_side = arr[1..-1].select {|num| num < pivot}
    right_side = arr[1..-1].select {|num| num >= pivot}
    quick_sort(left_side) + [pivot] + quick_sort(right_side)
end

def bsearch(arr, target)
    mid = arr.length / 2
    case target <=> arr[mid]
    when -1
        return bsearch(arr[0...mid],target)
    when 0
        return mid
    when 1
        answer = bsearch(arr[mid+1..-1], target)
        # if answer.nil?
        #     return nil
        # else
        #     return answer + 1 + mid
        # end
        return answer + mid + 1 unless answer.nil?
    end
    nil
end

# arr = [1,2,3,4,5,6,7,8,9]
# p bsearch(arr, 6)

p two_sum_v2?(arr, 6) # => should be true
p two_sum_v2?(arr, 11) # => should be false