require "Time"
# time complexity O(n^2)
# since there are 2 loops we expect at least n^2

def my_min1(arr)
  arr.each do |el1|                  #O(n)
    if arr.all? {|el2| el1 <= el2 }  #O(n + 1)
      return el1
    end
  end 
end

# time complexity O(n)
def my_min2(arr)
  min = arr.first                    #O(1)
  (1...arr.length).each do |idx|     #O(n)
    min = arr[idx] if arr[idx] < min #O(1 + 1)
  end
  min                                #O(1)
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# start_time = Time.now
# p my_min2(list)  # =>  -5
# puts (Time.now - start_time)

# time complexity O()
def largest_contiguous_sub_sum(arr)
  subarrs = []                        #O(1)

  (0...arr.length).each do |idx|      #O(n)
    (idx...arr.length).each do |jdx|  #O(logn)
      subarrs << arr[idx..jdx]        #O(n)
    end
  end          

  subarrs.map! do |array|             #O(n)
    array.reduce(:+)                  #O(n)
  end   

  subarrs.max                         #O(n)
end 

list = [5, 3, -7]
p largest_contiguous_sub_sum(list)
