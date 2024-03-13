function contains(v: int, a: array<int>, n: int): bool
{
  exists j :: 0 <= j < n && a[j] == v
}

function upper_bound(v: int, a: array<int>, n: int): bool
{
  forall j :: 0 <= j < n ==> a[j] <= v
}

function is_max(m: int, a: array<int>, n: int): bool
{
  contains(m, a, n) && upper_bound(m, a, n)
}

method max(a: array<int>, n: int) returns (max: int)
{
  var i: int := 1;

  max := a[0];

  while i < n
		invariant i <= n;
		invariant is_max (max, a, i);
  {
    if a[i] > max {
      max := a[i];
    }
    i := i + 1;
  }
}

