class UniqueNumberAllocator {
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
        ensures Valid() && n !in old(used) && used == old(used)+ {n}
    {
        n := next;
        next:= next+1;
        used := used + {n};
    }

    method Reset()
        ensures Valid() && used == {}
    {
        next := 0;
        used := {};
    }
    
    function GetUsed(): set<nat>
    {
       used
    }

    
   
}

method Main() {
method Main() {
    var m:= new UniqueNumberAllocator();
    m.Reset();
   // var n := m.Allocate();
    //n:= m.Allocate();
    //n:=m.Allocate();
    //n:=m.Allocate();
    var sett := m.GetUsed();
    print "(m.used )Checksum is " ,sett,"\n";
    print "(m.used )Checksum is " ,m.next,"\n";

}
