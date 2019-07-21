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
    "a Partridge in a Pear Tree.",
    "two Turtle Doves, and ",
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
        verse_parts = [FIRST_LINE.format(NUM_TO_ROMAN[verse_num])] + [
            NUM_TO_DAYS_LINE[verse_part] for verse_part in range(verse_num, 0, -1)
        ]
        verses.append("".join(verse_parts))
    return verses
