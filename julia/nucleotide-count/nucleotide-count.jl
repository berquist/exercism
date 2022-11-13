"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    nucleotides = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for base in strand
        if haskey(nucleotides, base)
            nucleotides[base] += 1
        else
            throw(DomainError(base, "invalid base"))
        end
    end
    nucleotides
end
