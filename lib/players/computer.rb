module Players
    class Computer < Player
        def move(board)
            choice = "10"
            if !board.valid_move?(choice)
                choice = (['1','2','3','4','5','6','7','8','9']).sample(1)
            end
            return (choice[0].to_i - 1).to_s
        end
    end
end