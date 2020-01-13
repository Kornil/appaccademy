# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    length.zero? ? nil : max - min
  end

  def average
    length.zero? ? nil : reduce(:+) / length.to_f
  end

  def median
    return nil if length.zero?

    length.odd? ? sort[length / 2] : (sort[length / 2] + sort[(length / 2) - 1]) / 2.0
  end

  def counts
    res = Hash.new(0)
    map { |el| res[el] += 1 }
    res
  end

  def my_count(param)
    res = self.counts
    res[param]
  end

  def my_index(param)
    find_index(param)
  end

  def my_uniq
    self & self
  end

  def my_transpose
    self[0].zip(*self[1..-1])
  end
end
