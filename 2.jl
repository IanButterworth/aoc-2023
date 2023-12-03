# https://adventofcode.com/2023/day/2

function day2()
    # quick solve not using regex
    record = """
    Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
    """

    # only 12 red cubes, 13 green cubes, and 14 blue cubes
    totals = Dict{String,Int}()
    totals["red"] = 12
    totals["green"] = 13
    totals["blue"] = 14

    id_sum = 0
    for line in split(record, "\n", keepempty = false)
        possible = true
        game, scores = split(line, ": ")
        for round in split(scores, "; ", keepempty = false)
            for score in split(round, ", ", keepempty = false)
                count, cat = split(score, " ")
                count = parse(Int, count)
                if count > totals[cat]
                    @info "Impossible result" game round cat totals[cat]
                    possible = false
                end
            end
        end
        if possible
            id_sum += parse(Int, split(game, "Game ", keepempty = false)[1])
        end
    end
    @show id_sum == 8
    return id_sum
end

@show day2()
