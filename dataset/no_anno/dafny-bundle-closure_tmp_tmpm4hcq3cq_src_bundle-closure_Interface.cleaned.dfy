abstract module Interface {
  class Node {
  class Node {
    var next: set<Node>;
  }

  predicate graph(G:set<Node>)
  predicate Path(G: set<Node>,x:Node,y:Node,p:seq<Node>)
  // Acyclic(G) means that forall n :: n in G ==> AcyclicFrom(G, {n}, G-{n})
  predicate Acyclic(G: set<Node>)
  predicate AcyclicFrom(G: set<Node>, ns: set<Node>, rs: set<Node>)
  method foldNext(G: set<Node>, ns: set<Node>) returns (ms: set<Node>)
