import re


def count_words(sentence):
    counts = dict()
    cleaned_sentence = re.sub(r"[^'\w]+|(?:\B'\b|\b'\B)|_", " ", sentence.lower())
    for word in cleaned_sentence.split():
        try:
            counts[word] += 1
        except KeyError:
            counts[word] = 1
    return counts
