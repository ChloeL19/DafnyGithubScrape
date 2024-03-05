module Types {

	/* Represents a set of quorums.
     - P is the set of identifiers of processes in the system
     - Q is the set of quorums */
	datatype QuorumConfig = QuorumConfig(P : set<nat>, Q : set<set<nat>>)

	/* Represents a quorum system.
		 - C is the configuration of processes and quorums
     - R is the survivor set
	   Only C is known to correct processes; R is hidden. */
	datatype QuorumSystem = QuorumSystem(C : QuorumConfig, R : set<nat>)
		
	/* Represents the status of a process. 
     U is "undecided", M is "maybe", D is "decided". */
	datatype Status = U | M | D

	/* Represents the result (new estimate and status) of a completed round. */
	datatype Result<T(==)> = Result(val : T, status : Status)
		
	/* Represents a proposal for val, made by a process with the given id. */
	datatype Proposal<T(==)> = Proposal(id : nat, val : T)

	/* Represents a message, broadcast by the process with the given source id, 
     proposing val for the given round. */
	datatype Message<T(==)>  = Message(src : nat, val : T, rnd : nat)

	/* Represents evidence for the result of a round. */
	datatype OtherQuorums = OtherQuorums(q2 : set<nat>, q3 : set<nat>, q4 : set<nat>)

	/* Represents the state of a process (either 'B'yzantine or 'N'on-'B'yzantine).*/
	datatype Process<T(==), S> =
		| BProcess(id : nat, inbox : set<Message<T>>, outbox : set<Message<T>>, st : S)
		| NBProcess(
		    id : nat,
		    C : QuorumConfig,
		    status : Status,
		    val : T,
		    rnd : nat,
		    inbox : set<Message<T>>,
		    outbox : set<Message<T>>,
		    val_hist : seq<T>,
		    re_hist : seq<Result<T>>,
		    proposals_hist : seq<set<Proposal<T>>>,
		    quorum_hist : seq<set<nat>>,
		    other_quorums_hist : seq<OtherQuorums>)
}

