import sequtils

func primes*(maxPrime: int): seq[int] =
  if maxPrime < 2:
    return @[]
  var
    candidates = (2..maxPrime).toSeq
    marks = newSeq[bool](candidates.len)
  for candidate in candidates:
    var i = 2 * candidate - 2
    while i < maxPrime - 1:
      marks[i] = true
      i += candidate
  for i in marks.low..marks.high:
    if not marks[i]:
      result.add candidates[i]
