


predicate strictSorted(s : seq<int>) {
	forall u, w :: 0 <= u < w < |s| ==> s[u] < s[w]
}


method mcontained(v:array<int>,w:array<int>,n:int,m:int) returns (b:bool)
//Specify and implement an O(m+n) algorithm that returns b
//v and w are strictly increasing ordered arrays
//b is true iff the first n elements of v are contained in the first m elements of w
{
	var i:=0;
	var j:=0;
	while(i<n && j<m && (v[i] >= w[j])) //&& b)
	{	
		if(v[i] == w[j]){
			i:=i+1;
		}
		j:=j+1;
		
	}
	b := i==n;
	
}


