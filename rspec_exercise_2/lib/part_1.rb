
def partition(arr, num)
  result = [[], []]
  arr.each do |el|
    if el < num
      result[0] << el
    else
      result[1] << el
    end
  end
  return result
end

def merge(hash1, hash2)
  result = {}
  hash1.each do |key, value|
    result[key] = value
  end
  hash2.each do |key, value|
    result[key] = value
  end
  return result
end

def censorstr(str)
  vowels = "aeiouAEIOU"
  str.each_char.with_index { |el, i| str[i] = "*" if vowels.include?(el) }
  str
end

def censor(str, arr)
  result = str.split(" ")
  result.each_with_index do |el, i|
    if arr.include?(el.downcase)
      result[i] = censorstr(result[i])
    end
  end
  return result.join(" ")
end

def power_of_two?(num)
  (0..num).count do |el|
    if 2**el == num
      return true
    end
  end
  return false
end