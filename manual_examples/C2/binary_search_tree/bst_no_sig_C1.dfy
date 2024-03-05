datatype Tree = Empty | Node(left: Tree, value: int, right: Tree)

predicate foo(tree: Tree)
  decreases tree
{
  match tree
  case Empty => true
  case Node(_,_,_) =>
    (tree.left == Empty || tree.left.value < tree.value)
    && (tree.right == Empty || tree.right.value > tree.value)
    && foo(tree.left) && foo(tree.right)
    && bar2(tree.right, tree.value) && bar1(tree.left, tree.value)
}

predicate bar1(tree: Tree, max: int)
  decreases tree
{
  match tree
  case Empty => true
  case Node(left,v,right) => (max > v) && bar1(left, max) && bar1(right, max)
}

predicate bar2(tree: Tree, min: int)
  decreases tree
{
  match tree
  case Empty => true
  case Node(left,v,right) => (min < v) && bar2(left, min) && bar2(right, min)
}

method bar3(tree: Tree) returns (res: int)
{
  match tree {
    case Empty => res := 0;
    case Node (Empty, value, Empty) => res := tree.value;
    case Node (Empty, value, right) => res := tree.value;
    case Node (left, value, right) =>
      var minval := tree.value;
      minval := bar3(tree.left);
      var tmp := Node(tree.left, minval, tree.right);
      res := tmp.value;
  }
}

method bar4(tree: Tree) returns (res: int)
{
  match tree {
    case Empty => res := 0;
    case Node (Empty, value, Empty) => res := tree.value;
    case Node (left, value, Empty) => res := tree.value;
    case Node (left, value, right) =>
      var minval := tree.value;
      minval := bar4(tree.right);
      var tmp := Node(tree.left, minval, tree.right);
      res := tmp.value;
  }
}

method bar5(tree: Tree, value : int) returns (res: Tree)
  requires foo(tree)
  decreases tree;
  ensures foo(res)
{
  res := bar6(tree, value);
}

method bar6(tree: Tree, value: int) returns (res: Tree)
  requires foo(tree)
  decreases tree;
  ensures res != Empty ==> foo(res)
  ensures forall x :: bar2(tree, x) && x < value ==> bar2(res, x)
  ensures forall x :: bar1(tree, x) && x > value ==> bar1(res, x)
{
  match tree {
    case Empty => res := Node(Empty, value, Empty);
    case Node(_,_,_) =>
      var temp: Tree;
      if(value == tree.value) {
        return tree;
      }
      if(value < tree.value){
        temp := bar6(tree.left, value);
        res := Node(temp, tree.value, tree.right);
      }else if (value > tree.value){
        temp := bar6(tree.right, value);
        res := Node(tree.left, tree.value, temp);
      }
  }
}

method bar7(tree: Tree, value: int) returns (res: Tree)
  requires foo(tree)
  decreases tree;
{
  match tree {
    case Empty => return tree;
    case Node(_,_ ,_) =>
      var temp: Tree;
      if (value < tree.value){
        temp := bar7(tree.left, value);
        res := Node(temp, tree.value, tree.right);
      } else if (value > tree.value){
        temp :=bar7(tree.right, value);
        res := Node(tree.left, tree.value, temp);
      } else {
        if (tree.left == Empty){
          return tree.right;
        } else if (tree.right == Empty) {
          return tree.left;
        }
        var minVal := bar3(tree.right);
        temp := bar7(tree.right, minVal);
        res := Node(tree.left, minVal, temp);
      }
  }
}

method bar8(tree: Tree)
{
  match tree {
    case Empty =>
    case Node(left, value, right) =>
      bar8(tree.left);
      print tree.value, ", ";
      bar8(tree.right);
  }
}

method bar9(tree: Tree)
{
  match tree {
    case Empty =>
    case Node(left, value, right) =>
      bar9(tree.left);
      bar9(tree.right);
      print tree.value, ", ";
  }
}

method Main() {
  var tree := bar5(Empty, 3);
  var u := bar5(tree, 2);

  u := bar5(u, 7);
  u := bar5(u, 6);
  u := bar5(u, 9);


  print "This is Inorder: ";
  bar8(u);
  print "\n";

  print "This is Postorder: ";
  bar9(u);
  print "\n";

  print "tree before delete: ", u, "\n";

  u := bar7(u, 7);
  print "tree after delete: ", u, "\n";

  print "This is Inorder: ";
  bar8(u);

  print "\n";
  print "This is Postorder: ";
  bar9(u);
}
