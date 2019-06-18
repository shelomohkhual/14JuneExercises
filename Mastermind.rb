require 'byebug'
require 'colorize'
class Player
end
class Board
    def won?(current_position)
        chosen_position == generated_position && chose_color == generated_color
    end
    def reset_screen
        clear_screen
        move_to_home
    end
      # Clears the content on the terminal.
    def clear_screen
        print "\e[2J"
    end
      # Moves the insert point in the terminal to the upper left.
    def move_to_home
        print "\e[H"
    end
end
class Game
    def initialize
        @board
    end
    
end

available_colors = ["•Gr".black_on_darkgreen,"•Re".black_on_darkred,"•Br".black_on_darkbrown,"•Bl".black_on_darkblue,"•Mg".black_on_darkmagenta,"•Cy".black_on_darkcyan,"•Wh".black_on_white,"•Bl".white_on_darkgrey]
available_positions = ["1","2","3","4"]
guess_chances = 12

    game_board=[
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"],
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"],
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"],
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"],
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"],
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"],
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"],
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"],
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"],
    ["|  ","1","  |  ","2","  |  ","3","  |  ","4","  |"]]
    def
    def show_board
        game_board.each_with_index do |row,index|
            print "#{index-1.to_s} => "
            puts row
        end
    end
    def response
        response=[]
        current_row.each do |ele|
            continure hhere <==
            if
        end
        current_row.push response
        # correct_position=chosen_position & current_position
        # correct_color=chosen_color & current_color
        # (correct_color.size)*"•".black_on_darkgreen
    end
    def marker(position,color)
        position=pos.to_i
        game_board[position]=color.capitalize
    end

    def play_game
        show_board.each do ||
            show_board
            loop do

                position=gets.chomp.to_i
                puts "Enter"
                color=gets.chomp
                break if 
            end
        end
    end