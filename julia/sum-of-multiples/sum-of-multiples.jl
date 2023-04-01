function sum_of_multiples(limit, factors)
    [num for num in 0:limit-1 if any(multiple -> iszero(num % multiple), setdiff(factors, [0]))] |> sum
end
