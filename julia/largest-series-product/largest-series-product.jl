strtoints(str::AbstractString) = map(c -> parse(Int, c), collect(str))
windows(v::AbstractVector, size::Int) = [v[i:i+size-1] for i in 1:length(v)-size+1]

function largest_product(str::AbstractString, span::Int)
    if !(0 <= span <= length(str))
        throw(ArgumentError("invalid span"))
    elseif iszero(span)
        1
    else
        map(prod, windows(strtoints(str), span)) |> maximum
    end
end
