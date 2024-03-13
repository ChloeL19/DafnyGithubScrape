predicate sorted(a: array?<int>, l: int, u: int)
  {
    forall i, j :: 0 <= l <= i <= j <= u < a.Length ==> a[i] <= a[j]
  }
predicate partitioned(a: array?<int>, i: int)
  {
    forall k, k' :: 0 <= k <= i < k' < a.Length ==> a[k] <= a[k']
  }

method BubbleSort(a: array?<int>)
  {
    var i := a.Length - 1;
    while(i > 0)
   invariant sorted(a, i, a.Length-1)
   invariant partitioned(a, i)
   {
        var j := 0;
        while (j < i)
        invariant 0 < i < a.Length && 0 <= j <= i
        invariant sorted(a, i, a.Length-1)
        invariant partitioned(a, i)
        invariant forall k :: 0 <= k <= j ==> a[k] <= a[j]
          {
            if(a[j] > a[j+1])
              {
                a[j], a[j+1] := a[j+1], a[j];
              }
              j := j + 1;
          }
          i := i -1;
      }
  }
  
method Main() {
method Main() {
  var a := new int[5];
  a[0], a[1], a[2], a[3], a[4] := 9, 4, 6, 3, 8;
  BubbleSort(a);
  var k := 0;
  while(k < 5) { print a[k], "\n"; k := k+1;}
}
