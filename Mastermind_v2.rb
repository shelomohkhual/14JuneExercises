require 'colorize'
require 'byebug'
class Board
    attr_accessor :game_board, :current_row ,:available_colors
    attr_reader :check_colors
    def initialize
        @available_colors = ["Gr".green,"Re".red,"Ye".yellow,"Bl".blue,"Mg".magenta,"Cy".cyan,"Wh".white,"Bk".black]
        @check_colors = ["Gr","Re","Ye","Bl","Mg","Cy","Wh","Bk"]
        @game_board = [
            [1,2,3,4],
            [1,2,3,4],
            [1,2,3,4],
            [1,2,3,4]]
            # byebug
        @current_row = [1,2,3,4]
    end
    
    def show_board
        puts "         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".yellow
        puts "                    MASTER-MIND".yellow
        puts "         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".yellow
        puts
        self.game_board.each_with_index do |row,index|
            print "ROW:#{index+1}=> |   ".yellow
            # (self.game_board.size
            # [(self.game_board.size)-index]
            row.each do |inside_row|
                print "#{inside_row}" + "   |   ".yellow
            end
            puts
            # puts Game.check
        end
        puts
        print "Available Colors: ".yellow,"Gr,".green,"Re,".red,"Ye,".yellow,"Bl,".blue,"Mg,".magenta,"Cy,".cyan,"Wh,".white,"Bk,".black
        puts
        puts "Positions : 1 , 2 , 3 , 4".yellow
        puts
    end

    def marker(color,position)
        self.check_colors.each_with_index do |each_color,index|
            if color.include? self.check_colors[index]
                self.current_row[position-1]=self.available_colors[index] #=self.available_colors[index]
            else nil
            end
        end
        # recolor=[color]
        
        # self.current_row[position-1]=recolor & self.available_colors
        # if color.include? self.check_colors[0]
        #     self.current_row[position-1]=self.available_colors[0]
        # elsif color.include? self.check_colors[1]
        #     self.current_row[position-1]=self.available_colors[1]
        # elsif color.include? self.check_colors[2]
        #     self.current_row[position-1]=self.available_colors[2]
        # elsif color.include? self.check_colors[3]
        #     self.current_row[position-1]=self.available_colors[3]
        # elsif color.include? self.check_colors[4]
        #     self.current_row[position-1]=self.available_colors[4]
        # elsif color.include? self.check_colors[5]
        #     self.current_row[position-1]=self.available_colors[5]
        # elsif color.include? self.check_colors[6]
        #     self.current_row[position-1]=self.available_colors[6]
        # elsif color.include? self.check_colors[7]
        #     self.current_row[position-1]=self.available_colors[7]
        # else nil
        # end
    end

    def filled_row?
        filled_slot=0
        self.current_row.each_with_index do |slot,index|
            if slot != index+1 #|| @available_colors.any? slot
                filled_slot += 1
            end
        end
        filled_slot == 4
    end

    #================== SCREEN METHODS ================
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
    #================== CLASS - GAME ================
class Game
    attr_accessor :secret_code, :board,:check
    attr_reader :guess_chances, :code_length
    def initialize
        @board = Board.new
        @guess_chances = 10
        @secret_code = secret_code
        @code_length = 4
        @check = check
    end
    

    def generate_secret_code
        shuffle=self.board.available_colors.shuffle
        self.secret_code = shuffle[0,code_length]
    end
    def won?
        self.board.current_row == self.secret_code
    end
    def check
        self.check=[]
        # byebug
        self.board.current_row.each_with_index do |color,position|
            self.secret_code.each_with_index do|sc_color,sc_position|
                if sc_color==color && sc_position==position
                    self.check.push "*"
                elsif sc_color.include? color
                    self.check.push "o"
                end
            end
        end
        # match_color=self.board.current_row & self.board.available_colors
        # # #show correct colors , and perfect spots
        # self.check.push "o" * match_color.size
        # # if blah blah blah
        # self.check.pushs
    end
    
    def play_game
        self.generate_secret_code
        self.board.game_board.each do |row|
            self.board.current_row=row
            self.board.reset_screen
            self.board.available_colors
            puts self.secret_code
            self.board.show_board
            loop do
                puts "Select Color and Position (e.g #=> Gr,4 )".green
                if self.board.filled_row? 
                    puts "Enter 'Check' to Check (or) Replace with (e.g #=> Gr,4 )"
                end
                color_position=gets.chomp.capitalize
                break if self.board.filled_row? && color_position.include?("Check")
                # position=color_position.match(/\d/).to_i
                # color=color_position.match(/\A[A-Z][a-z]/).to_s
                position=color_position[-1].to_i
                color=color_position[0,2]
                self.board.marker(color,position)
                self.board.reset_screen
                self.board.show_board
                # puts self.board.current_row
            
                # print self.secrets_code
        
            end
            self.check
            self.board.reset_screen
            self.board.show_board
            # puts self.board.current_row
            # print self.secret_code
            break if self.won?
        end

        if self.won?
            # puts self.secret_code
            puts
            puts "Congratulation!!".yellow
        else
            puts "Out Of Chances".red
        end

    end
end

Game.new.play_game