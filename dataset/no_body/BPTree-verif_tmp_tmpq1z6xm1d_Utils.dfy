
// method CountLessThan(numbers: set<int>, threshold: int) returns (count: int)
// //   ensures count == |set i | i in numbers && i < threshold|
//     ensures count == |SetLessThan(numbers, threshold)|
// {/* TODO */ }

function SetLessThan(numbers: set<int>, threshold: int): set<int>
{
  set i | i in numbers && i < threshold
}

method Main()
{/* TODO */ }

lemma set_memebrship_implies_cardinality_helper<A>(s: set<A>, t: set<A>, s_size: int)
  requires s_size >= 0 && s_size == |s|
  requires forall x :: x in s <==> x in t
  ensures |s| == |t|
  decreases s_size {/* TODO */ }


lemma set_memebrship_implies_cardinality<A>(s: set<A>, t: set<A>)
  requires forall x :: x in s <==> x in t
  ensures |s| == |t| {/* TODO */ }


/*
lemma Bijection(arr: seq<int>, s: set<int>) // returns (bool)
  requires sorted(arr)
  // requires forall x, y :: x in s && y in s && x != y ==> x < y
  ensures  |s| == |arr|
{/* TODO */ }
*/

function seqSet(nums: seq<int>, index: nat): set<int> {
    set x | 0 <= x < index < |nums| :: nums[x]
}

lemma containsDuplicateI(nums: seq<int>) returns (containsDuplicate: bool)
    ensures containsDuplicate ==>  exists i,j :: 0 <= i < j < |nums| && nums[i] == nums[j]
{
    var windowGhost: set<int> := {};
    var windowSet: set<int> := {};
    for i:= 0 to |nums| 
        invariant 0 <= i <= |nums|
        invariant forall j :: 0 <= j < i < |nums|  ==> nums[j] in windowSet
        // invariant forall x :: x in windowSet ==> x in nums
        invariant forall x :: x in windowSet ==> x in nums[0..i]
        invariant seqSet(nums, i) <= windowSet
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
// {/* TODO */ }

// lemma CardinalitySetEqualsArray(a: seq<int>, s: set<int>)
//   requires s == set x | x in a
//   requires distinct(a)
//   ensures |s| == |a|
// {/* TODO */ }


/*
lemma memebrship_implies_cardinality_helper<A>(s: set<A>, t: seq<A>, s_size: int)
  requires s_size >= 0 && s_size == |s|
  requires forall x :: x in s <==> x in t
  requires forall i, j :: (0 <= i < |t| && 0 <= j < |t| && i != j ) ==> t[i] != t[j]
  requires |set x | x in t| == |t| 
  ensures |s| == |t|
  decreases s_size {/* TODO */ }


lemma memebrship_implies_cardinality<A>(s: set<A>, t: seq<A>)
  requires forall x :: x in s <==> x in t
  ensures |s| == |t| {/* TODO */ }
*/

lemma set_memebrship_implies_equality_helper<A>(s: set<A>, t: set<A>, s_size: int)
  requires s_size >= 0 && s_size == |s|
  requires forall x :: x in s <==> x in t
  ensures s == t
  decreases s_size {/* TODO */ }


lemma set_memebrship_implies_equality<A>(s: set<A>, t: set<A>)
  requires forall x :: x in s <==> x in t
  ensures s == t {/* TODO */ }

// TODO play with this for keys==Contents
lemma set_seq_equality(s: set<int>, t: seq<int>)
  requires distinct(t)
  requires forall x :: x in t <==> x in s
{/* TODO */ }


ghost predicate SortedSeq(a: seq<int>)
  //sequence is sorted from left to right
{
  (forall i,j :: 0<= i< j < |a| ==> ( a[i] < a[j] ))
}

method GetInsertIndex(a: array<int>, limit: int, x:int) returns (idx:int)
  // get index so that array stays sorted
  requires x !in a[..]
  requires 0 <= limit <= a.Length
  requires SortedSeq(a[..limit])
  ensures 0<= idx <= limit
  ensures SortedSeq(a[..limit])
  ensures idx > 0 ==> a[idx-1]< x
  ensures idx < limit ==> x < a[idx]
{/* TODO */ }

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
  requires sorted_eq(a[..])
  ensures sorted_eq(b[..])
{/* TODO */ }
*/

lemma DistributiveLemma(a: seq<bool>, b: seq<bool>)
  ensures count(a + b) == count(a) + count(b)
{/* TODO */ }
function count(a: seq<bool>): nat
{
  if |a| == 0 then 0 else
    (if a[0] then 1 else 0) + count(a[1..])
}


lemma DistributiveIn(a: seq<int>, b:seq<int>, k:int, key:int)
    requires |a| + 1 == |b| 
    requires 0 <= k <= |a|
    requires b == a[..k] + [key] + a[k..]
    ensures forall i :: 0 <= i < |a| ==> a[i] in b
{/* TODO */ }

lemma DistributiveGreater(a: seq<int>, b:seq<int>, k:int, key:int)
    requires |a| + 1 == |b| 
    requires 0 <= k <= |a|
    requires b == a[..k] + [key] + a[k..]
    requires forall j :: 0 <= j < |a| ==> a[j] > 0
    requires key > 0
    ensures forall i :: 0 <= i < |b| ==> b[i] > 0
{/* TODO */ }

// verifies in more than 45 seconds, but less than 100 seconds
method InsertIntoSorted(a: array<int>, limit:int, key:int) returns (b: array<int>)
    requires key > 0
    requires key !in a[..]
    requires 0 <= limit < a.Length
    requires forall i :: 0 <= i < limit ==> a[i] > 0
    requires forall i :: limit <= i < a.Length ==> a[i] == 0
    requires sorted(a[..limit]) 
    ensures b.Length == a.Length
    ensures sorted(b[..(limit+ 1)])
    ensures forall i :: limit + 1 <= i < b.Length ==> b[i] == 0  
    ensures forall i :: 0 <= i < limit ==> a[i] in b[..]
    ensures forall i :: 0 <= i < limit + 1 ==> b[i] > 0
{/* TODO */ }





    
