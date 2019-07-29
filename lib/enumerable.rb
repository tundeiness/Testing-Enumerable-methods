# frozen_string_literal: true

module Enumerable
  # my_each method
  def my_each
      i = 0
      until i == self.length
        yield (self[i])
        i += 1
      end
  end

  # my_each_with_index method
  def my_each_with_index
    i = 0
    until i == self.length
      yield(self[i], i)
      i += 1
    end
  end

  # my_count method
  def my_count
    cnt = 0
    self.my_each{|ele|

      if block_given?
        cnt+=1 if yield(ele) != false
      else
        cnt+=1
      end
    }
     cnt
  end

  # my_select method
  def my_select
    res = [] if self.instance_of? Array
    res = {} if self.instance_of? Hash

    self.my_each {|item|
      res.push(item) if yield(item) != false
    }
    res
  end


  # my_all? method
  def my_all?
    all = true
    self.my_each{|x|
      all = false if !yield(x)
    }
     all
  end


  # my_any? method
  def my_any?
    any = false
    self.my_each{|x|
      any = true if yield(x)
    }
     any
  end

  # my_none? method
  def my_none?
    none = false
    self.my_select{|x|
      none = true if !yield(x)
    }
    none
  end

  # my_map method
  def my_map(proc = nil)
    result = []
    if proc
      self.my_each{ |elem|
        result.push(proc.call(elem))
      }
    else
      self.my_each{ |elem|
        result.push(yield(elem))
      }
    end
    result
  end

  # my_inject method
  def my_inject(*arg)
    init = arg.length > 0
    store = init ? arg[0] : self[0]
    self.drop(init ? 0 : 1).my_each{ |num|
      store = yield(store, num)
    }
    store
  end


end

def multiply_els(args)
include Enumerable
args.my_inject{ |acc, num|
acc * num
}
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
