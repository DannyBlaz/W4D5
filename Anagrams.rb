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