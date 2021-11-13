require_relative './mastermind'

include Mastermind

def jank_it(janktime)
  jank = []
  possible_codes = %w[1 2 3 4 5 6].repeated_permutation(4).to_a.map(&:join)
  possible_codes.each do |code|
    jank.push(Mastermind::Game.new.start_game(code) + 1)
    # print jank[-1]
    if jank.size % 10 == 0
      # require 'pry'
      # binding.pry
      system('clear')
      print "#{(((jank.size)*100 / possible_codes.size).to_f).to_i}%"
      print "\n#{janktime}%"
    end
    # sleep(2)
  end
  # system('clear')
  # print "100%"
  # puts "\n\nAverage: #{(jank.sum / jank.size.to_f)}"
  (jank.sum / jank.size.to_f)
end

def jank_squared
  jankjank = []
  janktime = 0
  do_times = 0
  do_times.times do |i|
    jankjank.push(jank_it(janktime))
    # system('clear')
    janktime = (((jankjank.size)*100 / do_times).to_f).to_i
  end
  system('clear')
  print "100%"
  puts "\n\nAverage: #{(jankjank.sum / jankjank.size.to_f)}"
end

jank_squared