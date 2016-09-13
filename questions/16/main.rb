max = 500
n = 4
a = 1
c = 1
count = 0
while n < max do
  while a c < n / 2 do
    if (a * n - 2 * a ** 2) + (a * n - 2 * a ** 2) == (n ** 2) / 8
      count += 1
    end
      a += 1
      c += 1
  end
  n += 1
end

puts count

# # MAX = 500
# #
# # answer = []
# # (1..MAX/4).each {|c|
# #   edge = (1..(c-1)).to_a.map{|tate| tate * (2 * c - tate)}
# #   edge.combination(2){|a, b|
# #     if a + b == c * c then
# #       answer.push([1, b / a.to_f, c * c / a.to_f])
# #     end
# #   }
# # }
# # answer.uniq!
# # puts answer.size
#
# MAX = 500
#
# cnt = 0
# (1..MAX/4).each{|c|
#   (1..(c-1)).to_a.combination(2){|a, b|
#     if a * a + b * b == c * c then
#       cnt += 1 if a.gcd(b) == 1
#     end
#   }
# }
#
# puts cnt
