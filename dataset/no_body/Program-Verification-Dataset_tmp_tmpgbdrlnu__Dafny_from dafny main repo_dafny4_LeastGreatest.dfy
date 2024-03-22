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
{/* TODO */ }

lemma NatIsNatural(x: int)
  requires 0 <= x
  ensures Natural(x)
{/* TODO */ }

lemma PositiveIsPos(x: int)
  requires x <= 0
  ensures !Positive(x)
  decreases -x
{/* TODO */ }

greatest lemma PosIsPositive(x: int)
  requires 0 < x
  ensures Positive(x)
{/* TODO */ }

lemma AboutNatural(x: int)
  ensures Natural(x) <==> 0 <= x
{/* TODO */ }

lemma AboutPositive(x: int)
  ensures Positive(x) <==> 0 < x
{/* TODO */ }

method least(x: int, y: int) returns (least: int) {/* TODO */ }

method greatest(x: int, y: int) returns (greatest: int) {/* TODO */ }

method mixmax(x: int, y: int) returns (least: int, greatest: int)
  ensures {/* TODO */ } == {least, greatest}
  ensures least <= greatest
{
  if x < y {
    least, greatest := x, y;
  } else {
    least, greatest := y, x;
  }
}

