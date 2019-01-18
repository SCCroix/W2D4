require  "byebug"
def first_anagram?(string1, string2)
  #debugger
  character_array = string1.split("")       #O(n)
  perms = character_array.permutation.to_a  #O(n!)
  anagrams = perms.map(&:join)              #O(n)

  anagrams.include?(string2)                #(n)

end

puts first_anagram?("gizmo", "sally")    #=> false
puts first_anagram?("elvis", "lives")    #=> true

def second_anagram?(string1, string2)
  
end

puts second_anagram?("gizmo", "sally")    #=> false
puts second_anagram?("elvis", "lives")    #=> true