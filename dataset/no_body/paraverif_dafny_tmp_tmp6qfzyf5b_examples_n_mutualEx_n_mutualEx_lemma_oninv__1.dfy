datatype state = I| T| C| E
type client=nat
type boolean=bool




method n_Tryinv__1_0(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i==p__Inv4
//1
requires (n[i] == I) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }

method n_Tryinv__1_1(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i==p__Inv3
//1
requires (n[i] == I) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }

method n_Tryinv__1_2(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires (n[i] == I) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }

method n_Tryinv__1_3(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires (n[i] == I) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }

method n_Tryinv__1_4(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires (n[i] == I) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }


method n_Critinv__1_0(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i==p__Inv4
requires (!((x[0] == true) && (n[p__Inv3] == C)))//3
requires ((n[i] == T) && (x[0] == true)) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }

method n_Critinv__1_1(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i==p__Inv3
requires (!((x[0] == true) && (n[p__Inv4] == C)))//3
requires ((n[i] == T) && (x[0] == true)) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }

method n_Critinv__1_2(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires ((n[i] == T) && (x[0] == true)) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }

method n_Critinv__1_3(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires ((n[i] == T) && (x[0] == true)) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }

method n_Critinv__1_4(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires ((n[i] == T) && (x[0] == true)) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }


method n_Exitinv__1_0(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i==p__Inv4
//1
requires (n[i] == C) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }

method n_Exitinv__1_1(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i==p__Inv3
//1
requires (n[i] == C) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }

method n_Exitinv__1_2(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires (n[i] == C) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }

method n_Exitinv__1_3(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires (n[i] == C) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }

method n_Exitinv__1_4(n:array<state>,    
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires (n[i] == C) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n

{/* TODO */ }


method n_Idleinv__1_0(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i==p__Inv4
//1
requires (n[i] == E) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }

method n_Idleinv__1_1(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i==p__Inv3
//1
requires (n[i] == E) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }

method n_Idleinv__1_2(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires (n[i] == E) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }

method n_Idleinv__1_3(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires (n[i] == E) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }

method n_Idleinv__1_4(n:array<state>,     x:array<boolean>, 
N0:nat,i:nat,
p__Inv3:nat,p__Inv4:nat)
requires N0>0

requires n.Length==N0




requires x.Length==N0

requires forall i,j::0<=i<n.Length&&0<=j<n.Length==>n[i]!=n[j]




requires forall i,j::0<=i<x.Length&&0<=j<x.Length==>x[i]!=x[j]

requires 0<=i<N0
requires p__Inv3!=p__Inv4&&p__Inv4<N0&& p__Inv3<N0
requires i!=p__Inv3&&i!=p__Inv4
requires (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))//2
requires (n[i] == E) //guard condition
ensures   (!((n[p__Inv4] == C) && (n[p__Inv3] == C)))
modifies n
modifies x

{/* TODO */ }



