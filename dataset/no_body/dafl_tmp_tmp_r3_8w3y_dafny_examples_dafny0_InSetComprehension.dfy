// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

lemma Tests<T>(t: T, uu: seq<T>) returns (z: bool)
  requires 10 <= |uu| && uu[4] == t
  ensures !z
{/* TODO */ }

lemma TestsWhereTriggersMatter<T>(t: T, uu: seq<T>) returns (z: bool)
  requires 10 <= |uu| && uu[4] == t
  ensures z
{/* TODO */ }

function Id<T>(t: T): T { t }
predicate Even(x: int) { x % 2 == 0 }

class Container<T> {
  ghost var Contents: set<T>
  var elems: seq<T>

  method Add(t: T)
    requires Contents == set x | x in elems
    modifies this
    ensures Contents == set x | x in elems
  {/* TODO */ }
}

class IntContainer {
  ghost var Contents: set<int>
  var elems: seq<int>

  method Add(t: int)
    requires Contents == set x | x in elems
    modifies this
    ensures Contents == set x | x in elems
  {/* TODO */ }
}

method UnboxedBoundVariables(si: seq<int>)
{/* TODO */ }


