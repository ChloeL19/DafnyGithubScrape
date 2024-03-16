function contains(v: int, a: array<int>, n: int): bool
reads a
{
  exists j :: 0 <= j < n && a[j] == v
}

function upper_bound(v: int, a: array<int>, n: int): bool
reads a
{
  forall j :: 0 <= j < n ==> a[j] <= v
}

function is_max(m: int, a: array<int>, n: int): bool
reads a
{
  contains(m, a, n) && upper_bound(m, a, n)
}

method max(a: array<int>, n: int) returns (max: int)
{
  var i: int := 1;

  max := a[0];

  while i < n
  {
    if a[i] > max {
      max := a[i];
    }
    i := i + 1;
  }
}

