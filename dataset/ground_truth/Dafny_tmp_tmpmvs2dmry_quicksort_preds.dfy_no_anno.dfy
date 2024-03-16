predicate sorted_between (a:array<int>, from:nat, to:nat)
  reads a;
{
  forall i,j :: from <= i < j < to && 0 <= i < j < a.Length ==> a[i] <= a[j]
}

predicate sorted (a:array<int>)
  reads a;
{
  sorted_between (a, 0, a.Length)
}

predicate beq(a:seq<int>, b:seq<int>, k1:nat, k2:nat)
{
  forall i :: k1 <= i <= k2 ==> a[i] == b[i]
}

predicate partitioned(a:array<int>, l1:nat, u1:nat, l2:nat, u2:nat)
  reads(a);
{
  forall i, j :: l1 <= i <= u1 < l2 <= j <= u2 ==> a[i] <= a[j]
}
