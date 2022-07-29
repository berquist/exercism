import std/tables
import std/strutils

func transform*(data: Table[int, seq[char]]): Table[char, int] =
  for score, letters in data:
    for letter in letters:
      result[letter.toLowerAscii] = score
