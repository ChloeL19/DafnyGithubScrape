// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

lemma Tests<T>(t: T, uu: seq<T>) returns (z: bool)
{
  if {
    case true =>
      z := 72 in set i | 0 <= i < 10;
    case true =>
      z := -8 in set k: nat | k < 10;
    case true =>
      z := 6 in set m | 0 <= m < 10 && Even(m) :: m + 1;
    case true =>
      z := t !in set u | u in uu;
    case true =>
      z := t !in set u {:autotriggers false} | u in uu :: Id(u);
  }
}

lemma TestsWhereTriggersMatter<T>(t: T, uu: seq<T>) returns (z: bool)
{
  if {
    case true =>
      z := 7 in set i | 0 <= i < 10;
    case true =>
      z := 8 in set k: nat | k < 10;
    case true =>
      // In the line below, auto-triggers should pick Even(m)
      z := 5 in set m | 0 <= m < 10 && Even(m) :: m + 1;
      // a necessary lemma:
      z := t in set u | u in uu;
    case true =>
      z := t in set u {:autotriggers false} | u in uu :: Id(u);
  }
}

function Id<T>(t: T): T { t }
predicate Even(x: int) { x % 2 == 0 }

class Container<T> {
  ghost var Contents: set<T>
  var elems: seq<T>

  method Add(t: T)
  {
    elems := elems + [t];
    Contents := Contents + {t};
  }
}

class IntContainer {
  ghost var Contents: set<int>
  var elems: seq<int>

  method Add(t: int)
  {
    elems := elems + [t];
    Contents := Contents + {t};
  }
}

method UnboxedBoundVariables(si: seq<int>)
{
  var iii := set x | x in si;
  var ti := si + [115];
  var jjj := set y | y in ti;
  var nnn := set n: nat | n in si;
  if forall i :: 0 <= i < |si| ==> 0 <= si[i] {
  }
}


