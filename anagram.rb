require  "byebug"
def first_anagram?(string1, string2)
  #debugger
  character_array = string1.split("")       #O(n)
  perms = character_array.permutation.to_a  #O(n!)
  anagrams = perms.map(&:join)              #O(n)

  anagrams.include?(string2)                #(n)

end

# puts first_anagram?("gizmo", "sally")    #=> false
# puts first_anagram?("elvis", "lives")    #=> true

def second_anagram?(string1, string2) #IO(n^2)
  string2 = string2.chars      #O(n)

  string1.each_char do |char|  #O(n)
    index = string2.find_index(char) #O(n)
    unless index.nil? #O(1)
      string2.delete_at(index) #O(1)
    else
      return false #O(1)
    end
  end

  string2.empty? #O(1)
end

# puts second_anagram?("gizmo", "sally")    #=> false
# puts second_anagram?("elvis", "lives")    #=> true

def third_anagram?(string1, string2)

  string1.chars.sort.join == string2.chars.sort.join #O(n^2)
end

# puts third_anagram?("gizmo", "sally")    #=> false
# puts third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(string1, string2)
  count = Hash.new(0)

  string1.each_char do |char| #O(n)
    count[char] += 1
  end 

  string2.each_char do |char2| #O(n)
    count[char2] -= 1
  end 

  count.values.all? { |value| value == 0 } #O(n)
end

puts fourth_anagram?("gizmo", "sally")    #=> false
puts fourth_anagram?("elvis", "lives")    #=> true