require 'benchmark'
require 'pry'
require 'set'

module Q19
  module_function

  @ary = []

  def prime?(num) #素数
    sqrt_num = Math.sqrt(num).floor
    2.upto(sqrt_num){|i|
      if num % i == 0
        return false
      end
    }
    return true
  end

  def make_composite_number_array(n) #素数でない数の配列をつくる
    (2..n).each {|i|
      unless prime?(i)
        @ary.push(i)
      end
    }
  end



  def coprime(a, b)
    a.gcd(b) == 1
  end

  def run
    i = 2
    while true do
      make_composite_number_array(i)
      @ary.permutation(6) { |ary|
        friends = ary.each_cons(2).select{|x, y| coprime(x, y) }
      if friends.count == 6
        puts i
        break
      end
      i += 1
    end
  end

Benchmark.bm do |x|
  x.report do
    $answer = Q19.run
  end
end

puts
puts "answer : #{$answer}"
