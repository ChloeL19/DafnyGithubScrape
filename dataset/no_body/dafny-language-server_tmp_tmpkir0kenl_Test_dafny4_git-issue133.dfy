// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype State = State(m:map<int, bool>)

lemma Test(s:State)
  requires 42 in s.m
  ensures s.(m := s.m[42 := s.m[42]]) == s
{/* TODO */ }

datatype MyDt = MakeA(x: int, bool) | MakeB(s: multiset<int>, t: State)

lemma AnotherTest(a: MyDt, b: MyDt, c: bool)
  requires a.MakeB? && b.MakeB?
  requires a.s == multiset(a.t.m.Keys) && |b.s| == 0
  requires a.t.m == map[] && |b.t.m| == 0
{/* TODO */ }

datatype GenDt<X,Y> = Left(X) | Middle(X,int,Y) | Right(y: Y)

method ChangeGen(g: GenDt)
{/* TODO */ }

datatype Recursive<X> = Red | Green(next: Recursive, m: set)

lemma RecLem(r: Recursive) returns (s: Recursive)
  ensures r == s
{/* TODO */ }

