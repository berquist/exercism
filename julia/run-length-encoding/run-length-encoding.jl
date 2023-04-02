function encode(s::AbstractString)
    if iszero(length(s)) return "" end
    pairs = []
    counter = 1
    for pos in 2:length(s)
        current = s[pos]
        prev = s[pos - 1]
        if prev != current
            push!(pairs, (counter, prev))
            counter = 1
        else
            counter += 1
        end
    end
    # Don't forget the last character in the string.
    push!(pairs, (counter, s[length(s)]))
    join([if counter == 1 char else "$(counter)$(char)" end for (counter, char) in pairs])
end

function decode(s::AbstractString)
    acc = []
    counters = []
    for current in s
        if isdigit(current)
            push!(counters, current)
        else
            counter = join(counters)
            if length(counter) > 0
                push!(acc, current ^ parse(Int, counter))
                counters = []
            else
                push!(acc, current)
            end
        end
    end
    join(acc)
end
