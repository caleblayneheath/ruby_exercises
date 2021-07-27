class GuessingGame
  NUMBER_OF_GUESSES = 7

  RANGE = (1..100)

  def initialize
    @player = Player.new
    @number = nil
  end

  def play
    reset
    while player.guesses?
      player.choose
      evaluate_choice
      break if player_correct?
    end
    display_result
  end

  private

  attr_reader :player, :number

  def reset
    set_number
    player.reset
  end

  def set_number
    @number = rand(RANGE)
  end

  def evaluate_choice
    message = if player_low?
                'Your guess is too low.'
              elsif player_high?
                'Your guess is too high.'
              elsif player_correct?
                'That\'s the number!'
              end
    puts message
    puts
  end

  def player_low?
    player.current_guess < number
  end

  def player_high?
    player.current_guess > number
  end

  def player_correct?
    player.current_guess == number
  end

  def display_result
    puts player_correct? ? 'You won!' : 'You have no more guesses. You lost!'
  end
end

class Player
  attr_reader :current_guess, :guesses_left

  def initialize
    reset
  end

  def reset
    @guesses_left = GuessingGame::NUMBER_OF_GUESSES
    @current_guess = nil
  end

  def guesses?
    guesses_left > 0
  end

  def choose
    input = nil
    loop do
      puts "Guesses remaining: #{guesses_left}"
      puts "Enter a number between #{GuessingGame::RANGE.first} and #{GuessingGame::RANGE.last}: "
      input = gets.chomp.to_i
      break if GuessingGame::RANGE.cover?(input)
      puts 'Invalid guess.'
      puts
    end
    @current_guess = input
    @guesses_left -= 1
  end
end

game = GuessingGame.new
game.play
game.play

