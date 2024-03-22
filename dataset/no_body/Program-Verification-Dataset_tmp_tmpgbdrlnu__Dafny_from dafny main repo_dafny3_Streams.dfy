// RUN: %testDafnyForEachResolver "%s" -- --warn-deprecation:false


// ----- Stream

codatatype Stream<T> = Nil | Cons(head: T, tail: Stream)

ghost function append(M: Stream, N: Stream): Stream
{
  match M
  case Nil => N
  case Cons(t, M') => Cons(t, append(M', N))
}

// ----- f, g, and maps

type X

ghost function f(x: X): X
ghost function g(x: X): X

ghost function map_f(M: Stream<X>): Stream<X>
{
  match M
  case Nil => Nil
  case Cons(x, N) => Cons(f(x), map_f(N))
}

ghost function map_g(M: Stream<X>): Stream<X>
{
  match M
  case Nil => Nil
  case Cons(x, N) => Cons(g(x), map_g(N))
}

ghost function map_fg(M: Stream<X>): Stream<X>
{
  match M
  case Nil => Nil
  case Cons(x, N) => Cons(f(g(x)), map_fg(N))
}

// ----- Theorems

// map (f * g) M = map f (map g M)
greatest lemma Theorem0(M: Stream<X>)
  ensures map_fg(M) == map_f(map_g(M));
{/* TODO */ }
greatest lemma Theorem0_Alt(M: Stream<X>)
  ensures map_fg(M) == map_f(map_g(M));
{/* TODO */ }
lemma Theorem0_Par(M: Stream<X>)
  ensures map_fg(M) == map_f(map_g(M));
{/* TODO */ }
lemma Theorem0_Ind(k: nat, M: Stream<X>)
  ensures map_fg(M) ==#[k] map_f(map_g(M));
{/* TODO */ }
lemma Theorem0_AutoInd(k: nat, M: Stream<X>)
  ensures map_fg(M) ==#[k] map_f(map_g(M));
{/* TODO */ }

// map f (append M N) = append (map f M) (map f N)
greatest lemma Theorem1(M: Stream<X>, N: Stream<X>)
  ensures map_f(append(M, N)) == append(map_f(M), map_f(N));
{/* TODO */ }
greatest lemma Theorem1_Alt(M: Stream<X>, N: Stream<X>)
  ensures map_f(append(M, N)) == append(map_f(M), map_f(N));
{/* TODO */ }
lemma Theorem1_Par(M: Stream<X>, N: Stream<X>)
  ensures map_f(append(M, N)) == append(map_f(M), map_f(N));
{/* TODO */ }
lemma Theorem1_Ind(k: nat, M: Stream<X>, N: Stream<X>)
  ensures map_f(append(M, N)) ==#[k] append(map_f(M), map_f(N));
{/* TODO */ }
lemma Theorem1_AutoInd(k: nat, M: Stream<X>, N: Stream<X>)
  ensures map_f(append(M, N)) ==#[k] append(map_f(M), map_f(N));
{/* TODO */ }
lemma Theorem1_AutoForall()
{/* TODO */ }

// append NIL M = M
lemma Theorem2(M: Stream<X>)
  ensures append(Nil, M) == M;
{/* TODO */ }

// append M NIL = M
greatest lemma Theorem3(M: Stream<X>)
  ensures append(M, Nil) == M;
{/* TODO */ }
greatest lemma Theorem3_Alt(M: Stream<X>)
  ensures append(M, Nil) == M;
{/* TODO */ }

// append M (append N P) = append (append M N) P
greatest lemma Theorem4(M: Stream<X>, N: Stream<X>, P: Stream<X>)
  ensures append(M, append(N, P)) == append(append(M, N), P);
{/* TODO */ }
greatest lemma Theorem4_Alt(M: Stream<X>, N: Stream<X>, P: Stream<X>)
  ensures append(M, append(N, P)) == append(append(M, N), P);
{/* TODO */ }

// ----- Flatten

// Flatten can't be written as just:
//
//     function SimpleFlatten(M: Stream<Stream>): Stream
//     {
//       match M
//       case Nil => Nil
//       case Cons(s, N) => append(s, SimpleFlatten(N))
//     }
//
// because this function fails to be productive given an infinite stream of Nil's.
// Instead, here are two variations of SimpleFlatten.  The first variation (FlattenStartMarker)
// prepends a "startMarker" to each of the streams in "M".  The other (FlattenNonEmpties)
// insists that "M" contain no empty streams.  One can prove a theorem that relates these
// two versions.

// This first variation of Flatten returns a stream of the streams in M, each preceded with
// "startMarker".

ghost function FlattenStartMarker<T>(M: Stream<Stream>, startMarker: T): Stream
{
  PrependThenFlattenStartMarker(Nil, M, startMarker)
}

ghost function PrependThenFlattenStartMarker<T>(prefix: Stream, M: Stream<Stream>, startMarker: T): Stream
{
  match prefix
  case Cons(hd, tl) =>
    Cons(hd, PrependThenFlattenStartMarker(tl, M, startMarker))
  case Nil =>
    match M
    case Nil => Nil
    case Cons(s, N) => Cons(startMarker, PrependThenFlattenStartMarker(s, N, startMarker))
}

// The next variation of Flatten requires M to contain no empty streams.

greatest predicate StreamOfNonEmpties(M: Stream<Stream>)
{
  match M
  case Nil => true
  case Cons(s, N) => s.Cons? && StreamOfNonEmpties(N)
}

ghost function FlattenNonEmpties(M: Stream<Stream>): Stream
  requires StreamOfNonEmpties(M);
{
  PrependThenFlattenNonEmpties(Nil, M)
}

ghost function PrependThenFlattenNonEmpties(prefix: Stream, M: Stream<Stream>): Stream
  requires StreamOfNonEmpties(M);
{
  match prefix
  case Cons(hd, tl) =>
    Cons(hd, PrependThenFlattenNonEmpties(tl, M))
  case Nil =>
    match M
    case Nil => Nil
    case Cons(s, N) => Cons(s.head, PrependThenFlattenNonEmpties(s.tail, N))
}

// We can prove a theorem that links the previous two variations of flatten.  To
// do that, we first define a function that prepends an element to each stream
// of a given stream of streams.

ghost function Prepend<T>(x: T, M: Stream<Stream>): Stream<Stream>
{
  match M
  case Nil => Nil
  case Cons(s, N) => Cons(Cons(x, s), Prepend(x, N))
}

greatest lemma Prepend_Lemma<T>(x: T, M: Stream<Stream>)
  ensures StreamOfNonEmpties(Prepend(x, M));
{/* TODO */ }

lemma Theorem_Flatten<T>(M: Stream<Stream>, startMarker: T)
  ensures
    StreamOfNonEmpties(Prepend(startMarker, M)) ==> // always holds, on account of Prepend_Lemma;
                                          // but until (co-)method can be called from functions,
                                          // this condition is used as an antecedent here
    FlattenStartMarker(M, startMarker) == FlattenNonEmpties(Prepend(startMarker, M));
{/* TODO */ }

greatest lemma Lemma_Flatten<T>(prefix: Stream, M: Stream<Stream>, startMarker: T)
  ensures
    StreamOfNonEmpties(Prepend(startMarker, M)) ==> // always holds, on account of Prepend_Lemma;
                                          // but until (co-)method can be called from functions,
                                          // this condition is used as an antecedent here
    PrependThenFlattenStartMarker(prefix, M, startMarker) == PrependThenFlattenNonEmpties(prefix, Prepend(startMarker, M));
{/* TODO */ }

greatest lemma Lemma_FlattenAppend0<T>(s: Stream, M: Stream<Stream>, startMarker: T)
  ensures PrependThenFlattenStartMarker(s, M, startMarker) == append(s, PrependThenFlattenStartMarker(Nil, M, startMarker));
{/* TODO */ }

greatest lemma Lemma_FlattenAppend1<T>(s: Stream, M: Stream<Stream>)
  requires StreamOfNonEmpties(M);
  ensures PrependThenFlattenNonEmpties(s, M) == append(s, PrependThenFlattenNonEmpties(Nil, M));
{/* TODO */ }

