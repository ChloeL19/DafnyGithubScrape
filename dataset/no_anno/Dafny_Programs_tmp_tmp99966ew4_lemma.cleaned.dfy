lemma SkippingLemma(a : array<int>, j : int)
{
   var i := j;
   while i < j + a[j] && i < a.Length
   decreases j + a[j] - i
      invariant i < a.Length ==> a[j] - (i-j) <= a[i]
      invariant forall k :: j <= k < i && k < a.Length ==> a[k] != 0
   {
      i := i + 1;
   }
}
method FindZero(a: array<int>) returns (index: int)
{
   index := 0;
   while index < a.Length
   decreases a.Length - index
      invariant 0 <= index
      invariant forall k :: 0 <= k < index && k < a.Length ==> a[k] != 0
   {
      if a[index] == 0 { return; }
      SkippingLemma(a, index);
      index := index + a[index];
   }
   index := -1;
}

