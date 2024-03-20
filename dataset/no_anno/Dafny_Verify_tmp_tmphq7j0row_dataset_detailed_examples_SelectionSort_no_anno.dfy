// Works by dividing the input list into two parts: sorted and unsorted. At the beginning, 
// the sorted part is empty and the unsorted part contains all the elements.
method SelectionSort(a: array<int>)
  modifies a
  // Ensures the final array is sorted in ascending order
{
  var n := 0;
  while n != a.Length
    // Ensures that n is always within the bounds of the array
  {
    var mindex, m := n, n;
    while m != a.Length
      // Ensures that mindex is always within the bounds of the array
    {
      if a[m] < a[mindex] {
        mindex := m;
      }
      m := m + 1;
    }
    // Swaps the first element of the unsorted array with the current smallest element
    // in the unsorted part if it is smaller
    if a[mindex] < a[n] {
      a[mindex], a[n] := a[n], a[mindex];
    }
    n := n + 1;
  }  
}
