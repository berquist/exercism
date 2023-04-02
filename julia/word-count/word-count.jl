function wordcount(sentence::AbstractString)
    words = split(replace(lowercase(sentence), r"[^'\w]+|\B'|'\B" => " "))
    Dict(word => count(==(word), words) for word in words)
end
