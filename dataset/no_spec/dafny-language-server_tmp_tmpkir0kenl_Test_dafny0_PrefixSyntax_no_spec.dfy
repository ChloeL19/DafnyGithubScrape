// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype TextProcessing =
  | TeX    // prefix |
  | LaTeX
  | Madoko

predicate InfixStyle(x: int, y: int, t: TextProcessing)
{
  (t == TeX ==> x < y) &&
  (t == LaTeX || t == TeX ==> x == 100 && y == 1000) &&
  (t == Madoko ==> 0 <= x || 0 <= y)
}

predicate TLA_plus_Style(x: int, y: int, t: TextProcessing)
{
  // This expression is semantically the same as the one in InfixStyle
  && (t == TeX ==> x < y)
  && (|| t == LaTeX
     || t == TeX
    ==>
     && x == 100
     && y == 1000
     )
  && (t == Madoko ==> || 0 <= x || 0 <= y)
}

lemma Same(x: int, y: int, t: TextProcessing)
{
}

datatype MyRecord = | MakeItHere(z: int)

function UnitConjunct(y: int): bool
{
  && y == 5
}

function UnitDisjunct(y: int): bool
{
  || y == 5
}

lemma Units(y: int)
{
}

function MyPredicate(y: int): bool
{
  // the <==> in the following line has lower precedence than the unit disjunnctions
  || 5 + y == 0 <==> && 10 + y == 0
}


function MyPredicateClean(y: int): bool
{
  5 + y == 0 <==> 10 + y == 0
}

lemma MyPred(y: int)
{
}

lemma CheckMyPred_0(y: int)
{
}

lemma CheckMyPred_1(y: int)
{
}

