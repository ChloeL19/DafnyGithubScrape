function sum_up_to (n: nat): nat
{
  if (n == 0) then 0
  else sum_up_to (n-1) + 1
}


method SumUpTo (n: nat) returns (r: nat)
  ensures r == sum_up_to (n);
{/* TODO */ }

function total (a: seq<nat>) : nat
{
  if |a| == 0 then 0
  else total (a[0..|a|-1]) + a[|a|-1]
}

lemma total_lemma (a: seq<nat>, i:nat) 
  requires |a| > 0;
  requires 0 <= i < |a|;
  ensures total (a[0..i]) + a[i] == total (a[0..i+1]);
{/* TODO */ }

method Total (a: seq<nat>) returns (r:nat)
  ensures r == total (a[0..|a|]); 
{/* TODO */ }

