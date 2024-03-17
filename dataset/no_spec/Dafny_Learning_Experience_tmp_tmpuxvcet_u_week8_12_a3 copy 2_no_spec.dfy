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
    {
        this in Repr && data in Repr && data.Length == N  
         && 0 <= |s1| + |s2| <= N && 0 <=|s1| <= N && 0 <=|s2| <= N
        &&  (|s1| != 0 ==> forall i:: 0<= i < |s1| ==> s1[i] == data[i]) 
        && (|s2| != 0 ==> forall i:: 0<= i < |s2| ==> s2[i] == data[data.Length-1-i])
       && n1 == |s1| && n2 == |s2|
    }

    constructor (N: nat)
    {
        s1,s2,this.N := [],[],N;
        data := new T[N];
        n1, n2 := 0, 0;
        Repr := {this, data};
    }
    
    method push1(element:T) returns (FullStatus:bool)
    {   
        if n1  == data.Length
        {   
            FullStatus := false;
        }else {
            if n1 != data.Length && n1 + n2 != data.Length{
                s1 := old(s1) + [element] ;
                data[n1] := element;
                n1 := n1 +1;
                FullStatus := true;
            }else{
                FullStatus := false;
            }
        }
    } 

    method push2(element:T) returns (FullStatus:bool)
    {   
        if n2  == data.Length
        {   
            FullStatus := false;
        }else {
            if n2 != data.Length && n1 + n2 != data.Length{
                s2 := old(s2) + [element] ;
                data[data.Length-1-n2] := element;
                n2 := n2 +1;
                FullStatus := true;
            }else{
                FullStatus := false;
            }
        }
    } 

    method pop1() returns (EmptyStatus:bool, PopedItem:T)
    {
        if n1 == 0 { 
            EmptyStatus := false;
            PopedItem := *;
        } else{
            s1 := old(s1[0..|s1|-1]);
            PopedItem := data[n1-1];
            n1 := n1 -1;
            EmptyStatus := true;
        }
    }

    method pop2() returns (EmptyStatus:bool, PopedItem:T)
    {
        if n2 == 0 { 
            EmptyStatus := false;
            PopedItem := *;
        } else{
            s2 := old(s2[0..|s2|-1]);
            PopedItem := data[data.Length-n2];
            n2 := n2 -1;
            EmptyStatus := true;
        }
    }

    method peek1() returns (EmptyStatus:bool, TopItem:T)
    {
        if n1 == 0 {
            EmptyStatus := false;
            TopItem := *;
        } else {
            TopItem := data[n1-1];
            EmptyStatus := true;
        }
    }

    method peek2() returns (EmptyStatus:bool, TopItem:T)
    {
        if n2 == 0 {
            EmptyStatus := false;
            TopItem := *;
        } else {
            TopItem := data[data.Length-n2];
            EmptyStatus := true;
        }
    }
    
    ghost predicate Empty1() 
    {
        |s1| == 0 && n1 == 0
    }

    ghost predicate Empty2() 
    {
        |s2| == 0 && n2 == 0
    }
    
    method search1(Element:T) returns (position:int)
    {
        var n := 0;
        position := 0;

        while n != n1
        {
            if data[n1-1-n] == Element 
            {
                position := n + 1;
                return position; 
            }
            n := n + 1;
        }
        position := -1;
    }

    method search3(Element:T) returns (position:int)
    {
        position := 0;
        var n := 0;

        while n != n2
        {
            if data[data.Length - n2 + n] == Element 
            {
                position :=  n + 1;
                
                return position; 
            }
            n := n + 1;
        }
        
        position := -1;
    }
}


