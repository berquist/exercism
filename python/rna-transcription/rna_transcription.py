DNA_TO_RNA = {"A": "U", "C": "G", "G": "C", "T": "A"}


def to_rna(dna_strand):
    return "".join(DNA_TO_RNA[nucleobase] for nucleobase in dna_strand)
