datatype Option<T> = None | Some(T)

ghost predicate less(a:set<int>, b: set<int>){
    forall x,y:: x in a && y in b ==> x < y
}

ghost function Union<Data>(m:map<int, Data>, n:Node?<Data>):map<int,Data>
    reads n
{
    if n == null then m 
    else map k | k in m.Keys + n.M.Keys :: if k in m.Keys then m[k] else n.M[k]
}

class Node<Data> {
    ghost var M:map<int, Data>
    ghost var Repr: set<object>
    var key:int
    var value:Data
    var left: Node?<Data>
    var right: Node?<Data>

    ghost predicate Valid()
        reads this, Repr
        ensures Valid() ==> this in Repr
        decreases Repr
    {
        this in Repr &&
        (left != null ==>
            left in Repr && left.Repr <= Repr && this !in left.Repr && left.Valid() && less(left.M.Keys,{key}))
            &&
        (right != null ==>
        right in Repr && right.Repr <= Repr && this !in right.Repr && right.Valid() && less({key},right.M.Keys))
            &&
        (left != null && right != null ==> left.Repr !! right.Repr)
        &&
        (M == Union(Union(map[key := value],left),right))
    }

    constructor(key:int, value:Data)
        ensures Valid() && fresh(Repr)
        ensures M == map[key:=value]
    {
        this.key, this.value := key, value;
        left, right := null, null;
        M,Repr := map[key:=value], {this};
    }

    function Lookup(key:int):Option<Data>
        requires Valid()
        reads Repr
        ensures key in M.Keys ==> Lookup(key) == Some(M[key])
        ensures key !in M.Keys ==> Lookup(key) == None
        decreases Repr,key
    {
        if key == this.key then Some(value)
        else if key <this.key && left != null then
            left.Lookup(key)
        else if key > this. key && right !=null then
            right.Lookup(key)
        else None
    }

    method Add(key:int, value:Data)
        requires Valid()
        modifies Repr
        ensures Valid() && fresh(Repr-old(Repr))
        ensures  M == old(M)[key:=value]
        decreases Repr
    {/* TODO */ }
}

class Map<Data> {
    ghost var M: map<int,Data>
    ghost var Repr: set<object>
    var root: Node?<Data>

    ghost predicate Valid()
        reads this, Repr
        ensures Valid() ==> this in Repr
    {
        this in Repr &&
        (|M.Keys| == 0 ==> root == null) &&
        (|M.Keys| != 0 ==> 
            root in Repr && root.Repr <= Repr && this !in root.Repr &&
            root.Valid() &&
            root.M == M)
    }

    constructor ()
        ensures Valid() && fresh(Repr)
        ensures M == map[]
    {
        root := null;
        M, Repr := map[], {this};

    }
    
    function LookUp (key:int): Option<Data>
        requires Valid()
        reads Repr
        ensures  key in M.Keys ==> LookUp(key) == Some(M[key])
        ensures key !in M.Keys ==> LookUp(key) == None
    {
        if root == null then None else root.Lookup(key)
    }

    method Add(key:int,value:Data)
        requires Valid()
        modifies Repr
        ensures Valid() && fresh(Repr-old(Repr))
        ensures M == old(M)[key:=value]
    {/* TODO */ }
 }
