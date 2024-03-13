// Assuming Array is Object Blood
// Blood Array<int>
// index

method Find(blood: array<int>, key: int) returns (index: int)
{
   index := 0;
   while index < blood.Length
      invariant 0 <= index <= blood.Length
      invariant forall k :: 0 <= k < index ==> blood[k] != key
   {
      if blood[index] == key { return; }
      index := index + 1;
   }
   index := -1;
}

