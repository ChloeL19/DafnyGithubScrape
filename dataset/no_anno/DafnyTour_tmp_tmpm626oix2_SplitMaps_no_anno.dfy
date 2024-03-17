
datatype Option<T> =
| Some(getSome: T)
| None

trait K {}
trait V {}
trait Map {}

// This style is not the intended way of using Dafny.
// Just using Dafny as a quick way to encode problems into SMT with good trigger selection.

function get(m: Map, k: K): Option<V>
// keys of m2 override those of m1
function putmany(m1: Map, m2: Map): Map
// m can be split into two disjoint maps m1 and m2
predicate split(m: Map, m1: Map, m2: Map)

lemma test(m: Map, mKeep: Map, mGive: Map, frame: Map, m2: Map, mL: Map, mStack: Map)
// spec of split
{}

