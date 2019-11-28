
def hipsterfy(str)
  vowels = "aeiou"
  int = -1
  str.each_char.with_index do |el, i|
    if vowels.include?(el)
      int = i
    end
  end
  if (int != -1)
    str[int] = ""
  end
  return str
end

def vowel_counts(str)
  result = Hash.new(0)
  vowels = "aeiou"
  str.each_char do |el|
    el = el.downcase
    if vowels.include?(el)
      result[el] += 1
    end
  end
  return result
end

def caesar_cipher(str, n)
  lower = 97
  upper = 123
  return str if n % 26 == 0
  res = ""
  str.split('').map do |c|
    if c.ord > upper || c.ord < lower
      res += c
    else
      c = c.ord
      if c + n >= upper
        p c.chr
        res += (lower + (c + n) % upper).chr
      else
        res += (c + n).chr
      end
    end
  end
  res
end
