class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    raise NoSuchStrategyError unless game[0][1] =~ /[PSR]/ &&
                                     game[1][1] =~ /[PSR]/
    if ((game[0][1] == "P" && game[1][1] == "S") ||
        (game[0][1] == "S" && game[1][1] == "R") ||
        (game[0][1] == "R" && game[1][1] == "P"))
        then
            return game[1]
    end
    return game[0]
end

def rps_tournament_winner(tournament)
    if tournament[0][0].is_a? String
        rps_game_winner(tournament)
    else
        rps_tournament_winner([rps_tournament_winner(tournament[0]),
                              rps_tournament_winner(tournament[1])])
    end
end
