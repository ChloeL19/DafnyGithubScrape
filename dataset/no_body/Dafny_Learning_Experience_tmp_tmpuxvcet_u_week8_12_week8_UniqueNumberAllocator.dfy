class UniqueNumberAllocator {
    var used: set<nat>
    var next:nat

    ghost predicate Valid()
        reads this
    {
        (forall i:: 0<= i< next ==> i in used) &&
        (forall i:: i >= next  ==> i !in used)
    }

    constructor()
        ensures Valid() && used == {}
    {
        used, next := {}, 0;
    }
    
    method Allocate() returns (n:nat)
        requires Valid()
        modifies this
        ensures Valid() && n !in old(used) && used == old(used)+ {/* TODO */ }
    {
        n := next;
        next:= next+1;
        used := used + {n};
    }

    method Reset()
        requires Valid()
        modifies this
        ensures Valid() && used == {/* TODO */ }
    {
        next := 0;
        used := {};
    }
    
    function GetUsed(): set<nat>
        requires Valid()
        reads this
    {
       used
    }

    
   
}

method Main() {/* TODO */ }
