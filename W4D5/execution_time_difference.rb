# my_min
# Given a list of integers find the smallest number in the list.

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# Phase I
# First, write a function that compares each element to every other element of the list. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

# O(n^2)

# def my_min(arr)

#     smallest = arr[0]
#     (0...arr.length).each do |i|
#         (i...arr.length).each do |j|
#             if arr[j] < smallest
#                 smallest = arr[j]
#             end
#         end
#     end

#     smallest
# end

# def my_min(arr)

#     (0...arr.length-1).each do |i|
#         other = arr[0...i] + arr[i+1..-1]
#         return arr[i] if other.all? {|ele| ele > arr[i]}
#     end
# end

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. 
# What is the time complexity?

# O(n)

# def my_min(arr)
#     smallest = arr[0]
#     (0...arr.length).each do |i|
#         if arr[i] < smallest
#             smallest = arr[i]
#         end
#     end

#     smallest
# end



# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ]) # => -5

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

#   list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

# list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

    # list = [-5, -1, -3]
    # largest_contiguous_subsum(list) # => -1 (from [-1])


# Phase I
# Write a function that iterates through the array and 
# finds all sub-arrays using nested loops. 
# First make an array to hold all sub-arrays. 
# Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution.

# o(n^3)

# def largest_contiguous_subsum(list)
#     subs = []

#     (0...list.length).each do |i|
#         (i...list.length).each do |j|
#             if i <= j
#                 subs << list[i..j].sum
#             end
#         end
#     end

#     subs.sort[-1] 
# end

# Phase II
# Let's make a better version. 
# Write a new function using O(n) time with O(1) memory. 
# Keep a running tally of the largest sum. To accomplish this efficient space complexity, 
# consider using two variables. 
# One variable should track the largest sum 
# so far and another to track the current sum. We'll leave the rest to you.

# o(n), time
# o(1), memory 


# def largest_contiguous_subsum(list)

#     list.each_with_index do |ele, i|
        
#     end
# end

# cur_sum
# lar_sum


# def largest_contiguous_subsum(list)
#     lar_sum = list[0]

#     i = 0
#     j = 0

#     while i < list.length
#         cur_sum = list[i..j].sum

#         if j < list.length
#             j += 1
            
#             if cur_sum > lar_sum
#                 lar_sum = cur_sum
#             end     
#         else
#             i += 1
#             j = i
#         end

#     end
#     lar_sum
# end

# curr_sum = 0
# largest = 

# arr.each do |i|
    
# end


# def largest_contiguous_subsum(arr)
#   largest = arr.first
#   current = arr.first

#   (1...arr.length).each do |i|
#     current = 0 if current < 0
#     current += arr[i]
#     largest = current if current > largest
#   end

#   largest
# end

# -5, -1, -3

# :ls -5, -1 
# :cs -5, 0, -1, 0, -3
    



def largest_contiguous_subsum(arr)
  return 0 if arr.length == 0
  opt = [arr.first]
  res = arr.first
  (1...arr.length).each do |i|
    opt[i] = [opt[i-1], 0].max + arr[i]
    res = [res, opt[i]].max
  end
  res
end





# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])




    

# Write a method #first_anagram? that will generate and store all the 
# possible anagrams of the first string. Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?


def anagram?(str1,str2)
    pos_anagram = str1.split("").permutation.to_a
    pos_anagram.include?(str2.split(""))
end



# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true


def my_subset(arr)
  res = []
  sub = [[arr.first]]
  (1...arr.length).each do |i|
    sub.each do |ele|
      ele << arr[i]
    end
  end
  sub
end


p my_subset([5, 3, -7])