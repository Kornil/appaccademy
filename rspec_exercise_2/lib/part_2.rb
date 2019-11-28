
def palindrome?(str)
  result = ""
  (0..str.length - 1).reverse_each do |i|
    result += str[i]
  end
  return true if result == str
  return false
end

def substrings(str)
  result = []
  str.each_char.with_index do |el, i|
    (i..str.length - 1).each do |num|
      result << str.slice(i..num)
    end
  end
  return result
end

def palindrome_substrings(str)
  result = []
  subs = substrings(str)
  subs.each { |el| result << el if el.length > 1 && palindrome?(el) }
  return result
end
