
module Seq {
    export reveals *
    function ToSet<A>(xs: seq<A>): set<A>
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
    {
            if j-k == 0 {
            }else if t-s == 0 {
            }else if t-s > 0 {
                SliceOfSliceIsSlice(xs, k, j, s,t-1);
            }
    }



    lemma AllSubstringsAreSubstrings<A>(subsub: seq<A>, sub: seq<A>, super: seq<A>)
    {
        var k,j :| 0 <= k < j <= |super| && sub == super[k..j];
        var s,t :| 0 <= s < t <= |sub| && subsub == sub[s..t];
        // var example:= [3,4,5,6,7,8,9,10,11,12,13];
        // assert example[2..7] == [5,6,7,8,9];
        // assert example[2..7][1..3] == [6,7];
        // assert example[3..5] == [6,7];
        // assert k+s+(t-s)
        // assert 2+1+(3-1) == 5;
        /*
        if t < j {
            calc {
                subsub;
                super[k..j][s..t];
                {SliceOfSliceIsSlice(super,k,j,s,t);}
                super[(k+s)..(k+s+(t-s))];
            }
        } else if t <= j {

        }
        // var z,q :| 0 <= z <= q <= |super| && super[z..q] == super[k..j][s..t];
    }

    predicate IsSuffix<T(==)>(xs: seq<T>, ys: seq<T>) {
        |xs| <= |ys| && xs == ys[|ys| - |xs|..]
    }
    
    predicate IsPrefix<T(==)>(xs: seq<T>, ys: seq<T>) {
        |xs| <= |ys| && xs == ys[..|xs|]
    }

    lemma PrefixRest<T>(xs: seq<T>, ys: seq<T>)
    {
    }

    lemma IsSuffixReversed<T>(xs: seq<T>, ys: seq<T>)
    {
        ReverseIndexAll(xs);
        ReverseIndexAll(ys);
    }

    lemma IsPrefixReversed<T>(xs: seq<T>, ys: seq<T>)
    {
        ReverseIndexAll(xs);
        ReverseIndexAll(ys);
    }

    lemma IsPrefixReversedAll<T>(xs: seq<T>, ys: seq<T>)
    {
        ReverseIndexAll(xs);
        ReverseIndexAll(ys);
        PrefixRest(reverse(xs), reverse(ys));
        var yss :| reverse(ys) == reverse(xs) + yss && |yss| == |ys|-|xs|;
        reverseReverseIdempotent(ys);
        ReverseConcat(reverse(xs), yss);
        calc {
            reverse(reverse(ys));
            ys;
            reverse(reverse(xs) + yss);
            reverse(yss)+reverse(reverse(xs));
            == {reverseReverseIdempotent(xs);}
            reverse(yss)+xs;
        }
    }

    predicate IsSuffix2<T(==)>(xs: seq<T>, ys: seq<T>) {
        |xs| <= |ys| && exists K :: 0 <= K <= |ys|-|xs| && ys == ys[0..K] + xs + ys[(K+|xs|)..]
    }

    function reverse<A>(x: seq<A>): seq<A> 

    {
        if x == [] then [] else reverse(x[1..])+[x[0]]
    }

    lemma {:induction false} reversePreservesMultiset<A>(xs: seq<A>) 
    {
        if xs == [] {

        }else {
            var x := xs[0];
            reversePreservesMultiset(xs[1..]);
        }
    }

    lemma  reversePreservesLength<A>(xs: seq<A>)
    {

    }

    lemma  lastReverseIsFirst<A>(xs: seq<A>)
    {
        reversePreservesLength(xs);
    }

    lemma firstReverseIsLast<A>(xs: seq<A>)
    {

    }

    lemma ReverseConcat<T>(xs: seq<T>, ys: seq<T>)
    {
        // reveal Reverse();
        if |xs| == 0 {
        } else {
        }
    }


    lemma reverseRest<A>(xs: seq<A>)
    {
        firstReverseIsLast(xs);
        calc {
            reverse(xs);
            reverse(xs[0..|xs|-1] + [xs[|xs|-1]]);
            == {ReverseConcat(xs[0..|xs|-1], [xs[ |xs|-1 ]]);}
            reverse([xs[ |xs|-1 ]]) + reverse(xs[0..|xs|-1]);

        }

    }

    lemma ReverseIndexAll<T>(xs: seq<T>)
    {
    // reveal Reverse();
    }

    lemma ReverseIndex<T>(xs: seq<T>, i: int)
    {
        ReverseIndexAll(xs);
    }
    lemma ReverseIndexBack<T>(xs: seq<T>, i: int)
    {
        ReverseIndexAll(xs);
    }

    lemma ReverseSingle<A>(xs: seq<A>) 
    {

    }

    lemma SeqEq<T>(xs: seq<T>, ys: seq<T>)
    {
    }

    lemma reverseReverseIdempotent<A>(xs: seq<A>) 
    {
        if xs == [] {

        }else{
            calc {
                reverse(reverse(xs));
                reverse(reverse([xs[0]] + xs[1..]));
                == {ReverseConcat([xs[0]] , xs[1..]);}
                reverse(reverse(xs[1..]) + reverse([xs[0]]));
                == {ReverseSingle([xs[0]]);}
                reverse(reverse(xs[1..]) + [xs[0]]);
                == {ReverseConcat(reverse(xs[1..]), [xs[0]]);}
                reverse([xs[0]]) + reverse(reverse(xs[1..]));
                [xs[0]] + reverse(reverse(xs[1..]));
                == {reverseReverseIdempotent(xs[1..]);}
                xs;
            }
        }
        /* Alternatively */
        // ReverseIndexAll(reverse(xs));
        // ReverseIndexAll(xs);
        // SeqEq(reverse(reverse(xs)), xs);
    }

    lemma notInNotEqual<A>(xs: seq<A>, elem: A)
    {

    }

    predicate distinct<A(==)>(s: seq<A>) {
        forall x,y :: x != y && 0 <= x <= y < |s| ==> s[x] != s[y]
    }

    lemma distincts<A>(xs: seq<A>, ys: seq<A>)
    {
        var len := |xs + ys|;
        forall x,y | x != y && 0 <= x <= y < |xs+ys| 
        {
            if 0 <= x < |xs| && 0 <= y < |xs| {
            }else if |xs| <= x < |xs+ys| && |xs| <= y < |xs+ys| {
            }else if 0 <= x < |xs| && |xs| <= y < |xs+ys| {
                notInNotEqual(ys, xs[x]);
            }
        }

    }

    lemma reverseDistinct<A>(list: seq<A>)
    {
        ReverseIndexAll(list);
    }

    lemma distinctSplits<A>(list: seq<A>)
    {}

    lemma multisetItems<A>(list: seq<A>, item: A)
    {
        var k :| 0 <= k < |list| && list[k] == item;
        var rest := list[..k]+list[k+1..];
    }

    lemma distinctMultisetIs1<A>(list: seq<A>, item: A) 
    {
        if multiset(list)[item] == 0 {
        }
        if multiset(list)[item] > 1 {
            multisetItems(list, item);
            var i,j :| 0 <= i < j < |list| && list[i] == item && list[j] == item && i != j;
        }
    }

    lemma indistinctMultisetIsGreaterThan1<A>(list: seq<A>) 
    {
        var x,y :| x != y && 0 <= x <= y < |list| && list[x] == list[y];
        var item := list[x];
    }

    lemma multisetIsGreaterThan1Indistinct<A>(list: seq<A>) 
    {
        var item :| multiset(list)[item] > 1;
        var x :| 0 <= x < |list| && list[x] == item;
        var y :| x != y && 0 <= y < |list| && list[y] == item;
    }

    lemma indistinctPlusX<A>(items: seq<A>, x: A)
    {
        forall i | 0 <= i < |items| 
        {
            indistinctMultisetIsGreaterThan1(items);
            var item :| multiset(items)[item] > 1;
            var itemsPlus := items[..i]+[x]+items[i..];
            calc {
                multiset(itemsPlus);
                multiset(items[..i])+multiset(items[i..])+multiset{x};
                multiset(items)+multiset{x};
            }
            multisetIsGreaterThan1Indistinct(itemsPlus);
        }
    }

    lemma pigeonHolesMultiset<A>(items: set<A>, list: seq<A>, n: nat)
    {

        if x :| multiset(list)[x] > 1 {
        }else if x :| multiset(list)[x] == 1 {
            var i :| 0 <= i < |list| && list[i] == x;
            var rest := list[..i]+list[i+1..];
            {
            }
            if n -1 == 0 {
                // assert |items| == 1;
                // assert x in items;
            }else{
                pigeonHolesMultiset(items-{x}, rest, n-1);
                var item :| multiset(rest)[item] > 1;
            }
        }else if x :| multiset(list)[x] == 0 {}
    }

    lemma pigeonHoles<A>(items: set<A>, list: seq<A>, n: nat)
    {
        if x :| multiset(list)[x] > 1 {
            multisetItems(list, x);
            var i,j :| 0 <= i < j < |list| && list[i] == x && list[j] == x && i != j;
        }else if x :| multiset(list)[x] == 1 {
            var i :| 0 <= i < |list| && list[i] == x;
            var rest := list[..i]+list[i+1..];
            {
            }
            pigeonHoles(items-{x}, rest, n-1);
            indistinctPlusX(rest, x);

        }else if x :| multiset(list)[x] == 0 {}
    }

    lemma reverseInitList<T>(xs: seq<T>)
    {
        calc {
            reverse(xs);
            reverse(xs[1..])+reverse([xs[0]]);
            reverse(xs[1..])+[xs[0]];
        }
        calc {
            reverse(reverse(xs)[..|xs|-1]);
            reverse(reverse(xs[1..]));
            == {reverseReverseIdempotent(xs[1..]);}
            xs[1..];
        }
    }
    
    method SeqTest() {
        var t1 := [4,5,6,1,2,3];
        // assert t1 == [4,5,6]+[1,2,3];
        var s1 := [1,2,3];
        // assert isSubstring(s1,t1);
    }

}
