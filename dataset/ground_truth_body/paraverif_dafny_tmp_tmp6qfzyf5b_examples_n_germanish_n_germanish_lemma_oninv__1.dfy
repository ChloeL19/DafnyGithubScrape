datatype channelType = epsilon| req_shared| req_exclusive
datatype cacheType = invalid| shared| exclusive
type client=nat
type boolean=bool




method n_t3inv__1_0(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_command.Length==N0

requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]

requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
//1
requires ((home_current_command[0] == req_exclusive) && (home_sharer_list[i] == true)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_exclusive_granted
modifies home_sharer_list

{
  home_exclusive_granted[0] := false;
  cache[i] := invalid;
  home_sharer_list[i] := false;
}

method n_t3inv__1_1(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_command.Length==N0

requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]

requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires ((home_current_command[0] == req_exclusive) && (home_sharer_list[i] == true)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_exclusive_granted
modifies home_sharer_list

{
  home_exclusive_granted[0] := false;
  cache[i] := invalid;
  home_sharer_list[i] := false;
}

method n_t3inv__1_2(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_command.Length==N0

requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]

requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))//2
requires ((home_current_command[0] == req_exclusive) && (home_sharer_list[i] == true)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_exclusive_granted
modifies home_sharer_list

{
  home_exclusive_granted[0] := false;
  cache[i] := invalid;
  home_sharer_list[i] := false;
}


method n_t4inv__1_0(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_command.Length==N0

requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]

requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
//1
requires ((home_current_command[0] == req_shared) && (home_exclusive_granted[0] == true) && (home_sharer_list[i] == true)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_exclusive_granted
modifies home_sharer_list

{
  home_exclusive_granted[0] := false;
  cache[i] := shared;
  home_sharer_list[i] := true;
}

method n_t4inv__1_1(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_command.Length==N0

requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]

requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires ((home_current_command[0] == req_shared) && (home_exclusive_granted[0] == true) && (home_sharer_list[i] == true)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_exclusive_granted
modifies home_sharer_list

{
  home_exclusive_granted[0] := false;
  cache[i] := shared;
  home_sharer_list[i] := true;
}

method n_t4inv__1_2(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_command.Length==N0

requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]

requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))//2
requires ((home_current_command[0] == req_shared) && (home_exclusive_granted[0] == true) && (home_sharer_list[i] == true)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_exclusive_granted
modifies home_sharer_list

{
  home_exclusive_granted[0] := false;
  cache[i] := shared;
  home_sharer_list[i] := true;
}


method n_t5inv__1_0(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_client.Length==N0

requires home_current_command.Length==N0
requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_client.Length&&0<=j<home_current_client.Length==>home_current_client[i]!=home_current_client[j]

requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]
requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
//1
requires ((home_current_client[0] == i) && (home_current_command[0] == req_shared) && (home_exclusive_granted[0] == false)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_current_command
modifies home_sharer_list

{
  home_current_command[0] := epsilon;
  home_sharer_list[i] := true;
  cache[i] := shared;
}

method n_t5inv__1_1(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_client.Length==N0

requires home_current_command.Length==N0
requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_client.Length&&0<=j<home_current_client.Length==>home_current_client[i]!=home_current_client[j]

requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]
requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
//1
requires ((home_current_client[0] == i) && (home_current_command[0] == req_shared) && (home_exclusive_granted[0] == false)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_current_command
modifies home_sharer_list

{
  home_current_command[0] := epsilon;
  home_sharer_list[i] := true;
  cache[i] := shared;
}

method n_t5inv__1_2(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_client.Length==N0

requires home_current_command.Length==N0
requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_client.Length&&0<=j<home_current_client.Length==>home_current_client[i]!=home_current_client[j]

requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]
requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))//2
requires ((home_current_client[0] == i) && (home_current_command[0] == req_shared) && (home_exclusive_granted[0] == false)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_current_command
modifies home_sharer_list

{
  home_current_command[0] := epsilon;
  home_sharer_list[i] := true;
  cache[i] := shared;
}


method n_t6inv__1_0(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,   
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_client.Length==N0

requires home_current_command.Length==N0
requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0



requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_client.Length&&0<=j<home_current_client.Length==>home_current_client[i]!=home_current_client[j]

requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]
requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]



requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv2
requires (!((home_sharer_list[p__Inv0] == false) && (cache[p__Inv0] == exclusive)))//3
requires ((home_current_client[0] == i) && (home_current_command[0] == req_exclusive) && (home_exclusive_granted[0] == false) && (forall c  |0<= c<N0 :: (home_sharer_list[c] == false) )) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_current_command
modifies home_exclusive_granted
modifies home_sharer_list

{
  home_current_command[0] := epsilon;
  home_exclusive_granted[0] := true;
  home_sharer_list[i] := true;
  cache[i] := exclusive;
}

method n_t6inv__1_1(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,   
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_client.Length==N0

requires home_current_command.Length==N0
requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0



requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_client.Length&&0<=j<home_current_client.Length==>home_current_client[i]!=home_current_client[j]

requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]
requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]



requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i==p__Inv0
requires (!((home_sharer_list[p__Inv2] == false) && (cache[p__Inv2] == exclusive)))//3
requires ((home_current_client[0] == i) && (home_current_command[0] == req_exclusive) && (home_exclusive_granted[0] == false) && (forall c  |0<= c<N0 :: (home_sharer_list[c] == false) )) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_current_command
modifies home_exclusive_granted
modifies home_sharer_list

{
  home_current_command[0] := epsilon;
  home_exclusive_granted[0] := true;
  home_sharer_list[i] := true;
  cache[i] := exclusive;
}

method n_t6inv__1_2(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,   
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_client.Length==N0

requires home_current_command.Length==N0
requires home_exclusive_granted.Length==N0
requires home_sharer_list.Length==N0



requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_client.Length&&0<=j<home_current_client.Length==>home_current_client[i]!=home_current_client[j]

requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]
requires forall i,j::0<=i<home_exclusive_granted.Length&&0<=j<home_exclusive_granted.Length==>home_exclusive_granted[i]!=home_exclusive_granted[j]
requires forall i,j::0<=i<home_sharer_list.Length&&0<=j<home_sharer_list.Length==>home_sharer_list[i]!=home_sharer_list[j]



requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires i!=p__Inv0&&i!=p__Inv2
requires (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))//2
requires ((home_current_client[0] == i) && (home_current_command[0] == req_exclusive) && (home_exclusive_granted[0] == false) && (forall c  |0<= c<N0 :: (home_sharer_list[c] == false) )) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies cache
modifies home_current_command
modifies home_exclusive_granted
modifies home_sharer_list

{
  home_current_command[0] := epsilon;
  home_exclusive_granted[0] := true;
  home_sharer_list[i] := true;
  cache[i] := exclusive;
}


method n_t2inv__1_0(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_client.Length==N0

requires home_current_command.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_client.Length&&0<=j<home_current_client.Length==>home_current_client[i]!=home_current_client[j]

requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))//statement has nothing with prop--it guranttee itself

requires ((home_current_command[0] == epsilon) && (!(cache[i] == exclusive))) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies home_current_client
modifies home_current_command

{
  home_current_command[0] := req_exclusive;
  home_current_client[0] := i;
}


method n_t1inv__1_0(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>,
N0:nat,i:nat,
p__Inv0:nat,p__Inv2:nat)
requires N0>0

requires cache.Length==N0




requires home_current_client.Length==N0

requires home_current_command.Length==N0
requires forall i,j::0<=i<cache.Length&&0<=j<cache.Length==>cache[i]!=cache[j]




requires forall i,j::0<=i<home_current_client.Length&&0<=j<home_current_client.Length==>home_current_client[i]!=home_current_client[j]

requires forall i,j::0<=i<home_current_command.Length&&0<=j<home_current_command.Length==>home_current_command[i]!=home_current_command[j]
requires 0<=i<N0
requires p__Inv0!=p__Inv2&&p__Inv2<N0&& p__Inv0<N0
requires (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))//statement has nothing with prop--it guranttee itself

requires ((cache[i] == invalid) && (home_current_command[0] == epsilon)) //guard condition
ensures   (!((cache[p__Inv2] == exclusive) && (cache[p__Inv0] == exclusive)))
modifies home_current_client
modifies home_current_command

{
  home_current_command[0] := req_shared;
  home_current_client[0] := i;
}



