import Unicode

const TEST_GRAPHEMES = true

function myreverse(s)
    # Rather than use the built-in, demo some mutable vector operations.
    # (Actually it turns out that the built-in doesn't work properly for
    # graphemes anyways.)
    # reverse(s)
    acc = []
    for elem in Unicode.graphemes(s)
        pushfirst!(acc, elem)
    end
    join(acc)
end
