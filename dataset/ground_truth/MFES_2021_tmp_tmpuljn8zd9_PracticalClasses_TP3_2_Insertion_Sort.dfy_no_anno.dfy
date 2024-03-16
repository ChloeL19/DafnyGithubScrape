// Sorts array 'a' using the insertion sort algorithm.
method insertionSort(a: array<int>) 
{
    var i := 0;
    while i < a.Length 
        decreases a.Length - i 
    {
        var j := i;
        while j > 0 && a[j-1] > a[j] 
            decreases j
        {
            a[j-1], a[j] := a[j], a[j-1];
            j := j - 1;
        }
        i := i + 1;
    }
}

// Checks if array 'a' is sorted.
predicate isSorted(a: array<int>, from: nat, to: nat)
  reads a
{
    forall i, j :: from <= i < j < to ==> a[i] <= a[j]
}

// Simple test case to check the postcondition
method testInsertionSort() {
  var a := new int[] [ 9, 4, 3, 6, 8];
  insertionSort(a);
}

