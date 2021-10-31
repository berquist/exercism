import tables

const nucleotides = {'A', 'C', 'G', 'T'}

func countDna*(strand: string): CountTable[char] =
  for nucleotide in strand:
    if not nucleotides.contains nucleotide:
      raise newException(ValueError, "not a valid nucleotide")
    result.inc nucleotide
