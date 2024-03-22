class TwoStacks<T(0)(==)> 
{
    //abstract state
    ghost var s1 :seq<T>
    ghost var s2 :seq<T>
    ghost const N :nat // maximum size of the stacks
    ghost var Repr : set<object>
    //concrete state
    var data: array<T>
    var n1: nat // number of elements in the stack 1
    var n2: nat // number of elements in the stack 2

    ghost predicate Valid()
        reads this,Repr
        ensures Valid() ==> this in Repr &&  |s1| + |s2| <= N && 0 <= |s1| <= N && 0 <=|s2| <= N
    {
        this in Repr && data in Repr && data.Length == N  
         && 0 <= |s1| + |s2| <= N && 0 <=|s1| <= N && 0 <=|s2| <= N
        &&  (|s1| != 0 ==> forall i:: 0<= i < |s1| ==> s1[i] == data[i]) 
        && (|s2| != 0 ==> forall i:: 0<= i < |s2| ==> s2[i] == data[data.Length-1-i])
       && n1 == |s1| && n2 == |s2|
    }

    constructor (N: nat)
        ensures Valid() && fresh(Repr)
        ensures s1 == s2 == [] && this.N == N
    {
        s1,s2,this.N := [],[],N;
        data := new T[N];
        n1, n2 := 0, 0;
        Repr := {this, data};
    }
    
    method push1(element:T) returns (FullStatus:bool)
        requires Valid()
        modifies Repr
        ensures old(|s1|) != N && old(|s1|) + old(|s2|) != N ==> s1 ==  old(s1) + [element];
        ensures old(|s1|) == N ==> FullStatus == false
        ensures old(|s1|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
        ensures Valid() && fresh(Repr - old(Repr))
    {/* TODO */ } 

    method push2(element:T) returns (FullStatus:bool)
        requires Valid()
        modifies Repr
        ensures old(|s2|) != N && old(|s1|) + old(|s2|) != N ==> s2 ==  old(s2) + [element];
        ensures old(|s2|) == N ==> FullStatus == false
        ensures old(|s2|) != N && old(|s1|) + old(|s2|) == N ==> FullStatus == false
        ensures Valid() && fresh(Repr - old(Repr))
    {/* TODO */ } 

    method pop1() returns (EmptyStatus:bool, PopedItem:T)
        requires Valid()
        modifies Repr
        ensures old(|s1|) != 0 ==> s1 == old(s1[0..|s1|-1]) && EmptyStatus == true && PopedItem == old(s1[|s1|-1]) 
        ensures old(|s1|) == 0 ==> EmptyStatus == false 
        ensures Valid() && fresh(Repr - old(Repr))
    {/* TODO */ }

    method pop2() returns (EmptyStatus:bool, PopedItem:T)
        requires Valid()
        modifies Repr
        ensures old(|s2|) != 0 ==> s2 == old(s2[0..|s2|-1]) && EmptyStatus == true && PopedItem == old(s2[|s2|-1]) 
        ensures old(|s2|) == 0 ==> EmptyStatus == false 
        ensures Valid() && fresh(Repr - old(Repr))
    {/* TODO */ }

    method peek1() returns (EmptyStatus:bool, TopItem:T)
        requires Valid()
        ensures Empty1() ==> EmptyStatus == false
        ensures !Empty1() ==> EmptyStatus == true && TopItem == s1[|s1|-1] 
        ensures Valid()
    {/* TODO */ }

    method peek2() returns (EmptyStatus:bool, TopItem:T)
        requires Valid()
        ensures Empty2() ==> EmptyStatus == false
        ensures !Empty2() ==> EmptyStatus == true && TopItem == s2[|s2|-1] 
        ensures Valid()
    {/* TODO */ }
    
    ghost predicate Empty1() 
        requires Valid()
        reads this,Repr
        ensures Empty1() ==> |s1| == 0
        ensures Valid()
    {
        |s1| == 0 && n1 == 0
    }

    ghost predicate Empty2() 
        reads this
        ensures Empty2() ==> |s2| == 0
    {
        |s2| == 0 && n2 == 0
    }
    
    method search1(Element:T) returns (position:int)
        requires Valid()
        ensures position == -1 || position >= 1
        ensures position >= 1 ==> exists i::0 <=i < |s1| && s1[i] == Element && !Empty1()
        ensures position == -1 ==> forall i :: 0 <= i < |s1| ==> s1[i] != Element || Empty1()
        ensures Valid()
    {/* TODO */ }

    method search3(Element:T) returns (position:int)
        requires Valid()
        ensures position == -1 || position >= 1
        ensures position >= 1 ==> exists i::0 <=i < |s2| && s2[i] == Element && !Empty2()
      //  ensures position == -1 ==> forall i :: 0 <= i < |s2| ==> s2[i] != Element || Empty2()
        ensures Valid()
    {/* TODO */ }
}


