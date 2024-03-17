// ASSIGNMENT P1
// CMSC 433 FALL 2023
// PERFECT SCORE:  100 POINTS
//
// This assignment contains nine questions, each of which involves writing Dafny
// code. You should include your solutions in a single Dafny file and submit it using
// Gradescope.
//
// Revision history
//
// 2023-09-22 2:50 pm   Fixed typo in Problem 3.


// Question 1 (5 points)
//
// Fill in a requires clause that enables Dafny to verify
// method PlusOne

method PlusOne (x : int) returns (y : int)
{
    y := x+1;
}


// Question 2 (5 points)
//
// Fill in requires clause(s) that enable(s) Dafny to verify the array bounds
// in method Swap (which swaps elements i and j in array a).

method Swap (a : array?<int>, i : int, j : int)
{
    var tmp : int := a[i];
    a[i] := a[j];
    a[j] := a[i];
}

// Question 3 (5 points)
//
// Give ensures clause(s) asserting that d is the result, and r the
// remainder, of dividing m by n.  Your clauses cannot use "/" or "%" (which are
// the Dafny division and mod operators, respectively). By definition, the
// remainder must be non-negative.

method IntDiv (m : int, n : int) returns (d : int, r : int)
{
    return m / n, m % n;
}

// Question 4 (5 points)
//
// Give ensures clause(s) asserting that the return value has the same
// length as array a and contains as its elements the sum of the
// corresponding elements in arrays a and b.

method ArraySum (a : array<int>, b : array<int>) returns (c : array<int>)
{
    c := new int [a.Length];  // Creates new array of size a.Length
    var i : int := 0;
    while (i < a.Length)
    {
        c[i] := a[i] + b[i];
        i := i + 1;
    }
}

// Question 5 (10 points)

// Euclid's algorithm is used to compute the greatest common divisor of two
// positive integers.  If m and n are two such integers, then gcd(m,n) is the
// largest positve integer that evenly divides both m and n, where j evenly divides i
// if and only if i % j == 0 (% is the Dafny mod operator).  Write requires and
// ensures clauses for the method header Euclid below.  Your requires clauses
// should also specify that the first argument is at least as large as the second.
// You do *not* need to implement the method!

method Euclid (m : int, n : int) returns (gcd : int)
{
    isSorted := true;
    var i : int := 1;
    if (a.Length < 2)
    {
        return;
    }
    else
    {
        while (i < a.Length)
        {
            if a[i-1] > a[i]
            {
                return false;
            }
            i := i+1;
        }
    }
}

// Question 7 (20 points)
//
// Implement, and have Dafny verify, the method IsPrime below, which returns true
// if and only if the given positive integer is prime.

method IsPrime (m : int) returns (isPrime : bool)
{
    isPrime := true; // asume is prime initially
    
    if m <= 1 {
        isPrime := false;
    } else {
        var i : int := 2;
        
        while (i < m)
        {
            if (m % i == 0)
            {
                isPrime := false;
                break;
            }
            i := i + 1;
        }
    }
    
}

// Question 8 (20 points)
//
// Implement, and have Dafny verify, the method Reverse below, which returns a new array
// aRev consisting of the elements of a, but in reverse order.  To create a new 
// array of ints use the Dafny command "new int[...]", where "..." is the number
// of elements in the array.

method Reverse (a : array<int>) returns (aRev : array<int>)
{
    aRev := new int[a.Length];
    var i : int := 0;
    while (i < a.Length)
    {
        aRev[i] := a[a.Length-i-1];
        i := i + 1;
    }
}

// Question 9 (20 points)
//
// Implement and verify method NoDups, which returns true if and only if there
// are no duplicate elements in array a.  Note that the requires clause allows
// you to assume that a is sorted, and that this precondition is necessary for
// the ensures clause to imply a lack of duplicates.

method NoDups (a : array<int>) returns (noDups : bool)
{
    noDups := true;
    var i : int := 1;

    if (a.Length < 2)
    {
        return;
    }

    while (i < a.Length)
    {
        if (a[i-1] == a[i])
        {
            noDups := false;
            break;
        }
        i := i + 1;
    }
}
