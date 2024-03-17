lemma SkippingLemma(a : array<int>, j : int)
{
   var i := j;
   while i < j + a[j] && i < a.Length
   {
      i := i + 1;
   }
}
method FindZero(a: array<int>) returns (index: int)
{
   index := 0;
   while index < a.Length
   {
      if a[index] == 0 { return; }
      SkippingLemma(a, index);
      index := index + a[index];
   }
   index := -1;
}

