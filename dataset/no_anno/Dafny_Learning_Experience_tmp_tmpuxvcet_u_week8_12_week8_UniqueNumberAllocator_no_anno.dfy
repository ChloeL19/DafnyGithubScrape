class UniqueNumberAllocator {
    var used: set<nat>
    var next:nat

    ghost predicate Valid()
    {
        (forall i:: 0<= i< next ==> i in used) &&
        (forall i:: i >= next  ==> i !in used)
    }

    constructor()
    {
        used, next := {}, 0;
    }
    
    method Allocate() returns (n:nat)
    {
        n := next;
        next:= next+1;
        used := used + {n};
    }

    method Reset()
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
