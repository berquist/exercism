function wordcount(sentence::AbstractString)
    counts = Dict()
    for word in split(replace(lowercase(sentence), r"[^'\w]+|\B'|'\B" => " "))
        if haskey(counts, word)
            counts[word] += 1
        else
            counts[word] = 1
        end
    end
    counts
end
