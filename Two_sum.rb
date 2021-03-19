require "byebug"
def two_sum_v1?(arr, target)

    arr.each_with_index do |ele1, idx1| #o(n)
        arr.each_with_index do |ele2, idx2| #o(n)
            if idx1 < idx2
                return true if ele1 + ele2 == target 
            end
        end
    end
    false
end

arr = [0, 1, 5, 7]



def two_sum_v2?(arr,target) # linearithmic 
sorted = quick_sort(arr) #o(nlogn)
    sorted.each_with_index do |ele, idx| #o(n)
        # debugger
        search_value = target - ele
        search_index = bsearch(sorted, search_value) # o(logn)
        return true if (idx != search_index && search_index != nil)
    end  
false
end

def quick_sort(arr) # linearthmic
    return arr if arr.length <= 1
    pivot = arr.first
    left_side = arr[1..-1].select {|num| num < pivot}
    right_side = arr[1..-1].select {|num| num >= pivot}
    quick_sort(left_side) + [pivot] + quick_sort(right_side)
end

def bsearch(arr, target) #logarithmic
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

# p two_sum_v2?(arr, 6) # => should be true
# p two_sum_v2?(arr, 11) # => should be false


def two_sum_v3?(arr, target) 
    hash = Hash.new
    arr.each { |ele| hash[ele] = ele } #o(n)
    arr.each do |ele| #o(n)
        search_value = target - ele
        return true if !hash[search_value].nil? && hash[search_value] != ele
    end
    false
end

p two_sum_v3?(arr, 6) # => should be true
p two_sum_v3?(arr, 10) # => should be false