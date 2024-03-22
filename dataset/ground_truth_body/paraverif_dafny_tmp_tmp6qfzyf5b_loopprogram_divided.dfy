method divided_diff(n:int, m: int,q:array?<int>,r:array?<int>) 
requires q!=null && q.Length>0
   requires r!=null && r.Length>0
   requires forall i,j::0<=i<q.Length&&0<=j<q.Length==>q[i]!=q[j]
   requires n == m * q[0] + r[0]
   ensures   0 <= r[0]  &&  r[0] < m
   ensures   n == m * q[0] + r[0]
   modifies r
   modifies q
{
      r[0] := r[0] - m;
      q[0] := q[0] + 1;
}
method divided_diff1(n:int, m: int,q:array?<int>,r:array?<int>) 
requires q!=null && q.Length>0
   requires r!=null && r.Length>0
   requires forall i,j::0<=i<q.Length&&0<=j<q.Length==>q[i]!=q[j]
   requires 0 <= r[0];
   ensures   0 <= r[0]  &&  r[0] < m
   ensures   n == m * q[0] + r[0]
   modifies r
   modifies q
{
      r[0] := r[0] - m;
      q[0] := q[0] + 1;
}

