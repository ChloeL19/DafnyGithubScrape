predicate allEqual(s:seq<int>)
{forall i,j::0<=i<|s| && 0<=j<|s| ==> s[i]==s[j] }
//{forall i,j::0<=i<=j<|s| ==> s[i]==s[j] }
//{forall i::0<i<|s| ==> s[i-1]==s[i]} 
//{forall i::0<=i<|s|-1 ==> s[i]==s[i+1]}


//Ordered indexes
lemma equivalenceNoOrder(s:seq<int>)
ensures allEqual(s) <==> forall i,j::0<=i<=j<|s| ==> s[i]==s[j]
{/* TODO */ }

//All equal to first
lemma equivalenceEqualtoFirst(s:seq<int>)
requires s!=[]
ensures allEqual(s) <==> (forall i::0<=i<|s| ==> s[0]==s[i])
{/* TODO */ }



lemma equivalenceContiguous(s:seq<int>)
ensures (allEqual(s) ==> forall i::0<=i<|s|-1 ==> s[i]==s[i+1])
ensures (allEqual(s) <== forall i::0<=i<|s|-1 ==> s[i]==s[i+1])
{/* TODO */ }



method mallEqual1(v:array<int>) returns (b:bool)
ensures b==allEqual(v[0..v.Length])
{/* TODO */ }

method mallEqual2(v:array<int>) returns (b:bool)
ensures b==allEqual(v[0..v.Length])
{/* TODO */ }



method mallEqual3(v:array<int>) returns (b:bool)
ensures b==allEqual(v[0..v.Length])
{/* TODO */ }


method mallEqual4(v:array<int>) returns (b:bool)
ensures b==allEqual(v[0..v.Length])
{/* TODO */ }


 method mallEqual5(v:array<int>) returns (b:bool)
ensures b==allEqual(v[0..v.Length])
{/* TODO */ }




