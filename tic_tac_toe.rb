class TicTacToe
    @@turn_count = 1
    @@winner = ''

    def initialize
        puts "Who are 1st you warrior"
        @player_one = gets.chomp
        puts "Who are 2nd you warrior"
        @player_two = gets.chomp
        @board = Array.new(3) {Array.new(3, "_")}
    end

    def display_board(board)
        puts "\n"
        puts "#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
        puts "#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
        puts "#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
        puts "\n"
    end

    def check_winner
        @board.each do |row|
            return true if row.uniq.length == 1 && row[0] !="_"
        end

        @board.transpose.each do |col|
            return true if col.uniq.length == 1 && col[0] != '_'
          end
      
          # Check diagonals
          return true if (@board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[1][1] != '_') ||
                         (@board[0][2] == @board[1][1] && @board[1][1] == @board[2][0] && @board[1][1] != '_')
      
          false
        end
      
        def game_over?
          @@turn_count > 9 || check_winner
        end
      
        def switch_players
          @@current_player = @@current_player == 'X' ? 'O' : 'X'
        end
      
        def play
          until game_over?
            display_board
      
            puts "Player #{@@current_player == 'X' ? @player_one : @player_two}'s turn. Enter row (0-2): "
            row = gets.chomp.to_i
            puts 'Enter column (0-2): '
            col = gets.chomp.to_i
      
            if @board[row][col] == '_'
              @board[row][col] = @@current_player
              @@turn_count += 1
            else
              puts 'Invalid move. Cell already occupied.'
            end
      
            switch_players
          end
      
          display_board
      
          if check_winner
            puts "Player #{@@current_player == 'X' ? @player_two : @player_one} wins!"
          else
            puts "It's a tie!"
          end
        end
      end
      
      # Start the game
      game = TicTacToe.new
      game.play
      