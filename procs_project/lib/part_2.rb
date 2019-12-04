# frozen_string_literal: true

def reverser(str, &proc)
  new_str = str.reverse
  proc.call(new_str)
end

def word_changer(str, &proc)
  result = str.split(' ').map { |el| proc.call(el) }
  result.join(' ')
end

def greater_proc_value(num, proc1, proc2)
  proc1.call(num) > proc2.call(num) ? proc1.call(num) : proc2.call(num)
end

def and_selector(arr, proc1, proc2)
  arr.select { |el| proc1.call(el) } & arr.select { |el| proc2.call(el) }
end

def alternating_mapper(arr, proc1, proc2)
  arr.map.with_index { |el, i| i.even? ? proc1.call(el) : proc2.call(el) }
end
