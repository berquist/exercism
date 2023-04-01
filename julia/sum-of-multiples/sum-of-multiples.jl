function sum_of_multiples(limit, factors)
    factors = setdiff(factors, [0])
    filter(num -> any(multiple -> iszero(num % multiple), factors), 0:limit-1) |> sum
end
