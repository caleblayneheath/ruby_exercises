class GuessingGame
  def initialize(low: 1, high: 100)
    @range = low..high
    @number = nil
    @current_guess = nil
    @guesses_left = nil
  end

  def play
    reset
    while guesses?
      choose
      evaluate_choice
      break if player_correct?
    end
    display_result
  end

  private

  attr_reader :number, :range, :current_guess, :guesses_left

  def reset
    set_number
    @guesses_left = Math.log2(range.size).to_i + 1
    @current_guess = nil
  end

  def set_number
    @number = rand(range)
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
    current_guess < number
  end

  def player_high?
    current_guess > number
  end

  def player_correct?
    current_guess == number
  end

  def display_result
    puts player_correct? ? 'You won!' : 'You have no more guesses. You lost!'
  end

  def guesses?
    guesses_left > 0
  end

  def choose
    input = nil
    loop do
      puts "Guesses remaining: #{guesses_left}"
      puts "Enter a number between #{range.first} and #{range.last}: "
      input = gets.chomp.to_i
      break if range.cover?(input)
      puts 'Invalid guess.'
      puts
    end
    @current_guess = input
    @guesses_left -= 1
  end
end

game = GuessingGame.new(low: 501, high: 1500)
game.play
game.play

