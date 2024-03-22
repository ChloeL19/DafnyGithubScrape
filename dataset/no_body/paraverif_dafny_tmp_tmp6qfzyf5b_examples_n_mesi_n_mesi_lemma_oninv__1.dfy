datatype location = M| E| S| I
type client=nat
type boolean=bool




method n_t1inv__1_0(state:array<location>,    
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0




requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]




requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires (!((state[p__Inv2] == E) && (state[p__Inv0] == M)))//3
requires (state[i] == E) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t1inv__1_1(state:array<location>,    
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0




requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]




requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
requires (!((state[p__Inv0] == E) && (state[p__Inv2] == M)))//3
requires (state[i] == E) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t1inv__1_2(state:array<location>,    
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0




requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]




requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))//2
requires (state[i] == E) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }


method n_t2inv__1_0(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires (state[p__Inv0] == E)//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_1(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires ((state[p__Inv0] == M) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_2(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires ((state[p__Inv0] == I) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_3(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires ((!(state[p__Inv0] == I)) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_4(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
requires (state[p__Inv2] == E)//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_5(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
requires ((state[p__Inv2] == M) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_6(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
requires ((state[p__Inv2] == I) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_7(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
requires ((!(state[p__Inv2] == I)) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_8(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == E) && (state[p__Inv0] == E))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_9(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == M) && (!(state[p__Inv2] == E)) && (state[p__Inv0] == E))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_10(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == I) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)) && (state[p__Inv0] == E))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_11(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(state[p__Inv2] == I)) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)) && (state[p__Inv0] == E))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_12(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == E) && (state[p__Inv0] == M) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_13(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == M) && (!(state[p__Inv2] == E)) && (state[p__Inv0] == M) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_14(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == I) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)) && (state[p__Inv0] == M) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_15(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(state[p__Inv2] == I)) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)) && (state[p__Inv0] == M) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_16(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == E) && (state[p__Inv0] == I) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_17(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == M) && (!(state[p__Inv2] == E)) && (state[p__Inv0] == I) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_18(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == I) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)) && (state[p__Inv0] == I) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_19(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(state[p__Inv2] == I)) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)) && (state[p__Inv0] == I) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_20(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == E) && (!(state[p__Inv0] == I)) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_21(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == M) && (!(state[p__Inv2] == E)) && (!(state[p__Inv0] == I)) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_22(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv2] == I) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)) && (!(state[p__Inv0] == I)) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t2inv__1_23(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(state[p__Inv2] == I)) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)) && (!(state[p__Inv0] == I)) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }


method n_t3inv__1_0(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
//1
requires (state[i] == S) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t3inv__1_1(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires (state[i] == S) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t3inv__1_2(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
//1
requires (state[i] == S) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }


method n_t4inv__1_0(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
//1
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t4inv__1_1(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }

method n_t4inv__1_2(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
//1
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv2] == M) && (state[p__Inv0] == M)))
modifies state

{/* TODO */ }



