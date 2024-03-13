datatype channelType = epsilon| req_shared| req_exclusive
datatype cacheType = invalid| shared| exclusive
type client=nat
type boolean=bool




method n_t3inv__1_0(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
{
  home_exclusive_granted[0] := false;
  cache[i] := invalid;
  home_sharer_list[i] := false;
}

method n_t3inv__1_1(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
{
  home_exclusive_granted[0] := false;
  cache[i] := invalid;
  home_sharer_list[i] := false;
}

method n_t3inv__1_2(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
{
  home_exclusive_granted[0] := false;
  cache[i] := invalid;
  home_sharer_list[i] := false;
}


method n_t4inv__1_0(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
{
  home_exclusive_granted[0] := false;
  cache[i] := shared;
  home_sharer_list[i] := true;
}

method n_t4inv__1_1(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
{
  home_exclusive_granted[0] := false;
  cache[i] := shared;
  home_sharer_list[i] := true;
}

method n_t4inv__1_2(cache:array<cacheType>,     home_current_command:array<channelType>,  home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
{
  home_exclusive_granted[0] := false;
  cache[i] := shared;
  home_sharer_list[i] := true;
}


method n_t5inv__1_0(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
{
  home_current_command[0] := epsilon;
  home_sharer_list[i] := true;
  cache[i] := shared;
}

method n_t5inv__1_1(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
{
  home_current_command[0] := epsilon;
  home_sharer_list[i] := true;
  cache[i] := shared;
}

method n_t5inv__1_2(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,
{
  home_current_command[0] := epsilon;
  home_sharer_list[i] := true;
  cache[i] := shared;
}


method n_t6inv__1_0(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,   
{
  home_current_command[0] := epsilon;
  home_exclusive_granted[0] := true;
  home_sharer_list[i] := true;
  cache[i] := exclusive;
}

method n_t6inv__1_1(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,   
{
  home_current_command[0] := epsilon;
  home_exclusive_granted[0] := true;
  home_sharer_list[i] := true;
  cache[i] := exclusive;
}

method n_t6inv__1_2(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>, home_exclusive_granted:array<boolean>, home_sharer_list:array<boolean>,   
{
  home_current_command[0] := epsilon;
  home_exclusive_granted[0] := true;
  home_sharer_list[i] := true;
  cache[i] := exclusive;
}


method n_t2inv__1_0(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>,
{
  home_current_command[0] := req_exclusive;
  home_current_client[0] := i;
}


method n_t1inv__1_0(cache:array<cacheType>,     home_current_client:array<client>,  home_current_command:array<channelType>,
{
  home_current_command[0] := req_shared;
  home_current_client[0] := i;
}



