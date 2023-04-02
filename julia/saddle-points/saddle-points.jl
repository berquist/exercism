function saddlepoints(M)
    ret = []
    for irow in 1:size(M, 1)
        for icol in 1:size(M, 2)
            candidate = M[irow, icol]
            if (candidate >= maximum(M[irow, :])) && (candidate <= minimum(M[:, icol]))
                push!(ret, (irow, icol))
            end
        end
    end
    ret
end
