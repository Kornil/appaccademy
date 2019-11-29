
def all_words_capitalized?(arr)
  arr.all? { |el| el == el.downcase.capitalize }
end

def no_valid_url?(arr)
  subs = ['.com', '.net', '.io', '.org']
  arr.none? { |el| !subs.none? { |s| el.include?(s) } }
end

def any_passing_students?(arr)
  arr.any? { |hash| hash[:grades].reduce(0, :+) / hash[:grades].length >= 75 }
end