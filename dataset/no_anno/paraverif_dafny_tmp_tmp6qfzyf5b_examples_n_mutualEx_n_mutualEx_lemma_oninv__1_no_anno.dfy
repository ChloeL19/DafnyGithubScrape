datatype state = I| T| C| E
type client=nat
type boolean=bool




method n_Tryinv__1_0(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := T;
}

method n_Tryinv__1_1(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := T;
}

method n_Tryinv__1_2(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := T;
}

method n_Tryinv__1_3(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := T;
}

method n_Tryinv__1_4(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := T;
}


method n_Critinv__1_0(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := C;
  x[0] := false;
}

method n_Critinv__1_1(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := C;
  x[0] := false;
}

method n_Critinv__1_2(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := C;
  x[0] := false;
}

method n_Critinv__1_3(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := C;
  x[0] := false;
}

method n_Critinv__1_4(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := C;
  x[0] := false;
}


method n_Exitinv__1_0(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := E;
}

method n_Exitinv__1_1(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := E;
}

method n_Exitinv__1_2(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := E;
}

method n_Exitinv__1_3(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := E;
}

method n_Exitinv__1_4(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := E;
}


method n_Idleinv__1_0(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := I;
  x[0] := true;
}

method n_Idleinv__1_1(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := I;
  x[0] := true;
}

method n_Idleinv__1_2(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := I;
  x[0] := true;
}

method n_Idleinv__1_3(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := I;
  x[0] := true;
}

method n_Idleinv__1_4(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
{
  n[i] := I;
  x[0] := true;
}



