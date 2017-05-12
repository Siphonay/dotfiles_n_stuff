#!/usr/bin/env ruby

if ARGV[0] && ARGV[0] == "-c"
  odds = 98
else
  odds = 88
end

(0..39).each do |i|
  puts randn = rand(100)
  if randn > odds
    abort "Even tough you did everything right, your chain broke at #{i}."
  end
end

puts "You successfully reached a 40 chain."
exit 0
