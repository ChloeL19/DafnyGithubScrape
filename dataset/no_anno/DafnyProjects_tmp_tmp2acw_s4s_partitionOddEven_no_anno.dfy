// Rearranges the elements in an array 'a' of natural numbers,
// so that all odd numbers appear before all even numbers.
method partitionOddEven(a: array<nat>) 
  modifies a
{
    var i := 0; // odd numbers are placed to the left of i
    var j := a.Length - 1; // even numbers are placed to the right of j
    while i <= j
     {
        if even(a[i]) && odd(a[j]) { a[i], a[j] := a[j], a[i]; }
        if odd(a[i]) { i := i + 1; }
        if even(a[j]) { j := j - 1; }
    }
}
 
predicate  odd(n: nat) { n % 2 == 1 }
predicate  even(n: nat) { n % 2 == 0 }

method testPartitionOddEven() {
    var a: array<nat> := new [] [1, 2, 3];
    partitionOddEven(a);
}

