type role = string
datatype message = Nil | Aenc(aencMsg:message,aencKey:message) | Senc(m1:message,m2:message) | K(r1:role,r2:role) | Pk(r:role) | Sk(r:role) | Str(r:role) | Var(n:role) | Pair(m1:message,m2:message)
type channel = array<message>
method AliceSendMsg_1(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{
    var msg := Pair(Str("A"),Str("B"));
    c[0] := msg;
}
method ServerSendMsg_1(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{
    var aencMsg := Pair(Pk("B"),Str("B"));
    var msg := Aenc(aencMsg,Pk("S"));
    c[0] := msg;
}

method AliceSendMsg_2(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{
    var aencMsg := Pair(Var("Na"),Str("A"));
    var msg := Aenc(aencMsg,Pk("B"));
    c[0] := msg;
}
method BobSendMsg_1(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{
    var msg := Pair(Str("B"),Str("A"));
    c[0] := msg;
}

method ServerSendMsg_2(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{
    var aencMsg := Pair(Pk("A"),Str("A"));
    var msg := Aenc(aencMsg,Pk("S"));
    c[0] := msg;
}

method BobSendMsg_2(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{
    var aencMsg := Pair(Pair(Var("Na"),Var("Nb")),Str("B"));
    var msg := Aenc(aencMsg, Pk("A"));
    c[0] := msg;
}

method AliceSendMsg_3(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{
    var aencMsg := Var("Nb");
    var msg := Aenc(aencMsg,Pk("B"));
    c[0] := msg;
}

method IntruderGetMsg(c:channel,advKnw:set<message>,i:int) returns (advKnw1:set<message>)
    requires c.Length > 0
    requires c[0] != Nil && c[0] != Var("Nb")
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw1    
    ensures c[0] == Nil
    modifies c
{   
    advKnw1 := advKnw + {c[0]};
    c[0]:=Nil;
}

method IntruderSendMsg(c:channel,m:message,advKnw:set<message>)
    requires c.Length > 0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    requires m != Nil
    requires m in advKnw
    ensures c[0]!=Nil
    modifies c
{
    c[0] :=m;
} 

method aencrtpy(aencMsg:message,aencKey:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires aencMsg in advKnw
    requires aencKey in advKnw
    requires Aenc(aencMsg,aencKey) !in advKnw
    ensures Aenc(aencMsg,aencKey) in advKnw1
{
    var aencMsg1:=Aenc(aencMsg,aencKey);
    advKnw1:=advKnw+{aencMsg1};
}


method dencrtpy(msg:message,aencKey:message,aencMsg:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires msg in advKnw
    requires aencKey in advKnw
    requires aencMsg != Var("Nb")
    requires aencMsg !in advKnw
    requires msg == Aenc(aencMsg,aencKey)
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw1
    ensures aencMsg in advKnw1
{
     advKnw1:=advKnw+{aencMsg};
}


method sencrtpy(sencMsg:message,sencKey:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires sencMsg in advKnw
    requires sencKey in advKnw
    requires Senc(sencMsg,sencKey) !in advKnw
    ensures Senc(sencMsg,sencKey) in advKnw1
{
        var sencMsg1:=Senc(sencMsg,sencKey);
        advKnw1:=advKnw+{sencMsg1};
}

method dsencrtpy(msg:message,sencKey:message,sencMsg:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires msg in advKnw
    requires sencKey in advKnw
    requires sencMsg !in advKnw
    requires msg == Senc(sencMsg,sencKey)
    requires sencMsg != Var("Nb")
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw1
    ensures sencMsg in advKnw1
{
        advKnw1:=advKnw+{sencMsg};
}


method Separate(pairMsg:message,m1:message,m2:message,advKnw:set<message>)returns (advKnw1:set<message>)
    requires pairMsg in advKnw
    requires pairMsg == Pair(m1,m2)
    requires m1 !in advKnw || m2 !in advKnw
    requires m1 != Var("Nb") && m2 != Var("Nb")
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw1
    ensures m1 in advKnw1 && m2 in advKnw1
{
        advKnw1:=advKnw+{m1,m2};
}

method Pairing(m1:message,m2:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires m1 in advKnw
    requires m2 in advKnw
    requires Pair(m1,m2) !in advKnw
    ensures Pair(m1,m2) in advKnw1
{ 
    advKnw1:=advKnw+{Pair(m1,m2)};    
}
