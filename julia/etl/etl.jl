function transform(input::AbstractDict)
    ret = Dict()
    for (count, letters) in input
        for letter in letters
            ret[lowercase(letter)] = count
        end
    end
    ret
end
