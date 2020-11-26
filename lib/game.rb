class Game

    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [[0,1,2], [0,3,6], [6,7,8], [2,5,8], [0,4,8], [2,4,6], [3,4,5], [1,4,7]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        if @board.turn_count.odd?
            @player_2
        else
            @player_1
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            winner = []
            combo.each do |space|
                if @board.cells[space] == "X" || @board.cells[space] == "O" || @board.cells[space] == " "
                    winner << @board.cells[space]
                end
            end
            if winner == ["X", "X", "X"] || winner == ["O", "O", "O"]
                return combo
            end
        end
        false
    end

    def draw?
        if @board.full? && !self.won?
            true
        else
            false
        end
    end

    def over?
        if self.won? || self.draw? || @board.full?
            true
        else
            false
        end
    end

      def winner
        if self.won?
            champ_combo = self.won?
            @board.cells[champ_combo[0]]
        else
            nil
        end
    end

    def turn
        first = self.current_player.move(1)
        if !@board.valid_move?(first)
            self.current_player.move(1)
        end
        @board.update(first, self.current_player)
    end

    def play
        while !self.over?
            self.turn
        end
        if self.won?
            puts "Congratulations #{self.winner}!"
        else
            puts "Cat's Game!"
        end
    end
end