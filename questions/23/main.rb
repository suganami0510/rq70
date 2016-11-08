require 'benchmark'
require 'pry'

module Q23
  module_function
  START = 10
  GAMES = 24

  @coins = START

  @memo = {[coins, games] => 0}

  def count_patterns(coins, games)
    return @memo[[coins, games]] if @memo.has_key?([coins, games])

    if games == 0
      @memo[[coins, games]] += 1
    elsif coins == 0
      @memo[[coins, games]] += 0
    else
      count_patterns(coins + 1, games - 1)
      count_patterns(coins - 1, games - 1)
    end
  end

  def run
    count_patterns(@coins, GAMES)
    puts @memo[[@coins, GAMES]]
  end
end

# module Q23
#   module_function
#   @memo = {}
#
#   def game(coin, depth)
#     return @memo[[coin, depth]] if @memo.has_key?([coin, depth])
#     return 0 if coin == 0
#     return 1 if depth == 0
#
#     win = game(coin + 1, depth - 1) #勝ち
#     lose = game(coin -1, depth -1) #負け
#     binding.pry
#     @memo[[coin, depth]] = win + lose
#   end
#
#   def run
#     game(10, 24)
#   end
# end



Benchmark.bm do |x|
  x.report do
    $answer = Q23.run
  end
end

puts
puts "answer : #{$answer}"
