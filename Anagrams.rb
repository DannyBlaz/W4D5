def first_anagram?(str1, str2)
    anagrams = all_anagrams(str1)
    anagrams.include?(str2)
end

def all_anagrams(str)
    return [str] if str.length < 2
    first_char = str[0]
    remaining_char = str[1..-1] # o(n)
    anagrams = all_anagrams(remaining_char)
    new_anagrams = []
    anagrams.each do |word| #o(n)
        (0...remaining_char.length).each do |idx| #o(n)
            new_anagrams << word[0...idx] + first_char + word[idx..-1] #o(n)
        end
    end
    new_anagrams
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str1.each_char do |char| #o(n)
        return false if !str2.include?(char) #o(n)
        str2[str2.index(char)] = '' #o(n)
    end
    str2.empty?
end 

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
    is_sorted(str1) == is_sorted(str2)   
end

def is_sorted(string)
    alphabet = ('a'..'z').to_a
    sorted = false
    until sorted #o(n)
        sorted = true
        (0...string.length-1).each do |idx| #o(n)
            if alphabet.index(string[idx]) > alphabet.index(string[idx + 1]) # o(2n)
                string[idx], string[idx + 1] = string[idx+1], string[idx]
                sorted = false
            end
        end
    end
    string
end

#  p second_anagram?("gizmo", "sally")    #=> false
#  p second_anagram?("elvis", "lives")    #=> true


def fourth_anagram?(str1, str2)
    new_hash = Hash.new(0)
    str1.each_char { |char| new_hash[char] += 1 } #o(n)
    str2.each_char { |char| new_hash[char] -= 1 } #o(n)
    new_hash.values.all? { |val| val == 0 } #o(2n)
end
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
