def first_anagram?(str1, str2)
    anagrams = all_anagrams(str1)
    anagrams.include?(str2)
end

def all_anagrams(str)
    return [str] if str.length < 2
    first_char = str[0]
    remaining_char = str[1..-1]
    anagrams = all_anagrams(remaining_char)
    new_anagrams = []
    anagrams.each do |word|
        (0...remaining_char.length).each do |idx|
            new_anagrams << word[0...idx] + first_char + word[idx..-1]
        end
    end
    new_anagrams
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str1.each_char do |char|
        return false if !str2.include?(char)
        str2[str2.index(char)] = ''
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
    until sorted
        sorted = true
        (0...string.length-1).each do |idx|
            if alphabet.index(string[idx]) > alphabet.index(string[idx + 1])
                string[idx], string[idx + 1] = string[idx+1], string[idx]
                sorted = false
            end
        end
    end
    string
end

 p second_anagram?("gizmo", "sally")    #=> false
 p second_anagram?("elvis", "lives")    #=> true