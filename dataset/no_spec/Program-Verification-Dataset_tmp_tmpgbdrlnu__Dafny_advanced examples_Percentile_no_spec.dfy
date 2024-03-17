// Sum of elements of A from indices 0 to end.
// end is inclusive! (not James's normal way of thinking!!)
function SumUpto(A: array<real>, end: int): real
{
  if end == -1 then
    0.0
  else
    A[end] + SumUpto(A, end-1)
}

function Sum(A: array<real>): real
{
  SumUpto(A, A.Length-1)
}

method Percentile(p: real, A: array<real>, total: real) returns (i: int)
{
  i := -1;
  var s: real := 0.0;

  while i+1 != A.Length && s + A[i+1] <= (p/100.0) * total
  {
    i := i + 1;
    s := s + A[i];
  }
}

// example showing that, with the original postcondition, the answer is non-unique!
method PercentileNonUniqueAnswer() returns (p: real, A: array<real>, total: real, i1: int, i2: int)
{
  p := 100.0;
  A := new real[1];
  A[0] := 1.0;
  total := 1.0;
  i1 := -1;
  i2 := 0;
}


// proof that, with the corrected postcondition, the answer is unique
lemma PercentileUniqueAnswer(p: real, A: array<real>, total: real, i1: int, i2: int)
{
  if i1+1< i2 {
    SumUpto_increase(A, i1+1, i2);
  }
}
// lemma for previous proof: when an array has strictly positive elements, the
// sums strictly increase left to right
lemma SumUpto_increase(A: array<real>, end1: int, end2: int)
{}

