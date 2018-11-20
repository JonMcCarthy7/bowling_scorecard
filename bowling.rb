class Bowling
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    roll_index = 0
    10.times do
      if strike? roll_index
        result += strike_score roll_index.to_i
        roll_index += 1
      elsif spare? roll_index
        result += spare_score roll_index.to_i
        roll_index += 2
      else
        result += frame_score roll_index.to_i
        roll_index += 2
      end
    end
    result
  end

  def strike?(roll_index)
    @rolls[roll_index] == 10
  end

  def strike_score(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1].to_i + @rolls[roll_index + 2].to_i
  end

  def spare?(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i == 10
  end

  def spare_score(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i + @rolls[roll_index + 2].to_i
  end

  def frame_score(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i
  end
end

game = Bowling.new

puts 'Hello, Enter Each score as a number. If finised type (exit)'
input = ''

until input == 'exit'
  input = gets.chomp
  break if input == 'exit'
  game.roll(input.to_i)
  puts "You Entered: #{input.to_i}."
end

puts "You scored a #{game.score}"
