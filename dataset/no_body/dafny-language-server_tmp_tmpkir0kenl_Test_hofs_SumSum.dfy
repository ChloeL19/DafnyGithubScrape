// RUN: %dafny /compile:0 /rprint:"%t.rprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// Tests that come down to comparing the bodies of (possibly nested) functions.
// Many of these currently require far more effort than one would like.
// KRML, 2 May 2016

function Sum(n: nat, f: int -> int): int
{
  if n == 0 then 0 else f(n-1) + Sum(n-1, f)
}

lemma Exchange(n: nat, f: int -> int, g: int -> int)
  requires forall i :: 0 <= i < n ==> f(i) == g(i)
  ensures Sum(n, f) == Sum(n, g)
{/* TODO */ }

lemma ExchangeEta(n: nat, f: int -> int, g: int -> int)
  requires forall i :: 0 <= i < n ==> f(i) == g(i)
  ensures Sum(n, x => f(x)) == Sum(n, x => g(x))
{/* TODO */ }

lemma NestedAlphaRenaming(n: nat, g: (int,int) -> int)
  ensures Sum(n, x => Sum(n, y => g(x,y))) == Sum(n, a => Sum(n, b => g(a,b)))
{/* TODO */ }

lemma DistributePlus1(n: nat, f: int -> int)
  ensures Sum(n, x => 1 + f(x)) == n + Sum(n, f)
{/* TODO */ }

lemma Distribute(n: nat, f: int -> int, g: int -> int)
  ensures Sum(n, x => f(x) + g(x)) == Sum(n, f) + Sum(n, g)
{/* TODO */ }

lemma {:induction false} PrettyBasicBetaReduction(n: nat, g: (int,int) -> int, i: int)
  ensures (x => Sum(n, y => g(x,y)))(i) == Sum(n, y => g(i,y))
{/* TODO */ }

lemma BetaReduction0(n: nat, g: (int,int) -> int, i: int)
  ensures (x => Sum(n, y => g(x,y)))(i) == Sum(n, y => g(i,y))
{/* TODO */ }

lemma BetaReduction1(n': nat, g: (int,int) -> int, i: int)
  ensures g(i,n') + Sum(n', y => g(i,y)) == (x => g(x,n') + Sum(n', y => g(x,y)))(i);
{/* TODO */ }

lemma BetaReductionInside(n': nat, g: (int,int) -> int)
  ensures Sum(n', x => g(x,n') + Sum(n', y => g(x,y)))
       == Sum(n', x => (w => g(w,n'))(x) + (w => Sum(n', y => g(w,y)))(x))
{/* TODO */ }

lemma L(n: nat, n': nat, g: (int, int) -> int)
  requires && n == n' + 1
  ensures Sum(n, x => Sum(n, y => g(x,y)))
       == Sum(n', x => Sum(n', y => g(x,y))) + Sum(n', x => g(x,n')) + Sum(n', y => g(n',y)) + g(n',n')
{/* TODO */ }

lemma Commute(n: nat, g: (int,int) -> int)
  ensures Sum(n, x => Sum(n, y => g(x,y))) == Sum(n, x => Sum(n, y => g(y,x)))
// TODO

lemma CommuteSum(n: nat, g: (int,int) -> int)
  ensures Sum(n, x => Sum(n, y => g(x,y))) == Sum(n, y => Sum(n, x => g(x,y)))
// TODO

