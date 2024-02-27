/* Challenge 1 */

predicate inplace(a : array<int>, l : int, m : int, h : int)
  requires 0 <= l <= m <= h <= a.Length;
  reads a;
{
  forall i,j :: l <= i < m <= j < h ==> a[i] < a[j]
}

method Swap(a : array<int>, k : int, k' : int)
  requires a.Length > 0;
  requires 0 <= k  < a.Length;
  requires 0 <= k' < a.Length;
  modifies a;
  ensures a[k] == old(a[k']);
  ensures a[k'] == old(a[k]);
  ensures forall i :: (0 <= i < a.Length) && (i !in {k, k'}) ==> a[i] == old(a[i])
  ensures multiset(a[..]) == multiset(old(a[..]))
{
  a[k], a[k'] := a[k'], a[k];
}

method Partition(A : array<int>, s : int, l : int, X : int) returns (m : int, n : int)
  requires A.Length > 0;
  requires 0 <= s <= l <= A.Length;
  requires 0 <  s <= l <= A.Length ==> inplace(A, 0, s, A.Length);
  requires 0 <= s <= l <  A.Length ==> inplace(A, 0, l, A.Length);
  modifies A;
  /* Expected behaviour */
  ensures 0 <= s <= m <= n <= l <= A.Length
  ensures forall i :: s <= i < m ==> A[i] < X;
  ensures forall i :: m <= i < n ==> A[i] == X;
  ensures forall i :: n <= i < l ==> A[i] > X;
  /* No unexpected changes occured */
  ensures s > 0        ==> forall i :: 0 <= i < s        ==> A[i] == old(A[i]);
  ensures l < A.Length ==> forall i :: l <= i < A.Length ==> A[i] == old(A[i]);
  ensures multiset(A[..]) == multiset(old(A[..]));
  /* Assure partitioning is maintained */
  ensures 0 <  s <= l <= A.Length ==> inplace(A, 0, s, A.Length);
  ensures 0 <= s <= l <  A.Length ==> inplace(A, 0, l, A.Length);
{
  var k := s;
  m, n := s, l;
  while k < n
    invariant 0 <= s <= m <= k <= n <= l <= A.Length;
    invariant forall i :: s <= i < m ==> A[i] < X;
    invariant forall i :: m <= i < k ==> A[i] == X;
    invariant forall i :: n <= i < l ==> A[i] > X;
    /* No unexpected changes occured */
    invariant s > 0        ==> forall i :: 0 <= i < s        ==> A[i] == old(A[i]);
    invariant l < A.Length ==> forall i :: l <= i < A.Length ==> A[i] == old(A[i]);
    invariant multiset(A[..]) == multiset(old(A[..]));
    /* Assure partitioning is maintained */
    invariant 0 < s <= l <= A.Length ==> inplace(A, 0, s, A.Length);
    invariant 0 <= s <= l < A.Length ==> inplace(A, 0, l, A.Length);
    decreases n - k;
  {

    if A[k] < X {
      Swap(A, m, k);
      m := m + 1;
      k := k + 1;
    } else if A[k] == X {
      k := k + 1;
    } else if A[k] > X {
      Swap(A, n-1, k);
      n := n - 1;
    }
  }
}

