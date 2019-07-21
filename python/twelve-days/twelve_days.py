FIRST_LINE = "On the {} day of Christmas my true love gave to me: "
NUM_TO_ROMAN = (
    "",
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth",
)
NUM_TO_DAYS_LINE = (
    "",
    "",
    "two Turtle Doves, ",
    "three French Hens, ",
    "four Calling Birds, ",
    "five Gold Rings, ",
    "six Geese-a-Laying, ",
    "seven Swans-a-Swimming, ",
    "eight Maids-a-Milking, ",
    "nine Ladies Dancing, ",
    "ten Lords-a-Leaping, ",
    "eleven Pipers Piping, ",
    "twelve Drummers Drumming, ",
)


def recite(start_verse, end_verse):
    verses = []
    for verse_num in range(start_verse, end_verse + 1):
        verse = FIRST_LINE.format(NUM_TO_ROMAN[verse_num])
        for verse_part in range(verse_num, 0, -1):
            if verse_part > 1:
                verse += NUM_TO_DAYS_LINE[verse_part]
            else:
                if verse_num > 1:
                    verse += "and a Partridge in a Pear Tree."
                else:
                    verse += "a Partridge in a Pear Tree."
        verses.append(verse)
    return verses
