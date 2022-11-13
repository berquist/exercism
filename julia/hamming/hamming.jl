"Your optional docstring here"
function distance(a, b)
    if length(a) == length(b)
        reduce(+, map(!=, a, b))
    else
        throw(ArgumentError("different strand lengths"))
    end
end
