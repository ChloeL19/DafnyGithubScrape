  datatype state = I| T| C| E
  type client=nat
type boolean=bool




class TopC{
var
x : boolean,
n : array<state>;
constructor (){

}
}

method n_Tryinv__2_0(top:TopC,i:nat,N0:nat,p__Inv4:nat)
requires 0<=i<N0

requires N0>0
requires top.n.Length==N0
requires forall i,j::0<=i<top.n.Length&&0<=j<top.n.Length==>top.n[i]!=top.n[j]
ensures top.n==old(top.n)
requires  p__Inv4<N0
requires i==p__Inv4
//1
//guard condition
requires   (top.n[i] == I)

ensures   (!((top.n[p__Inv4] == C) && (top.x == true)))
modifies top.n
modifies top
modifies top


{/* TODO */ }

method n_Tryinv__2_1(top:TopC,i:nat,N0:nat,p__Inv4:nat)
requires 0<=i<N0

requires N0>0
requires top.n.Length==N0
requires forall i,j::0<=i<top.n.Length&&0<=j<top.n.Length==>top.n[i]!=top.n[j]
ensures top.n==old(top.n)
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((top.n[p__Inv4] == C) && (top.x == true)))//2
//guard condition
requires   (top.n[i] == I)

ensures   (!((top.n[p__Inv4] == C) && (top.x == true)))
modifies top.n
modifies top
modifies top


{/* TODO */ }


method n_Critinv__2_0(top:TopC,i:nat,N0:nat,p__Inv4:nat)
requires 0<=i<N0

requires N0>0
requires top.n.Length==N0
requires forall i,j::0<=i<top.n.Length&&0<=j<top.n.Length==>top.n[i]!=top.n[j]
ensures top.n==old(top.n)
requires  p__Inv4<N0
requires i==p__Inv4
//1
//guard condition
requires   ((top.n[i] == T) && (top.x == true))

ensures   (!((top.n[p__Inv4] == C) && (top.x == true)))
modifies top.n
modifies top
modifies top


{/* TODO */ }

method n_Critinv__2_1(top:TopC,i:nat,N0:nat,p__Inv4:nat)
requires 0<=i<N0

requires N0>0
requires top.n.Length==N0
requires forall i,j::0<=i<top.n.Length&&0<=j<top.n.Length==>top.n[i]!=top.n[j]
ensures top.n==old(top.n)
requires  p__Inv4<N0
requires i!=p__Inv4
//1
//guard condition
requires   ((top.n[i] == T) && (top.x == true))

ensures   (!((top.n[p__Inv4] == C) && (top.x == true)))
modifies top.n
modifies top
modifies top


{/* TODO */ }


method n_Exitinv__2_0(top:TopC,i:nat,N0:nat,p__Inv4:nat)
requires 0<=i<N0

requires N0>0
requires top.n.Length==N0
requires forall i,j::0<=i<top.n.Length&&0<=j<top.n.Length==>top.n[i]!=top.n[j]
ensures top.n==old(top.n)
requires  p__Inv4<N0
requires i==p__Inv4
//1
//guard condition
requires   (top.n[i] == C)

ensures   (!((top.n[p__Inv4] == C) && (top.x == true)))
modifies top.n
modifies top
modifies top


{/* TODO */ }

method n_Exitinv__2_1(top:TopC,i:nat,N0:nat,p__Inv4:nat)
requires 0<=i<N0

requires N0>0
requires top.n.Length==N0
requires forall i,j::0<=i<top.n.Length&&0<=j<top.n.Length==>top.n[i]!=top.n[j]
ensures top.n==old(top.n)
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((top.n[p__Inv4] == C) && (top.x == true)))//2
//guard condition
requires   (top.n[i] == C)

ensures   (!((top.n[p__Inv4] == C) && (top.x == true)))
modifies top.n
modifies top
modifies top


{/* TODO */ }


method n_Idleinv__2_0(top:TopC,i:nat,N0:nat,p__Inv4:nat)
requires 0<=i<N0

requires N0>0
requires top.n.Length==N0
requires forall i,j::0<=i<top.n.Length&&0<=j<top.n.Length==>top.n[i]!=top.n[j]
ensures top.n==old(top.n)
requires  p__Inv4<N0
requires i==p__Inv4
//1
//guard condition
requires   (top.n[i] == E)

ensures   (!((top.n[p__Inv4] == C) && (top.x == true)))
modifies top.n
modifies top
modifies top


{/* TODO */ }

method n_Idleinv__2_1(top:TopC,i:nat,N0:nat,p__Inv4:nat)
requires 0<=i<N0

requires N0>0
requires top.n.Length==N0
requires forall i,j::0<=i<top.n.Length&&0<=j<top.n.Length==>top.n[i]!=top.n[j]
ensures top.n==old(top.n)
requires  p__Inv4<N0
requires i!=p__Inv4
requires (!((top.n[p__Inv4] == C) && (top.n[i] == E)))//3
//guard condition
requires   (top.n[i] == E)

ensures   (!((top.n[p__Inv4] == C) && (top.x == true)))
modifies top.n
modifies top
modifies top


{/* TODO */ }



