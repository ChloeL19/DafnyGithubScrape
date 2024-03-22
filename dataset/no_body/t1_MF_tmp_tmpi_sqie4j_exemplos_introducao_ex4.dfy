function Fat(n: nat): nat
{
   if n == 0 then 1 else n * Fat(n-1)
}

method Fatorial(n:nat)  returns (r:nat)
  ensures r == Fat(n)
{/* TODO */ }
