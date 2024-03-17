module SortHelpers
{
	predicate Sorted(q: seq<int>)
	{
		forall i,j :: 0 <= i <= j < |q| ==> q[i] <= q[j]
	}
	
	predicate SortPosts(q: seq<int>, oldq: seq<int>)
	{
		Sorted(q) && multiset(q)==multiset(oldq)
	}
	
	predicate Swapped(q: seq<int>, oldq: seq<int>, i: int, j: int)
	{
		q == oldq[i:=oldq[j]][j:=oldq[i]]
	}
	
	function APSum(n: int) : int
	{
		if n==0 then 0 else n + APSum(n-1)
	}

	lemma Gauss(n: nat)
	{
		if(n!=0) {Gauss(n-1);}
	}
	
	method swap(a: array<int>, i:int, j:int) returns(ghost t: nat)
	{
		a[i], a[j], t := a[j], a[i], 1;
	} 
	
	predicate SwapPosts(q: seq<int>, oldq: seq<int>, i:int, j:int) 
	{
		|q|>1 && 0<=i<=j<|q|==|oldq| && Swapped(q,oldq,i,j) && multiset(q)==multiset(oldq) && multiset(q[i..])==multiset(oldq[i..])
	}
	
}
