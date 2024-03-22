datatype locationType = M| OSTATUS| E| S| I
type client=nat
type boolean=bool




method n_rule_t1inv__2_0(a:array<locationType>,    
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0




requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]




requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires (!((a[p__Inv2] == E) && (a[p__Inv0] == E)))//3
requires (a[i] == E) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t1inv__2_1(a:array<locationType>,    
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0




requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]




requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires (a[i] == E) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t1inv__2_2(a:array<locationType>,    
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0




requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]




requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))//2
requires (a[i] == E) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }


method n_rule_t2inv__2_0(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires (a[p__Inv0] == E)//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_1(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires ((a[p__Inv0] == M) && (!(a[p__Inv0] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_2(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires ((!(a[p__Inv0] == M)) && (!(a[p__Inv0] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_3(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
requires (a[p__Inv2] == E)//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_4(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
requires ((a[p__Inv2] == M) && (!(a[p__Inv2] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_5(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
requires ((!(a[p__Inv2] == M)) && (!(a[p__Inv2] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_6(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((a[p__Inv0] == E) && (a[p__Inv2] == E))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_7(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((a[p__Inv0] == M) && (!(a[p__Inv0] == E)) && (a[p__Inv2] == E))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_8(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(a[p__Inv0] == M)) && (!(a[p__Inv0] == E)) && (a[p__Inv2] == E))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_9(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((a[p__Inv0] == E) && (a[p__Inv2] == M) && (!(a[p__Inv2] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_10(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((a[p__Inv0] == M) && (!(a[p__Inv0] == E)) && (a[p__Inv2] == M) && (!(a[p__Inv2] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_11(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(a[p__Inv0] == M)) && (!(a[p__Inv0] == E)) && (a[p__Inv2] == M) && (!(a[p__Inv2] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_12(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((a[p__Inv0] == E) && (!(a[p__Inv2] == M)) && (!(a[p__Inv2] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_13(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((a[p__Inv0] == M) && (!(a[p__Inv0] == E)) && (!(a[p__Inv2] == M)) && (!(a[p__Inv2] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rule_t2inv__2_14(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(a[p__Inv0] == M)) && (!(a[p__Inv0] == E)) && (!(a[p__Inv2] == M)) && (!(a[p__Inv2] == E)))//branch
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }


method n_rul_t3inv__2_0(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
//1
requires (a[i] == S) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rul_t3inv__2_1(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires (a[i] == S) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rul_t3inv__2_2(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
//1
requires (a[i] == S) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }


method n_rul_t4inv__2_0(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
//1
requires (a[i] == OSTATUS) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rul_t4inv__2_1(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires (a[i] == OSTATUS) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rul_t4inv__2_2(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
//1
requires (a[i] == OSTATUS) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }


method n_rul_t5inv__2_0(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
//1
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rul_t5inv__2_1(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }

method n_rul_t5inv__2_2(a:array<locationType>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires a.Length==N0





requires forall i,j::0<=i<a.Length&&0<=j<a.Length==>a[i]!=a[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
//1
requires (a[i] == I) //guard condition
ensures   (!((a[p__Inv0] == E) && (a[p__Inv2] == M)))
modifies a

{/* TODO */ }



