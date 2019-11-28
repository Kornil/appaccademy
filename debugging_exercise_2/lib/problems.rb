# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(num)
  return false if num < 2

  (2...num - 1).each do |factor|
      if num % factor == 0
          return false
      end
  end
  return true
end

def largest_prime_factor(num)
  return num if num < 3
  i = 3
  result = 0
  while i <= num
    if (num % i == 0) && prime?(i)
      result = i
    end
    i += 1
  end
  result
end

def unique_chars?(str)
  hash = Hash.new(0)
  str.each_char do |el|
    hash[el] += 1
    return false if hash[el] > 1
  end
  return true
end

def dupe_indices(arr)
  hash = Hash.new
  arr.each_with_index do |el, i|
    hash[el] ||= []
    hash[el] << i
  end
  return hash.select { |key, value| value.length > 1 }
end

def ana_array(arr1, arr2)
  arr1.each do |el|
    return false if !arr2.include?(el)
  end
  arr2.each do |el|
    return false if !arr1.include?(el)
  end
  return true
end

ana_array(["cat", "dog", "cat"], ["dog", "cat", "mouse"])