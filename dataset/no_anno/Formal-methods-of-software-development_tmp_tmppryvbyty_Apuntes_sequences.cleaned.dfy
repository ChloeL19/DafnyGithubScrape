// **** SEQUENCES ****
/* Sets of various types form one of the core tools of verification for Dafny. Sets represent an 
orderless collection of elements, without repetition. Like sequences, sets are immutable value 
types. This allows them to be used easily in annotations, without involving the heap, as a set 
cannot be modified once it has been created. */
predicate sorted(s: seq<int>){ forall i,j :: 0 <= i < j < |s| ==> s[i] <= s[j] }
predicate sorted(s: seq<int>){ forall i,j :: 0 <= i < j < |s| ==> s[i] <= s[j] }
predicate sorted2(s: seq<int>){ 0 < |s| ==> (forall i :: 0 < i < |s| ==> s[0] <= s[i]) && sorted2(s[1..]) }
predicate sorted2(s: seq<int>){ 0 < |s| ==> (forall i :: 0 < i < |s| ==> s[0] <= s[i]) && sorted2(s[1..]) }

// The notation s[1..] is slicing the sequence. It means starting at the first element, 
// take elements until you reach the end. 

// The notation s[i..j] is like the last mentiones, but taking elements starting in i and 
// ending in j.

method ej2()
{
    var s := [1, 2, 3, 4, 5];
    assert s[|s|-1] == 5; //access the last element
    assert s[|s|-1..|s|] == [5]; //slice just the last element, as a singleton
    assert s[1..] == [2, 3, 4, 5]; // everything but the first
    assert s[..|s|-1] == [1, 2, 3, 4]; // everything but the last
    assert s == s[0..] == s[..|s|] == s[0..|s|]; // the whole sequence
    
    assert [1,2,3] == [1] + [2,3];
    assert s == s + [];
    assert forall i :: 0 <= i <= |s| ==> s == s[..i] + s[i..];
    var s2 := [1, 2, 3, 4, 5];
    assert s2[..|s2|-1] == [1, 2, 3, 4]; 

    assert forall a: seq<int>, b: seq<int>, c: seq<int> :: (a + b) + c == a + (b + c);
    
    assert 5 in s;
    assert 0 !in s;

    // Sequence contains elements which are indices into the sequence:
    var p := [2,3,1,0];
    //assert forall i :: i in p ==> 0 <= i < |s|;

    // s[i := v] // replace index i by v in seq s
    var s3 := [1,2,3,4];
    assert s3[2 := 6] == [1,2,6,4];

    var a := new int[3]; // 3 element array of ints
    a[0], a[1], a[2] := 0, 3, -1;
    var s4 := a[..];
    //assert s4 == [0, 3, -1];

}
