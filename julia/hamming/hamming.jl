function distance(a, b)
    if length(a) == length(b)
        mapreduce(≠, +, a, b; init=0)
    else
        throw(ArgumentError("different strand lengths"))
    end
end
