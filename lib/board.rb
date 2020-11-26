class Board
    attr_accessor :cells

    def initialize()
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts '-----------'
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts '-----------'
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(user_choice)
        position = (user_choice.to_i - 1)
        @cells[position]
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def full?
        if !(cells.any?(" "))
            true
        else
            false
        end
    end

    def turn_count
        count = 0
        @cells.each do |cell|
            if cell != " "
                count +=1
            end
        end
        count
    end

    def taken?(number)
        spot = (number.to_i - 1)
        if @cells[spot] == "X" || @cells[spot] == "O"
            true
        else
            false
        end
    end

    def valid_move?(input)
        if !(taken?(input)) && (input.to_i - 1) >= 0 && (input.to_i - 1) <= 8
            true
        end
    end

    def update(input, player)
        spot = (input.to_i - 1)
        if valid_move?(input)
            @cells[spot] = player.token
        end
    end
end