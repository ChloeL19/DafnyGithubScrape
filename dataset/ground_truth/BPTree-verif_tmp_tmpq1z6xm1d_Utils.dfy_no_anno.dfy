
// method CountLessThan(numbers: set<int>, threshold: int) returns (count: int)
// //   ensures count == |set i | i in numbers && i < threshold|
//     ensures count == |SetLessThan(numbers, threshold)|
// {
//   count := 0;
//   var ss := numbers;
//   while ss != {}
//     decreases |ss|
//   {
//     var i: int :| i in ss;
//     ss := ss - {i};
//     if i < threshold {
//       count := count + 1;
//     }

//   }
//   assert count == |SetLessThan(numbers, threshold)|;
// //   assert count == |set i | i in numbers && i < threshold|;
// }

function SetLessThan(numbers: set<int>, threshold: int): set<int>
{
  set i | i in numbers && i < threshold
}

method Main()
{
  //   var s: set<int> := {1, 2, 3, 4, 5};
  //   var c: int := CountLessThan(s, 4);
  //   print c;
  // assert c == 3;


  // if you manualy create set and sequence with same elements, |s|==|t| works
  var t: seq<int> := [1, 2, 3];
  var s: set<int> := {1, 2, 3};
  s := set x | x in t;
  // assert |s| == |t|; // not verifying
  // assert |s| == 3; // not verifying

  // other expriments
  set_memebrship_implies_cardinality(s, set x | x in t);  // s and the other argument is the same thing
  var s2 : set<int> := set x | x in t;
  s2 := {1, 2, 3};
  // assert |s| == |s2|; // may not hold
  set_memebrship_implies_cardinality(s, s2); 
}

lemma set_memebrship_implies_cardinality_helper<A>(s: set<A>, t: set<A>, s_size: int)
  decreases s_size {
  if s_size == 0 {
  } else {
    var s_hd;
    // assign s_hd to a value *such that* s_hd is in s (see such_that expressions)
    s_hd :| s_hd in s;
    set_memebrship_implies_cardinality_helper(s - {s_hd}, t - {s_hd}, s_size - 1);
  }
}


lemma set_memebrship_implies_cardinality<A>(s: set<A>, t: set<A>)
  set_memebrship_implies_cardinality_helper(s, t, |s|);
}


/*
lemma Bijection(arr: seq<int>, s: set<int>) // returns (bool)
{
    var mapping: map<int, int> := map[];
    
    // Establish the bijection
    for i := 0 to |arr| {
        mapping := mapping[arr[i]:= arr[i]];
    }

    // Prove injectiveness
    // assert forall x :: x in s ==> exists i :: 0 <= i < |arr|-1 && arr[i] == x;

    // Conclude equinumerosity
    // assert |s| == |arr|;
    // return true;
}
*/

function seqSet(nums: seq<int>, index: nat): set<int> {
    set x | 0 <= x < index < |nums| :: nums[x]
}

lemma containsDuplicateI(nums: seq<int>) returns (containsDuplicate: bool)
{
    var windowGhost: set<int> := {};
    var windowSet: set<int> := {};
    for i:= 0 to |nums| 
    {
        windowGhost := windowSet;
        if nums[i] in windowSet { // does not verify
        // if nums[i] in seqSet(nums, i) { //verifies
            return true;
        }
        windowSet := windowSet + {nums[i]};
    }
    return false;
}

// lemma numElemsOfSet(a: seq<int>)
//   requires sorted(a)
// {
//   assert distinct(a);
//   var s := set x | x in a;
//   assert forall x :: x in s ==> x in a[..];
//   assert forall x :: x in a ==> x in s;
//   assert |s| == |a|;
// }

// lemma CardinalitySetEqualsArray(a: seq<int>, s: set<int>)
//   requires s == set x | x in a
//   requires distinct(a)
//   ensures |s| == |a|
// {
//     assert forall x :: x in s ==> exists i :: 0 <= i < |a| && a[i] == x;
//     assert forall i, j :: 0 <= i < |a| && 0 <= j < |a| && i != j ==> a[i] != a[j];
//     // Assert that each element in the array is in the set
//     assert forall i :: 0 <= i < |a| ==> a[i] in s;
//     // Assert that the set contains exactly the elements in the array
//     assert s == set x | x in a;
//     // Assert that the set is a subset of the array
//     assert forall x :: x in s <==> x in a;

//     // Conclude the equivalence
//     assert |s| == |a|;
// }


/*
lemma memebrship_implies_cardinality_helper<A>(s: set<A>, t: seq<A>, s_size: int)
  decreases s_size {
    if s_size == 0 {
    } else {
      var t_hd;
      t_hd := t[0];
      ghost var t_h := set x | x in t[1..];
      memebrship_implies_cardinality_helper(s - {t_hd}, t[1..], s_size - 1);
    }
}


lemma memebrship_implies_cardinality<A>(s: set<A>, t: seq<A>)
    memebrship_implies_cardinality_helper(s, t, |s|);
}
*/

lemma set_memebrship_implies_equality_helper<A>(s: set<A>, t: set<A>, s_size: int)
  decreases s_size {
  if s_size == 0 {
  } else {
    var s_hd;
    // assign s_hd to a value *such that* s_hd is in s (see such_that expressions)
    s_hd :| s_hd in s;
    set_memebrship_implies_equality_helper(s - {s_hd}, t - {s_hd}, s_size - 1);
  }
}


lemma set_memebrship_implies_equality<A>(s: set<A>, t: set<A>)
  set_memebrship_implies_equality_helper(s, t, |s|);
}

// TODO play with this for keys==Contents
lemma set_seq_equality(s: set<int>, t: seq<int>)
{
  var s2 : set<int> := set x | x in t;
  set_memebrship_implies_equality_helper(s, s2, |s|);
  // assert |s2| == |t|;
  // assert |s| == |t|;
}


ghost predicate SortedSeq(a: seq<int>)
  //sequence is sorted from left to right
{
  (forall i,j :: 0<= i< j < |a| ==> ( a[i] < a[j] ))
}

method GetInsertIndex(a: array<int>, limit: int, x:int) returns (idx:int)
  // get index so that array stays sorted
{
  idx := limit;
  for i := 0 to limit
  {
    if x < a[i] {
      idx := i;
      break;
    }
  }
}

predicate sorted(a: seq<int>)
{
  forall i,j :: 0 <= i < j < |a| ==> a[i] < a[j]
}

predicate distinct(a: seq<int>)
{
  forall i,j :: (0 <= i < |a| && 0 <= j < |a| && i != j) ==> a[i] != a[j]
}

predicate sorted_eq(a: seq<int>)
{
  forall i,j :: 0 <= i < j < |a| ==> a[i] <= a[j]
}

predicate lessThan(a:seq<int>, key:int) {
  forall i :: 0 <= i < |a| ==> a[i] < key
}

predicate greaterThan(a:seq<int>, key:int) {
  forall i :: 0 <= i < |a| ==> a[i] > key
}

predicate greaterEqualThan(a:seq<int>, key:int) {
  forall i :: 0 <= i < |a| ==> a[i] >= key
}
/*
method InsertSorted(a: array<int>, key: int ) returns (b: array<int>)
{
  b:= new int[a.Length + 1];

  ghost var k := 0;
  b[0] := key;

  ghost var a' := a[..];

  var i:= 0;
  while (i < a.Length)
  {
    if(a[i]<key)
    {
      b[i]:= a[i];
      b[i+1] := key;
      k := i+1;
    }
    else if (a[i] >= key)
    {
      b[i+1] := a[i];
    }
    i := i+1;
  }
}
*/

lemma DistributiveLemma(a: seq<bool>, b: seq<bool>)
{
  if a == [] {
  } else {
    DistributiveLemma(a[1..], b);
  }
}
function count(a: seq<bool>): nat
{
  if |a| == 0 then 0 else
    (if a[0] then 1 else 0) + count(a[1..])
}


lemma DistributiveIn(a: seq<int>, b:seq<int>, k:int, key:int)
{
}

lemma DistributiveGreater(a: seq<int>, b:seq<int>, k:int, key:int)
{
    // assert ((forall j :: 0 <= j < k ==> b[j] > 0) && (forall j :: k <= j < |a| ==> b[j] > 0)) ==> (forall j :: 0 <= j < |b| ==> b[j] > 0);
}

// verifies in more than 45 seconds, but less than 100 seconds
method InsertIntoSorted(a: array<int>, limit:int, key:int) returns (b: array<int>)
{
    b:= new int[a.Length];

    ghost var k := 0;
    b[0] := key;

    ghost var a' := a[..];

    var i:= 0;
    while (i < limit)
    {
        if(a[i]<key)
        {
            b[i]:= a[i];
            b[i+1] := key;
            k := i+1;
        }
        else if (a[i] >= key)
        {
            b[i+1] := a[i];
        } 
        i := i+1;
    }
    // assert b[..limit+1] == a[..k] + [key] + a[k..limit];
    DistributiveIn(a[..limit], b[..limit+1], k, key);
    DistributiveGreater(a[..limit], b[..limit+1], k, key);
    // assert forall i :: 0 <= i < limit + 1 ==> b[i] > 0;

    ghost var b' := b[..];
    i := limit + 1;
    while i < b.Length 
    {
        b[i] := 0;
        i := i + 1;
    }
}





    
