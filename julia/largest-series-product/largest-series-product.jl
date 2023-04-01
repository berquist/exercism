strtoints(str::AbstractString) = map(c -> parse(Int, c), collect(str))
windows(v::AbstractVector, size::Int) = [v[i:i+size-1] for i in 1:length(v)-size+1]

function largest_product(str::AbstractString, span::Int)
    if span > length(str)
        throw(ArgumentError("span longer than string length"))
    elseif span < 0
        throw(ArgumentError("negative span doesn't make sense"))
    elseif span == 0
        1
    else
        last(sort(map(prod, windows(strtoints(str), span))))
    end
end
