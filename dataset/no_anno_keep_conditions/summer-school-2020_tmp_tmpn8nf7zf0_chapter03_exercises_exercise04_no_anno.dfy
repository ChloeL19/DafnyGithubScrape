// Your goal is to model a lock service that consists of a single server and an
// arbitrary number of clients. The server provides the functionality of an
// exclusive lock. Initially, the server holds the lock. A client can acquire
// the lock (if the lock is currently held by the server) or it can return the
// lock (if it currently holds it). 
//
// Don't just have a single variable that says who holds the lock.
// Model the server as one piece of state, and each client as a separate piece
// of state. Representing the node states separately models the idea that each
// node has its own view of the world.
//
// Do not model the network. Instead, model the beliefs of the server and each
// of the clients, and allow steps that update a pair of (server, some client)
// simultaneously (skipping the network asynchrony).
//
// Your state machine should reflect the state of the entire distributed system;
// so it’s OK to have a single transition that atomically modifies the state of
// multiple nodes in the system. 

// Here's a helpful boilerplate for the inductive proof structure.

datatype State = State(/* You define this ...*/)

predicate Init(s:State) {
  true  // Replace me
}

predicate Next(s:State, s':State) {
  true  // Replace me
}

predicate Safety(s:State) {
  true  // Change me to the important property!
}

predicate Inv(s: State) {
  Safety(s)
}

// This is the boilerplate proof obligation you might like. For this exercise,
// focus on modeling the system described above with a state machine and
// *stating* a safety property; don't try to prove the safety property yet.
// We'll prove it in chapter04/exercise02.
//
// lemma SafetyProof()
//   ensures forall s :: Init(s) ==> Inv(s)
//   ensures forall s, s' :: Inv(s) && Next(s, s') ==> Inv(s')
//   ensures forall s :: Inv(s) ==> Safety(s)
// {
// }

