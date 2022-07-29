func isLeapYear*(year: uint): bool =
  let
    divByFour = (year mod 4 ) == 0
    divByHundred = (year mod 100) == 0
    divByFourHundred = (year mod 400) == 0
  (divByFour and not divByHundred) or (divByFour and divByHundred and divByFourHundred)
