predicate sorted_between (a:array<int>, from:nat, to:nat)
  reads a;
  requires a.Length > 0;
  requires from <= to;
  requires to <= a.Length;
{
  forall i,j :: from <= i < j < to && 0 <= i < j < a.Length ==> a[i] <= a[j]
}

predicate sorted (a:array<int>)
  reads a;
  requires a.Length > 0;
{
  sorted_between (a, 0, a.Length)
}

predicate beq(a:seq<int>, b:seq<int>, k1:nat, k2:nat)
  requires k1 <= k2 < |a|;
  requires |a| == |b|;
{
  forall i :: k1 <= i <= k2 ==> a[i] == b[i]
}

predicate partitioned(a:array<int>, l1:nat, u1:nat, l2:nat, u2:nat)
  requires a.Length > 0;
  requires l1 <= u1 <= l2 <= u2 < a.Length;
  reads(a);
{
  forall i, j :: l1 <= i <= u1 < l2 <= j <= u2 ==> a[i] <= a[j]
}
