# frozen_string_literal: true

module Enumerable
  # my_each method
  def my_each
    i = 0
    until i == length
      yield (self[i])
      i += 1
    end
  end

  # my_each_with_index method
  def my_each_with_index
    i = 0
    until i == length
      yield(self[i], i)
      i += 1
    end
  end

  # my_count method
  def my_count
    cnt = 0
    my_each do |ele|
      if block_given?
        cnt += 1 if yield(ele) != false
      else
        cnt += 1
      end
    end
    cnt
  end

  # my_select method
  def my_select
    res = [] if instance_of? Array
    res = {} if instance_of? Hash

    my_each do |item|
      res.push(item) if yield(item) != false
    end
    res
  end

  # my_all? method
  def my_all?
    all = true
    my_each do |x|
      all = false unless yield(x)
    end
    all
  end

  # my_any? method
  def my_any?
    any = false
    my_each do |x|
      any = true if yield(x)
    end
    any
  end

  # my_none? method
  def my_none?
    none = false
    my_select do |x|
      none = true unless yield(x)
    end
    none
  end

  # my_map method
  def my_map(proc = nil)
    result = []
    if proc
      my_each do |elem|
        result.push(proc.call(elem))
      end
    else
      my_each do |elem|
        result.push(yield(elem))
      end
    end
    result
  end

  # my_inject method
  def my_inject(*arg)
    init = !arg.empty?
    store = init ? arg[0] : self[0]
    drop(init ? 0 : 1).my_each do |num|
      store = yield(store, num)
    end
    store
  end
end

def multiply_els(args)
  include Enumerable
  args.my_inject do |acc, num|
    acc * num
  end
end

arr = [4, 9, 2, 9, 56, 4, 0]

puts multiply_els([2, 4, 5])
# arr = ['girl','boy','girl','girl']
# arr.my_each{ |ele| puts ele }
# arr.my_each_with_index { |ele, i| puts i }
# puts arr.my_select{ |ele| puts ele  > 4}
# arr.my_all?{ |ele| puts ele  > 4}
# arr.my_all? { |a| a >= 3 }
# puts arr.my_none?{|a| a.nil? }
# puts arr.none?{|a| a.nil? }
# puts arr.none?
# puts %w{ant bear cat}.none? { |word| word.length == 5 }
# puts %w{ant bear cat}.none? { |word| word.length >= 4 } #=> false
# puts arr.my_count
# puts arr.my_any? { |ele| puts ele == 2 }
# puts arr.any? { |ele| puts ele == 2 }
# puts arr.my_inject{ |sum,num| sum+num}
