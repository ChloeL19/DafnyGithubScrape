

//a valid index of the array contains x
predicate appears(v:array<int>,x:int)
reads v
{forall u::0<=u<v.Length ==> v[u]<u}

//a valid index of the array contains 0
predicate existCero(v:array<int>)
reads v
{exists i :: 0<=i<v.Length && v[i]==0}

//all the valid indexes contain strictly positive integers
predicate allPositive(v:array<int>)
reads v
{forall i :: 0<=i<v.Length ==> v[i]>0}

//x appears exactly once in the array
predicate exactlyOne(v:array<int>,x:int)
reads v
{exists i ::    0<=i<v.Length && v[i]==x && 
                forall j:: 0<=j<v.Length && j!=i ==> v[j]!=x}
//{exists i ::    0<=i<v.Length && v[i]==x && 
//                !exists j:: 0<=j<v.Length && j!=i && v[j]==x}

//mathematical function to count the number of times that x appears in v in range [c,f)
function count(v:array<int>,x:int,c:int,f:int): (cont:int)
requires v.Length > f && 0<=c<=f
{
    if c==f then 0
    else
        (count(v, x, c, f-1) + (if x==v[f] then 1 else 0))
}

//using count define exactlyOnce
predicate exactlyOne2(v:array<int>,x:int)
requires v.Length > 0
reads v
{count(v, x, 0, v.Length-1)==1}

//x is the maximum element of v
predicate isMax(v:array<int>,x:int)
reads v
{forall i::0<=i<v.Length ==> x>=v[i] }

//i is one position of the minimum of v
predicate posMin(v:array<int>,i:int)
requires 0<=i<v.Length
reads v
{forall j::0<=j<v.Length ==> v[i]<=v[j]}

//each element in v is the double of its index
predicate allDouble(v:array<int>)
reads v
{forall i::0<=i<v.Length ==> v[i]==2*i}

//v is the mirror of w
predicate mirror(v:array<int>,w:array<int>)
requires v.Length == w.Length
reads v
reads w
{forall i::0<=i<v.Length ==> v[i] == w[w.Length -1 -i]}

//Write a main program to experiment with these predicates





