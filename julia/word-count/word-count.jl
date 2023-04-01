function removesinglequote(s::AbstractString)
    s = replace(s, r"(\w)'(\W)" => s"\1 \2")
    s = replace(s, r"(\W)'(\w)" => s"\1 \2")
    s = replace(s, r"(\W)'(\W)" => s"\1 \2")
    s = replace(s, r"^'" => "")
    s = replace(s, r"'$" => "")
    s
end

function wordcount(sentence::AbstractString)
    counts = Dict()
    for word in split(removesinglequote(replace(lowercase(sentence), r"[^'\w]+" => " ")))
        if haskey(counts, word)
            counts[word] += 1
        else
            counts[word] = 1
        end
    end
    counts
end
