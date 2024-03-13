// RUN: %testDafnyForEachResolver "%s"


least predicate Natural(x: int) {
  x == 0 || Natural(x - 1)
}

greatest predicate Positive(x: int) {
  x != 0 && Positive(x + 1)
}

least lemma NaturalIsNat(x: int)
  requires Natural(x)
  ensures 0 <= x
{
}

lemma NatIsNatural(x: int)
{
}

lemma PositiveIsPos(x: int)
{
}

greatest lemma PosIsPositive(x: int)
  requires 0 < x
  ensures Positive(x)
{
}

lemma AboutNatural(x: int)
{
  if Natural(x) {
    NaturalIsNat(x);
  }
  if 0 <= x {
    NatIsNatural(x);
  }
}

lemma AboutPositive(x: int)
{
  if 0 < x {
    PosIsPositive(x);
  } else {
    PositiveIsPos(x);
  }
}

method least(x: int, y: int) returns (least: int) {
method least(x: int, y: int) returns (least: int) {
  var greatest;
  least, greatest := mixmax(x, y);
}

method greatest(x: int, y: int) returns (greatest: int) {
method greatest(x: int, y: int) returns (greatest: int) {
  var least;
  least, greatest := mixmax(x, y);
}

method mixmax(x: int, y: int) returns (least: int, greatest: int)
  ensures {x, y} == {least, greatest}
  ensures least <= greatest
{
  if x < y {
    least, greatest := x, y;
  } else {
    least, greatest := y, x;
  }
}

