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

# time complexity O(n^3)
def largest_contiguous_sub_sum(arr)
  subarrs = []                        #O(1)

  (0...arr.length).each do |idx|      #O(n)
    (idx...arr.length).each do |jdx|  #O(n/2)
      subarrs << arr[idx..jdx]        #O(n)
    end
  end          

  subarrs.map! do |array|             #O(n)
    array.reduce(:+)                  #O(n)
  end   

  subarrs.max                         #O(n)
end 

def largest_contiguous_sub_sum2(arr)

  sum = arr.first

  (1...arr.length).each do |idx|
    if sum < 0 && arr[idx] > sum
      sum = arr[idx]
    else 
      sum += arr[idx] if arr[idx] > 0
    end
  end 
  sum
end

def largest_contiguous_sub_sum3(arr)

  stored_sum = arr[0]

  (1...arr.length).each do |idx|
    next if stored sum + ele < stored sum 
    if ele > stored sum it yes stored sum = ele 
    temp = stored_sum + arr[idx]
    next if arr[idx] < temp > stored_sum 
      stored_sum = temp
    else
      stored_sum = arr[idx]
    end 
  end 
  stored_sum
end 

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
p largest_contiguous_sub_sum3(list1)
p largest_contiguous_sub_sum3(list2)
p largest_contiguous_sub_sum3(list3)
