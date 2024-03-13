method Triple(q: int) returns (r: int)
{
  if q < 5 {
    r := 12;
  } else {
    r := q * 2;
    r := r + q;
  }
}

