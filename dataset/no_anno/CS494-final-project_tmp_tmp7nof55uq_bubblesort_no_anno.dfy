//Bubblesort CS 494 submission
//References: https://stackoverflow.com/questions/69364687/how-to-prove-time-complexity-of-bubble-sort-using-dafny/69365785#69365785


// predicate checks if elements of a are in ascending order, two additional conditions are added to allow us to sort in specific range within array
predicate sorted(a:array<int>, from:int, to:int)
{
  forall x, y :: from <= x < y < to ==> a[x] <= a[y]
}

//helps ensure swapping is valid, it is used inside the nested while loop to make sure linear order is being kept 
predicate pivot(a:array<int>, to:int, pvt:int)
{
  forall x, y :: 0 <= x < pvt < y < to ==> a[x] <= a[y] // all values within the array should be in ascending order
}

// Here having the algorithm for the bubblesort

method BubbleSort (a: array<int>)
{
  var i := 1;

  while (i < a.Length)
  {
    var j := i;

    //this while loop inherits any previous pre/post conditions. It checks that 
    while (j > 0)
    {
    // Here it also simplifies the remaining invariants to handle the empty array. 
      if (a[j-1] > a[j]) { // reverse iterate through range within the array
        a[j - 1], a[j] := a[j], a[j - 1]; // swaps objects if the IF condition is met
      }
      j := j - 1; // decrement j
    }
    i := i+1; // increment i
  }

}

