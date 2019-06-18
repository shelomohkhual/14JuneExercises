class Player
    def guess
      puts 'What is your guess? Choose one of the following: "R", "G", "B", "Y", "O", "P"'
      user_guess = gets.chomp
      convert_guess(user_guess)
    end
    def convert_guess(guess)
      guess.upcase.split('')
    end
  end

class Computer
    attr_reader :code_combination
  
    def initialize
      @code_combination = code
    end
  
    def code
        generated_code = []
        4.times do
      color = Game::COLORS.sample(1)
      generated_code << color
        end
        generated_code.flatten
    end
end

class Game
    COLORS = ["R", "G", "B", "Y", "O", "P"]
  
    def initialize
      @computer = Computer.new
      @player = Player.new
    end
  
    def play
      10.times do |x|
        puts "This is chance #{x+1} of 10"
        current_guess = @player.guess
        correct = check_guess(current_guess)
  
        if correct[:exact].length == 4
          puts "You won!"
          return
        else
          puts "#{correct[:exact].length} Exact Matches"
          puts "#{correct[:near].length} Near Matches"
        end
      end
      puts "You lost!"
      puts "The answer was #{@computer.code.flatten}"
      return
    end
  
    def check_guess(current_guess)
      results = { :exact => [], :near => [] }
      current_guess.each_with_index do |choice, position|
        if choice == @computer.code_combination[position]
          results[:exact] << true
        elsif @computer.code_combination.include?(choice)
          results[:near] << true
        end
      end
      results
    end
  
    # def near_match?(choice)
    #   @computer.code_combination.include?(choice)
    # end
  
    # def exact_match?(choice, position)
    #   choice == @computer.code_combination[position]
    # end
  end
  

# DRIVER CODE GOES HERE!!! #

  game = Game.new
  game.play