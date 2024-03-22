// RUN: %dafny /compile:0 /functionSyntax:4 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

predicate P0(A: bool, B: bool, C: bool) {
  A &&
  B ==> C // warning: suspicious lack of parentheses (lhs of ==>)
}

predicate P1(A: bool, B: bool, C: bool) {
  A && B ==>
    C
}

predicate P2(A: bool, B: bool, C: bool) {
  A &&
  B
  ==>
  C
}

predicate P3(A: bool, B: bool, C: bool, D: bool) {
  A &&
  B ==>
  C &&
  D
}

predicate P4(A: bool, B: bool, C: bool, D: bool) {
    A &&
    B
  ==>
    C &&
    D
}

predicate P5(A: bool, B: bool, C: bool) {
  A ==>
  && B
  && C
}

predicate P6(A: bool, B: bool, C: bool) {
  A ==>
  || B
  || C
}

predicate Q0(A: bool, B: bool, C: bool, D: bool) {
  A &&
  B ==> C && // warning (x2): suspicious lack of parentheses (lhs and rhs of ==>)
  D
}

predicate Q1(A: bool, B: bool, C: bool, D: bool) {
  A &&
  B ==> C && // warning: suspicious lack of parentheses (lhs of ==>)
        D
}

predicate Q2(A: bool, B: bool, C: bool, D: bool) {
  A &&
  B ==> (C && // warning: suspicious lack of parentheses (lhs of ==>)
  D)
}

predicate Q3(A: bool, B: bool, C: bool, D: bool) {
  (A &&
  B) ==> (C &&
  D)
}

predicate Q4(A: bool, B: bool, C: bool, D: bool) {
  && A
  && B ==> C // warning (x2): suspicious lack of parentheses (lhs and rhs of ==>)
  && D
}

predicate Q4a(A: bool, B: bool, C: bool, D: bool) {
  && A
  && B ==>
    C && D
}

predicate Q4b(A: bool, B: bool, C: bool, D: bool) {
  && A
  && B ==>
    C &&
    D
}

predicate Q4c(A: bool, B: bool, C: bool, D: bool) {
  && A
  && B ==>
  && C
  && D
}

predicate Q4d(A: bool, B: bool, C: bool, D: bool) {
  && A
  && B ==>
    && C
    && D
}

predicate Q5(A: bool, B: bool, C: bool, D: bool) {
  && A
  && B ==> C // warning: suspicious lack of parentheses (lhs of ==>)
           && D
}

predicate Q6(A: bool, B: bool, C: bool, D: bool) {
  && A
  && B ==> && C // warning (x2): suspicious lack of parentheses (lhs and rhs of ==>)
           && D
}

predicate Q7(A: bool, B: bool, C: bool, D: bool) {
  A
  ==> // warning: suspicious lack of parentheses (rhs of ==>)
    B && C &&
  D
}

predicate Q8(A: bool, B: bool, C: bool, D: bool) {
  A
  ==>
    B && C &&
    D
}

predicate Q8a(A: bool, B: bool, C: bool, D: bool) {
  (A
  ==>
    B && C &&
    D
  ) &&
  (B || C)
}

predicate Q8b(A: bool, B: bool, C: bool, D: bool) {
    A &&
    B
  ==>
    B &&
    D
}

predicate Q8c(t: int, x: int, y: int)
{
  && (t == 2 ==> x < y)
  && (|| t == 3
      || t == 2
     ==>
     && x == 100
     && y == 1000
     )
  && (t == 4 ==> || 0 <= x || 0 <= y)
}

predicate Q8d(t: int, x: int, y: int)
{
  || t == 3
  || t == 2
  ==>
  && x == 100
  && y == 1000
}

predicate Q9(A: bool, B: bool, C: bool) {
  A ==> B ==>
  C
}

ghost predicate R0(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) ==>
    Q(x) &&
    R(x)
}

ghost predicate R1(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) && Q(x) ==>
    R(x)
}

ghost predicate R2(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) ==> Q(x) ==>
    R(x)
}

ghost predicate R3(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) ==>
    Q(x) ==>
    R(x)
}

ghost predicate R4(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) ==> Q(x) ==>
  R(x)
}

ghost predicate R5(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) ==>
  forall y :: Q(y) ==>
  R(x)
}

ghost predicate R6(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: (P(x) ==> Q(x)) && // warning: suspicious lack of parentheses (forall)
  R(x)
}

ghost predicate R7(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x ::
  (P(x) ==> Q(x)) &&
  R(x)
}

ghost predicate R8(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x ::
    (P(x) ==> Q(x)) &&
    R(x)
}

ghost predicate R9(P: int -> bool, Q: int -> bool, R: int -> bool) {
  exists x :: (P(x) ==> Q(x)) && // warning: suspicious lack of parentheses (exists)
  R(x)
}

ghost predicate R10(P: int -> bool, Q: int -> bool, R: int -> bool) {
  exists x :: P(x) && // warning: suspicious lack of parentheses (exists)
  exists y :: Q(y) && // warning: suspicious lack of parentheses (exists)
  R(x)
}

lemma Injective()
  ensures forall x, y ::
    Negate(x) == Negate(y)
    ==> x == y
{/* TODO */ }

function Negate(x: int): int {
  -x
}

predicate Quant0(s: string) {
  && s != []
  && (|| 'a' <= s[0] <= 'z'
      || 'A' <= s[0] <= 'Z')
  && forall i :: 1 <= i < |s| ==>
    || 'a' <= s[i] <= 'z'
    || 'A' <= s[i] <= 'Z'
    || '0' <= s[i] <= '9'
}

predicate Quant1(m: array2<string>, P: int -> bool)
  reads m
{
  forall i :: 0 <= i < m.Length0 && P(i) ==> forall j :: 0 <= j < m.Length1 ==>
    m[i, j] != ""
}

predicate Quant2(s: string) {
  forall i :: 0 <= i < |s| ==> if s[i] == '*' then false else
    s[i] == 'a' || s[i] == 'b'
}

ghost predicate Quant3(f: int -> int, g: int -> int) {
  forall x ::
    f(x) == g(x)
}

ghost predicate Quant4(f: int -> int, g: int -> int) {
  forall x :: f(x) ==
    g(x)
}

ghost predicate Quant5(f: int -> int, g: int -> int) {
  forall x :: f(x)
     == g(x)
}

function If0(s: string): int {
  if |s| == 3 then 2 else 3 + // warning: suspicious lack of parentheses (if-then-else)
    (2 * |s|)
}

function If1(s: string): int {
  if |s| == 3 then 2 else
    3 + (2 * |s|)
}

function If2(s: string): int {
  if |s| == 3 then 2 else (3 +
    2 * |s|)
}

function If3(s: string): int {
  if |s| == 3 then 2 else
    3 +
    2 * |s|
}

predicate Waterfall(A: bool, B: bool, C: bool, D: bool, E: bool) {
          A ==>
        B ==>
      C ==>
    D ==>
  E
}

ghost predicate MoreOps0(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) <== Q(x) <== // warning: suspicious lack of parentheses (rhs of <==)
    R(x)
}

ghost predicate MoreOps1(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) <== Q(x) <==>
    R(x)
}

ghost predicate MoreOps2(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) ==> Q(x) <==>
    R(x)
}

ghost predicate MoreOps3(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) ==> Q(x) <==>
    R(x) ==>
    P(x)
}

ghost predicate MoreOps4(P: int -> bool, Q: int -> bool, R: int -> bool) {
  forall x :: P(x) <==> Q(x) && // warning: suspicious lack of parentheses (rhs of <==>)
    R(x)
}

lemma IntLemma(x: int)

function StmtExpr0(x: int): int {/* TODO */ }

function StmtExpr1(x: int): int {
  if x == 17 then // warning: suspicious lack of parentheses (if-then-else)
    2
  else
     IntLemma(x);
    3
}

function StmtExpr2(x: int): int {
  if x == 17 then
    2
  else
    assert x != 17;
    3
}

function StmtExpr3(x: int): int {
  if x == 17 then // warning: suspicious lack of parentheses (if-then-else)
    2
  else
     assert x != 17;
    3
}

function FunctionWithDefaultParameterValue(x: int, y: int := 100): int

function UseDefaultValues(x: int): int {
  if x <= 0 then 0 else
    FunctionWithDefaultParameterValue(x - 1)
}

function Square(x: int): int {
  x * x
}

predicate Let0(lo: int, hi: int)
  requires lo <= hi
{
  forall x :: lo <= x < hi ==> var square := Square(x);
    0 <= square
}

ghost predicate Let1(P: int -> bool) {
  forall x :: 0 <= x && P(x) ==> var bigger :| x <= bigger;
    0 <= bigger
}

predicate SomeProperty<X>(x: X)

method Parentheses0(arr: array<int>, P: int -> bool)
{/* TODO */ }

method Parentheses1(w: bool, x: int)
{/* TODO */ }

datatype Record = Record(x: int, y: int)

method Parentheses2(w: bool, x: int, y: int)
{/* TODO */ }

method Parentheses3(w: bool, arr: array<int>, m: array2<int>, i: nat, j: nat)
  requires i < j < arr.Length <= m.Length0 <= m.Length1
{/* TODO */ }

codatatype Stream = More(head: int, tail: Stream)

method Parentheses4(w: bool, s: Stream, t: Stream)
{/* TODO */ }
/**** revisit the following when the original match'es are being resolved (https://github.com/dafny-lang/dafny/pull/2734)
datatype Color = Red | Blue

method Parentheses5(w: bool, color: Color) {/* TODO */ }
***/

module MyModule {
  function MyFunction(x: int): int
  lemma Lemma(x: int)
}

module QualifiedNames {/* TODO */ }  

module MatchAcrossMultipleLines {
  datatype PQ = P(int) | Q(bool)

  method M(s: set<PQ>)
    requires
      (forall pq | pq in s :: match pq {/* TODO */ })
  {
  }

  datatype YZ = Y | Z

  function F(A: bool, B: int, C: YZ): int
    requires C != Y
  {
    if A then B else match C {
      case Z => 3
    }
  }
}

