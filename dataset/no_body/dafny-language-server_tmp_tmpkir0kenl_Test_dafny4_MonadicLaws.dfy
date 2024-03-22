// RUN: %dafny /compile:0 /rprint:"%t.rprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// Monadic Laws
// Niki Vazou and Rustan Leino
// 28 March 2016

datatype List<T> = Nil | Cons(head: T, tail: List)

function append(xs: List, ys: List): List
{
  match xs
  case Nil => ys
  case Cons(x, xs') => Cons(x, append(xs', ys))
}

lemma AppendNil(xs: List)
  ensures append(xs, Nil) == xs
{/* TODO */ }

lemma AppendAssoc(xs: List, ys: List, zs: List)
  ensures append(append(xs, ys), zs) == append(xs, append(ys, zs));
{/* TODO */ }

function Return<T>(a: T): List
{
  Cons(a, Nil)
}

function Bind<T,U>(xs: List<T>, f: T -> List<U>): List<U>
{
  match xs
  case Nil => Nil
  case Cons(x, xs') => append(f(x), Bind(xs', f))
}

lemma LeftIdentity<T>(a: T, f: T -> List)
  ensures Bind(Return(a), f) == f(a)
{/* TODO */ }

lemma RightIdentity<T>(m: List)
  ensures Bind(m, Return) == m
{/* TODO */ }

lemma Associativity<T>(m: List, f: T -> List, g: T -> List)
  ensures Bind(Bind(m, f), g) == Bind(m, x => Bind(f(x), g))
{/* TODO */ }

lemma BindOverAppend<T>(xs: List, ys: List, g: T -> List)
  ensures Bind(append(xs, ys), g) == append(Bind(xs, g), Bind(ys, g))
{/* TODO */ }

