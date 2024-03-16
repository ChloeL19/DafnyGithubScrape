
function sorted(a: array<int>) : bool
    reads a
{
   forall i,j : int :: 0 <= i < j < a.Length ==> a[i] <= a[j]
}

method BinarySearch(a: array<int>, x: int) returns (index: int)
{
    var low := 0;
    var high := a.Length - 1;
    var mid := 0;
    
    while (low <= high) 
    {
        mid := (high + low) / 2;
        if a[mid] < x {
            low := mid + 1;
        }
        else if a[mid] > x {
            high := mid - 1;
        }
        else {
            return mid;
        }
    }
    return -1;
}
