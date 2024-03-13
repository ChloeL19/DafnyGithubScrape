  datatype state = I| T| C| E
  type client=nat
type boolean=bool




class TopC{
class TopC{
var
x : boolean,
n : array<state>;
constructor (){
constructor (){

}
}

method n_Tryinv__2_0(top:TopC,i:nat,N0:nat,p__Inv4:nat)
{
  top.n[i] := T;
}

method n_Tryinv__2_1(top:TopC,i:nat,N0:nat,p__Inv4:nat)
{
  top.n[i] := T;
}


method n_Critinv__2_0(top:TopC,i:nat,N0:nat,p__Inv4:nat)
{
  top.n[i] := C;
  top.x := false;
}

method n_Critinv__2_1(top:TopC,i:nat,N0:nat,p__Inv4:nat)
{
  top.n[i] := C;
  top.x := false;
}


method n_Exitinv__2_0(top:TopC,i:nat,N0:nat,p__Inv4:nat)
{
  top.n[i] := E;
}

method n_Exitinv__2_1(top:TopC,i:nat,N0:nat,p__Inv4:nat)
{
  top.n[i] := E;
}


method n_Idleinv__2_0(top:TopC,i:nat,N0:nat,p__Inv4:nat)
{
  top.n[i] := I;
  top.x := true;
}

method n_Idleinv__2_1(top:TopC,i:nat,N0:nat,p__Inv4:nat)
{
  top.n[i] := I;
  top.x := true;
}



