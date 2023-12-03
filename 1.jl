# https://adventofcode.com/2023/day/1
function day1(input::String)
    mapreduce(+, split(input, "\n")) do line
        first = line[findfirst(isnumeric, line)]
        last = line[findlast(isnumeric, line)]
        return parse(Int, first * last)
    end
end

input = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet"""

@show day1(input) == 142
