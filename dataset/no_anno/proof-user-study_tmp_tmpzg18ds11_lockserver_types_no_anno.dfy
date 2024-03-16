module Types {

datatype agent = S | C
datatype Id = Id(agt:agent, idx:nat)
type Epoch = nat

datatype Message = Request(e:Epoch)     // Client requests lock
                | Release(e:Epoch)      // Client releases lock
                | Grant(e:Epoch)        // Server grants lock
                | Reject(e:Epoch)       // Server denies a client request=

datatype Packet = Packet(src:Id, dst:Id, msg:Message)


}
