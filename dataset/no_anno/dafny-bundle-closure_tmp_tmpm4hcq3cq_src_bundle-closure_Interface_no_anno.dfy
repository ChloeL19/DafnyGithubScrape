abstract module Interface {
  class Node {
    var next: set<Node>;
  }

  predicate graph(G:set<Node>)
  // Acyclic(G) means that forall n :: n in G ==> AcyclicFrom(G, {n}, G-{n})
  predicate Acyclic(G: set<Node>)
}
