predicate strictNegative(v:array<int>,i:int,j:int)
reads v
{forall u | i<=u<j :: v[u]<0}

predicate positive(s:seq<int>)
{forall u::0<=u<|s| ==> s[u]>=0}

predicate isPermutation(s:seq<int>, t:seq<int>)
{multiset(s)==multiset(t)}

/**
returns an index st new array is a permutation of the old array
positive first and then strictnegative, i is the firs neg or len if not any */
method separate(v:array<int>) returns (i:int)
modifies v
{
    i:=0;
    var j:=v.Length - 1;
    while(i<=j)
    {
        if(v[i]>=0){
           i:=i+1;
        }
        else if(v[j]>=0){
            v[i],v[j]:=v[j],v[i];
            j:=j-1;

            i:=i+1;
        }
        else if(v[j]<0){
            j:=j-1;
        }
    }
    
}
