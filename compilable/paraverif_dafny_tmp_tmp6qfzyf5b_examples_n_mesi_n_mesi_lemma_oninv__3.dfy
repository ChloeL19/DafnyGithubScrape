datatype location = M| E| S| I
type client=nat
type boolean=bool




method n_t1inv__3_0(state:array<location>,    
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0




requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]




requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
//1
requires (state[i] == E) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  state[i] := M;
}

method n_t1inv__3_1(state:array<location>,    
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0




requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]




requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires (state[i] == E) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  state[i] := M;
}

method n_t1inv__3_2(state:array<location>,    
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0




requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]




requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))//2
requires (state[i] == E) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  state[i] := M;
}


method n_t2inv__3_0(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_1(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_2(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_3(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_4(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_5(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_6(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_7(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_8(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == E) && (state[p__Inv2] == E))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_9(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == M) && (!(state[p__Inv0] == E)) && (state[p__Inv2] == E))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_10(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == I) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)) && (state[p__Inv2] == E))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_11(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(state[p__Inv0] == I)) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)) && (state[p__Inv2] == E))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_12(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == E) && (state[p__Inv2] == M) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_13(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == M) && (!(state[p__Inv0] == E)) && (state[p__Inv2] == M) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_14(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == I) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)) && (state[p__Inv2] == M) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_15(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(state[p__Inv0] == I)) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)) && (state[p__Inv2] == M) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_16(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == E) && (state[p__Inv2] == I) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_17(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == M) && (!(state[p__Inv0] == E)) && (state[p__Inv2] == I) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_18(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == I) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)) && (state[p__Inv2] == I) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_19(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(state[p__Inv0] == I)) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)) && (state[p__Inv2] == I) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_20(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == E) && (!(state[p__Inv2] == I)) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_21(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == M) && (!(state[p__Inv0] == E)) && (!(state[p__Inv2] == I)) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_22(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((state[p__Inv0] == I) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)) && (!(state[p__Inv2] == I)) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}

method n_t2inv__3_23(state:array<location>,     
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires state.Length==N0





requires forall i,j::0<=i<state.Length&&0<=j<state.Length==>state[i]!=state[j]





requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires ((!(state[p__Inv0] == I)) && (!(state[p__Inv0] == M)) && (!(state[p__Inv0] == E)) && (!(state[p__Inv2] == I)) && (!(state[p__Inv2] == M)) && (!(state[p__Inv2] == E)))//branch
requires (state[i] == I) //guard condition
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := S;}
else{
      if (state[j] == E) {
        state[j] := S;}
else{
        if (state[j] == M) {
          state[j] := S;}
else{
          if (state[j] == I) {
            state[j] := I;}
else{
            state[j] := S;
          }
        }
      }
    }
  
 j:=j+1;
}
}


method n_t3inv__3_0(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := E;}
else{
      state[j] := I;
    }
  
 j:=j+1;
}
}

method n_t3inv__3_1(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := E;}
else{
      state[j] := I;
    }
  
 j:=j+1;
}
}

method n_t3inv__3_2(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := E;}
else{
      state[j] := I;
    }
  
 j:=j+1;
}
}


method n_t4inv__3_0(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := E;}
else{
      state[j] := I;
    }
  
 j:=j+1;
}
}

method n_t4inv__3_1(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := E;}
else{
      state[j] := I;
    }
  
 j:=j+1;
}
}

method n_t4inv__3_2(state:array<location>,     
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
ensures   (!((state[p__Inv0] == E) && (state[p__Inv2] == E)))
modifies state

{
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    if (j == i) {
      state[j] := E;}
else{
      state[j] := I;
    }
  
 j:=j+1;
}
}



