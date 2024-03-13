function identity(i:int):int
{i}

function identityMap(s:set<int>):map<int,int>
{ map i | i in s :: i}



function buildMap(s:set<int>,f:int -> int):map<int,int>
{ map i | i in s :: f(i)}

function updateMap(m1: map<int,int>, m2: map<int,int>): map<int, int>
{
  map k | k in (m1.Keys + m2.Keys) :: if k in m2 then m2[k] else m1[k]
}

