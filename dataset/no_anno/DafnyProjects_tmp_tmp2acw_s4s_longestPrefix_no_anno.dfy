// MFES, Exam 8/Sept/20201, Exercise 5 

// Computes the length (i) of the longest common prefix (initial subarray) 
// of two arrays a and b. 
method longestPrefix(a: array<int>, b: array <int>) returns (i: nat) 
{
    i := 0;
    while i < a.Length && i < b.Length && a[i] == b[i]
    {
        i := i + 1;
    }
}
 
// Test method with an example.
method testLongestPrefix() {
    var a := new int[] [1, 3, 2, 4, 8];
    var b := new int[] [1, 3, 3, 4];
    var i := longestPrefix(a, b);
}

