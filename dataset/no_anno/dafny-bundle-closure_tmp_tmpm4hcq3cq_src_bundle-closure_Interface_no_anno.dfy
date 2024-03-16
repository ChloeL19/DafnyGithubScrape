abstract module Interface {
  class Node {
    var next: set<Node>;
  }

  predicate graph(G:set<Node>)
    reads G

  // Path(G, x,y,p) means that p is a sequence starting with x, ending with y such
  // that forall i :: 0 <= i < |p|-1 ==> p[i+1] in p[i].next
  predicate Path(G: set<Node>,x:Node,y:Node,p:seq<Node>)
    reads G, p
  // Acyclic(G) means that forall n :: n in G ==> AcyclicFrom(G, {n}, G-{n})
  predicate Acyclic(G: set<Node>)
    reads G
}
