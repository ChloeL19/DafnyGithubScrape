
module Seq {
    export reveals *
    function ToSet<A>(xs: seq<A>): set<A>
        ensures forall x :: x in ToSet(xs) ==> x in xs
        ensures forall x :: x !in ToSet(xs) ==> x !in xs
    {
        if xs == [] then {} else {xs[0]}+ToSet(xs[1..])
    }

    predicate substring1<A(==)>(sub: seq<A>, super: seq<A>) {
        exists k :: 0 <= k < |super| && sub <= super[k..]
    }


    ghost predicate isSubstringAlt<A(!new)>(sub: seq<A>, super: seq<A>) {
        |sub| <= |super| && exists xs: seq<A> :: IsSuffix(xs, super) && sub <= xs
    }

    predicate isSubstring<A(==)>(sub: seq<A>, super: seq<A>) {
        |sub| <= |super| && exists k,j :: 0 <= k < j <= |super| && sub == super[k..j]
    }

    lemma SliceOfSliceIsSlice<A>(xs: seq<A>, k: int, j: int, s: int, t: int)
        requires 0 <= k <= j <= |xs|
        requires 0 <= s <= t <= j-k
        ensures xs[k..j][s..t] == xs[(k+s)..(k+s+(t-s))]
    {/* TODO */ }



    lemma AllSubstringsAreSubstrings<A>(subsub: seq<A>, sub: seq<A>, super: seq<A>)
        requires isSubstring(sub, super)
        requires isSubstring(subsub, sub)
        ensures isSubstring(subsub, super)
    {/* TODO */ }

    predicate IsSuffix<T(==)>(xs: seq<T>, ys: seq<T>) {
        |xs| <= |ys| && xs == ys[|ys| - |xs|..]
    }
    
    predicate IsPrefix<T(==)>(xs: seq<T>, ys: seq<T>) {
        |xs| <= |ys| && xs == ys[..|xs|]
    }

    lemma PrefixRest<T>(xs: seq<T>, ys: seq<T>)
        requires IsPrefix(xs, ys)
        ensures exists yss: seq<T> :: ys == xs + yss && |yss| == |ys|-|xs|;
    {/* TODO */ }

    lemma IsSuffixReversed<T>(xs: seq<T>, ys: seq<T>)
        requires IsSuffix(xs, ys)
        ensures IsPrefix(reverse(xs), reverse(ys))
    {/* TODO */ }

    lemma IsPrefixReversed<T>(xs: seq<T>, ys: seq<T>)
        requires IsPrefix(xs, ys)
        ensures IsSuffix(reverse(xs), reverse(ys))
    {/* TODO */ }

    lemma IsPrefixReversedAll<T>(xs: seq<T>, ys: seq<T>)
        requires IsPrefix(reverse(xs), reverse(ys))
        ensures IsSuffix(reverse(reverse(xs)), reverse(reverse(ys)))
    {/* TODO */ }

    predicate IsSuffix2<T(==)>(xs: seq<T>, ys: seq<T>) {
        |xs| <= |ys| && exists K :: 0 <= K <= |ys|-|xs| && ys == ys[0..K] + xs + ys[(K+|xs|)..]
    }

    function reverse<A>(x: seq<A>): seq<A> 

    {
        if x == [] then [] else reverse(x[1..])+[x[0]]
    }

    lemma {:induction false} reversePreservesMultiset<A>(xs: seq<A>) 
        ensures multiset(xs) == multiset(reverse(xs))
    {/* TODO */ }

    lemma  reversePreservesLength<A>(xs: seq<A>)
        ensures |xs| == |reverse(xs)|
    {/* TODO */ }

    lemma  lastReverseIsFirst<A>(xs: seq<A>)
        requires |xs| > 0
        ensures xs[0] == reverse(xs)[|reverse(xs)|-1]
    {/* TODO */ }

    lemma firstReverseIsLast<A>(xs: seq<A>)
        requires |xs| > 0
        ensures reverse(xs)[0] == xs[|xs|-1]
    {/* TODO */ }

    lemma ReverseConcat<T>(xs: seq<T>, ys: seq<T>)
        ensures reverse(xs + ys) == reverse(ys) + reverse(xs)
    {/* TODO */ }


    lemma reverseRest<A>(xs: seq<A>)
        requires |xs| > 0
        ensures reverse(xs) == [xs[ |xs| -1 ] ] + reverse(xs[0..|xs|-1])
    {/* TODO */ }

    lemma ReverseIndexAll<T>(xs: seq<T>)
        ensures |reverse(xs)| == |xs|
        ensures forall i :: 0 <= i < |xs| ==> reverse(xs)[i] == xs[|xs| - i - 1]
    {/* TODO */ }

    lemma ReverseIndex<T>(xs: seq<T>, i: int)
        requires 0 <= i < |xs|
        ensures |reverse(xs)| == |xs|
        ensures reverse(xs)[i] == xs[|xs| - i - 1]
    {/* TODO */ }
    lemma ReverseIndexBack<T>(xs: seq<T>, i: int)
        requires 0 <= i < |xs|
        ensures |reverse(xs)| == |xs|
        ensures reverse(xs)[|xs| - i - 1] == xs[i]
    {/* TODO */ }

    lemma ReverseSingle<A>(xs: seq<A>) 
        requires |xs| == 1
        ensures reverse(xs) == xs
    {/* TODO */ }

    lemma SeqEq<T>(xs: seq<T>, ys: seq<T>)
        requires |xs| == |ys|
        requires forall i :: 0 <= i < |xs| ==> xs[i] == ys[i]
        ensures xs == ys
    {/* TODO */ }

    lemma reverseReverseIdempotent<A>(xs: seq<A>) 
        ensures reverse(reverse(xs)) == xs
    {/* TODO */ }

    lemma notInNotEqual<A>(xs: seq<A>, elem: A)
        requires elem !in xs
        ensures forall k :: 0 <= k < |xs| ==> xs[k] != elem
    {/* TODO */ }

    predicate distinct<A(==)>(s: seq<A>) {
        forall x,y :: x != y && 0 <= x <= y < |s| ==> s[x] != s[y]
    }

    lemma distincts<A>(xs: seq<A>, ys: seq<A>)
        requires distinct(xs)
        requires distinct(ys)
        requires forall x :: x in xs ==> x !in ys 
        requires forall y :: y in ys ==> y !in xs 
        ensures distinct(xs+ys)
    {/* TODO */ }

    lemma reverseDistinct<A>(list: seq<A>)
        requires distinct(list)
        ensures distinct(reverse(list))
    {/* TODO */ }

    lemma distinctSplits<A>(list: seq<A>)
        requires distinct(list)
        ensures forall i :: 1 <= i < |list| ==> distinct(list[..i])
    {/* TODO */ }

    lemma multisetItems<A>(list: seq<A>, item: A)
        requires item in list
        requires multiset(list)[item] > 1
        ensures exists i,j :: 0 <= i < j < |list| && list[i] == item && list[j] == item && i != j
    {/* TODO */ }

    lemma distinctMultisetIs1<A>(list: seq<A>, item: A) 
        requires distinct(list)
        requires item in list
        ensures multiset(list)[item] == 1
    {/* TODO */ }

    lemma indistinctMultisetIsGreaterThan1<A>(list: seq<A>) 
        requires !distinct(list)
        ensures exists item :: multiset(list)[item] > 1
    {/* TODO */ }

    lemma multisetIsGreaterThan1Indistinct<A>(list: seq<A>) 
        requires exists item :: multiset(list)[item] > 1
        ensures !distinct(list)
    {/* TODO */ }

    lemma indistinctPlusX<A>(items: seq<A>, x: A)
        requires !distinct(items)
        ensures forall i :: 0 <= i < |items| ==> !distinct(items[..i]+[x]+items[i..])
    {/* TODO */ }

    lemma pigeonHolesMultiset<A>(items: set<A>, list: seq<A>, n: nat)
        requires |items| == n
        requires forall x :: x in list ==> x in items
        requires |list| > n
        ensures exists item :: multiset(list)[item] > 1
    {/* TODO */ }

    lemma pigeonHoles<A>(items: set<A>, list: seq<A>, n: nat)
        requires |items| == n
        requires forall x :: x in list ==> x in items
        requires |list| > n
        ensures !distinct(list)
    {/* TODO */ }

    lemma reverseInitList<T>(xs: seq<T>)
        requires |xs| > 1
        requires |reverse(xs)| == |xs|
        ensures reverse(reverse(xs)[..|xs|-1]) == xs[1..]
    {/* TODO */ }
    
    method SeqTest() {/* TODO */ }

}
