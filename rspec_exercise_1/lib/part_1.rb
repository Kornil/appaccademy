
def average(num1, num2)
  (num1 + num2) / 2.0
end

def average_array(arr)
  result = 0
  arr.each { |el| result += el }
  result / arr.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(str)
  arr = str.split(" ")
  arr.each_with_index do |el, i|
    if i % 2 == 0
      arr[i] = el.upcase
    else
      arr[i] = el.downcase
    end
  end
  return arr.join(" ")
end
