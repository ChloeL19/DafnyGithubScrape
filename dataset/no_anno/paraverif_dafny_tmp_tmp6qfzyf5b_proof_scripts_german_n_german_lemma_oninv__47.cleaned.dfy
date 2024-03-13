datatype CACHE_STATE = I| S| E
datatype MSG_CMD = Empty| ReqS| ReqE| Inv| InvAck| GntS| GntE
type NODE=nat
type DATA=nat
type boolean=bool




method n_RecvReqSinv__47_0(Chan1_Cmd:array<MSG_CMD>,   Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, InvSet:array<boolean>,  ShrSet:array<boolean>,
{
  CurCmd[0] := ReqS;
  CurPtr[0] := i;
  Chan1_Cmd[i] := Empty;
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    InvSet[j] := ShrSet[j];
  
 j:=j+1;
}
}

method n_RecvReqSinv__47_1(Chan1_Cmd:array<MSG_CMD>,   Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, InvSet:array<boolean>,  ShrSet:array<boolean>,
{
  CurCmd[0] := ReqS;
  CurPtr[0] := i;
  Chan1_Cmd[i] := Empty;
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    InvSet[j] := ShrSet[j];
  
 j:=j+1;
}
}

method n_RecvReqSinv__47_2(Chan1_Cmd:array<MSG_CMD>,   Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, InvSet:array<boolean>,  ShrSet:array<boolean>,
{
  CurCmd[0] := ReqS;
  CurPtr[0] := i;
  Chan1_Cmd[i] := Empty;
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    InvSet[j] := ShrSet[j];
  
 j:=j+1;
}
}


method n_RecvReqEinv__47_0(Chan1_Cmd:array<MSG_CMD>,   Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, InvSet:array<boolean>,  ShrSet:array<boolean>,
{
  CurCmd[0] := ReqE;
  CurPtr[0] := i;
  Chan1_Cmd[i] := Empty;
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    InvSet[j] := ShrSet[j];
  
 j:=j+1;
}
}

method n_RecvReqEinv__47_1(Chan1_Cmd:array<MSG_CMD>,   Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, InvSet:array<boolean>,  ShrSet:array<boolean>,
{
  CurCmd[0] := ReqE;
  CurPtr[0] := i;
  Chan1_Cmd[i] := Empty;
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    InvSet[j] := ShrSet[j];
  
 j:=j+1;
}
}

method n_RecvReqEinv__47_2(Chan1_Cmd:array<MSG_CMD>,   Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, InvSet:array<boolean>,  ShrSet:array<boolean>,
{
  CurCmd[0] := ReqE;
  CurPtr[0] := i;
  Chan1_Cmd[i] := Empty;
  var j:=0;
  while(j<N0)
    decreases N0-j
 {
    InvSet[j] := ShrSet[j];
  
 j:=j+1;
}
}


method n_SendInvAckinv__47_0(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>, Chan2_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>, 
{
  Chan2_Cmd[i] := Empty;
  Chan3_Cmd[i] := InvAck;
  if (Cache_State[i] == E) {
    Chan3_Data[i] := Cache_Data[i];
  }
  Cache_State[i] := I;
}

method n_SendInvAckinv__47_1(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>, Chan2_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>, 
{
  Chan2_Cmd[i] := Empty;
  Chan3_Cmd[i] := InvAck;
  if (Cache_State[i] == E) {
    Chan3_Data[i] := Cache_Data[i];
  }
  Cache_State[i] := I;
}

method n_SendInvAckinv__47_2(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>, Chan2_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>,  Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>, 
{
  Chan2_Cmd[i] := Empty;
  Chan3_Cmd[i] := InvAck;
  if (Cache_State[i] == E) {
    Chan3_Data[i] := Cache_Data[i];
  }
  Cache_State[i] := I;
}


method n_RecvInvAckinv__47_0(Chan3_Cmd:array<MSG_CMD>,    Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__47_1(Chan3_Cmd:array<MSG_CMD>,    Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}

method n_RecvInvAckinv__47_2(Chan3_Cmd:array<MSG_CMD>,    Chan3_Data:array<DATA>, CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
{
  Chan3_Cmd[i] := Empty;
  ShrSet[i] := false;
  if (ExGntd[0] == true) {
    ExGntd[0] := false;
    MemData[0] := Chan3_Data[i];
  }
}


method n_SendGntSinv__47_0(Chan2_Cmd:array<MSG_CMD>,   Chan2_Data:array<DATA>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
{
  Chan2_Cmd[i] := GntS;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  CurCmd[0] := Empty;
}

method n_SendGntSinv__47_1(Chan2_Cmd:array<MSG_CMD>,   Chan2_Data:array<DATA>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
{
  Chan2_Cmd[i] := GntS;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  CurCmd[0] := Empty;
}

method n_SendGntSinv__47_2(Chan2_Cmd:array<MSG_CMD>,   Chan2_Data:array<DATA>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,
{
  Chan2_Cmd[i] := GntS;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  CurCmd[0] := Empty;
}


method n_SendGntEinv__47_0(Chan2_Cmd:array<MSG_CMD>,   Chan2_Data:array<DATA>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,   
{
  Chan2_Cmd[i] := GntE;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  ExGntd[0] := true;
  CurCmd[0] := Empty;
}

method n_SendGntEinv__47_1(Chan2_Cmd:array<MSG_CMD>,   Chan2_Data:array<DATA>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,   
{
  Chan2_Cmd[i] := GntE;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  ExGntd[0] := true;
  CurCmd[0] := Empty;
}

method n_SendGntEinv__47_2(Chan2_Cmd:array<MSG_CMD>,   Chan2_Data:array<DATA>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  CurPtr:array<NODE>, ExGntd:array<boolean>, MemData:array<DATA>, ShrSet:array<boolean>,   
{
  Chan2_Cmd[i] := GntE;
  Chan2_Data[i] := MemData[0];
  ShrSet[i] := true;
  ExGntd[0] := true;
  CurCmd[0] := Empty;
}


method n_SendReqE__part__1inv__47_0(Cache_State:array<CACHE_STATE>,   Chan1_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>, 
{
  Chan1_Cmd[i] := ReqE;
}


method n_Storeinv__47_0(AuxData:array<DATA>,   Cache_Data:array<DATA>,  Cache_State:array<CACHE_STATE>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,
{
  Cache_Data[i] := d;
  AuxData[0] := d;
}


method n_RecvGntSinv__47_0(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>, Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>, 
{
  Cache_State[i] := S;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}


method n_RecvGntEinv__47_0(Cache_Data:array<DATA>,   Cache_State:array<CACHE_STATE>, Chan2_Cmd:array<MSG_CMD>, Chan2_Data:array<DATA>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>, 
{
  Cache_State[i] := E;
  Cache_Data[i] := Chan2_Data[i];
  Chan2_Cmd[i] := Empty;
}


method n_SendInv__part__0inv__47_0(Chan2_Cmd:array<MSG_CMD>,   Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  InvSet:array<boolean>,
{
  Chan2_Cmd[i] := Inv;
  InvSet[i] := false;
}


method n_SendReqE__part__0inv__47_0(Cache_State:array<CACHE_STATE>,   Chan1_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>, 
{
  Chan1_Cmd[i] := ReqE;
}


method n_SendInv__part__1inv__47_0(Chan2_Cmd:array<MSG_CMD>,   Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>,  ExGntd:array<boolean>, InvSet:array<boolean>,
{
  Chan2_Cmd[i] := Inv;
  InvSet[i] := false;
}


method n_SendReqSinv__47_0(Cache_State:array<CACHE_STATE>,   Chan1_Cmd:array<MSG_CMD>, Chan3_Cmd:array<MSG_CMD>,  CurCmd:array<MSG_CMD>, 
{
  Chan1_Cmd[i] := ReqS;
}



