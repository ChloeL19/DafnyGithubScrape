type role = string
datatype message = Nil | Aenc(aencMsg:message,aencKey:message) | Senc(m1:message,m2:message) | K(r1:role,r2:role) | Pk(r:role) | Sk(r:role) | Str(r:role) | Var(n:role) | Pair(m1:message,m2:message)
type channel = array<message>
method AliceSendMsg_1(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{/* TODO */ }
method ServerSendMsg_1(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{/* TODO */ }

method AliceSendMsg_2(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{/* TODO */ }
method BobSendMsg_1(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{/* TODO */ }

method ServerSendMsg_2(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{/* TODO */ }

method BobSendMsg_2(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{/* TODO */ }

method AliceSendMsg_3(c:channel,advKnw:set<message>)
    requires c.Length>0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    ensures c[0] != Nil
    modifies c
{/* TODO */ }

method IntruderGetMsg(c:channel,advKnw:set<message>,i:int) returns (advKnw1:set<message>)
    requires c.Length > 0
    requires c[0] != Nil && c[0] != Var("Nb")
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw1    
    ensures c[0] == Nil
    modifies c
{/* TODO */ }

method IntruderSendMsg(c:channel,m:message,advKnw:set<message>)
    requires c.Length > 0
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw
    requires m != Nil
    requires m in advKnw
    ensures c[0]!=Nil
    modifies c
{/* TODO */ } 

method aencrtpy(aencMsg:message,aencKey:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires aencMsg in advKnw
    requires aencKey in advKnw
    requires Aenc(aencMsg,aencKey) !in advKnw
    ensures Aenc(aencMsg,aencKey) in advKnw1
{/* TODO */ }


method dencrtpy(msg:message,aencKey:message,aencMsg:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires msg in advKnw
    requires aencKey in advKnw
    requires aencMsg != Var("Nb")
    requires aencMsg !in advKnw
    requires msg == Aenc(aencMsg,aencKey)
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw1
    ensures aencMsg in advKnw1
{/* TODO */ }


method sencrtpy(sencMsg:message,sencKey:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires sencMsg in advKnw
    requires sencKey in advKnw
    requires Senc(sencMsg,sencKey) !in advKnw
    ensures Senc(sencMsg,sencKey) in advKnw1
{/* TODO */ }

method dsencrtpy(msg:message,sencKey:message,sencMsg:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires msg in advKnw
    requires sencKey in advKnw
    requires sencMsg !in advKnw
    requires msg == Senc(sencMsg,sencKey)
    requires sencMsg != Var("Nb")
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw1
    ensures sencMsg in advKnw1
{/* TODO */ }


method Separate(pairMsg:message,m1:message,m2:message,advKnw:set<message>)returns (advKnw1:set<message>)
    requires pairMsg in advKnw
    requires pairMsg == Pair(m1,m2)
    requires m1 !in advKnw || m2 !in advKnw
    requires m1 != Var("Nb") && m2 != Var("Nb")
    requires Var("Nb") !in advKnw
    ensures Var("Nb") !in advKnw1
    ensures m1 in advKnw1 && m2 in advKnw1
{/* TODO */ }

method Pairing(m1:message,m2:message,advKnw:set<message>) returns (advKnw1:set<message>)
    requires m1 in advKnw
    requires m2 in advKnw
    requires Pair(m1,m2) !in advKnw
    ensures Pair(m1,m2) in advKnw1
{/* TODO */ }
