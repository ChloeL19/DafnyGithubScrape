method ZapNegatives(a: array<int>) 
modifies a
ensures forall i :: 0 <= i < a.Length ==> if old(a[i]) < 0 then a[i] == 0 
											else a[i] == old(a[i])
ensures a.Length == old(a).Length
{/* TODO */ }

method Main() 
{/* TODO */ }

