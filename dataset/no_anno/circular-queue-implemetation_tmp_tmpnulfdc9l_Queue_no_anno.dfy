class {:autocontracts} Queue {

  // Atributos
  var circularQueue: array<int>;
  var rear: nat;  // cauda
  var front: nat; // head
  var counter: nat;

  // Abstração
  ghost var Content: seq<int>;

  // Predicado
  ghost predicate Valid()
  {
    0 <= counter <= circularQueue.Length &&
    0 <= front &&
    0 <= rear &&
    Content == circularQueue[..]
  }

  // Construtor
  constructor()
  {
    circularQueue := new int[0];
    rear := 0;
    front := 0;
    Content := [];
    counter := 0;
  } //[tam] ; [1, 2, 3, 4]

  method insert(item: int)
    // requires rear <= circularQueue.Length
    // ensures (front == 0 && rear == 0 && circularQueue.Length == 1) ==>
    //     (
    //       Content == [item] &&
    //       |Content| == 1
    //     )
    // ensures circularQueue.Length != 0 ==>
    // (
    //   (front == 0 && rear == 0 && circularQueue.Length == 1) ==>
    //     (
    //       Content == old(Content)  &&
    //       |Content| == old(|Content|)

    //     )
    // ||
    //   (front == 0 && rear == circularQueue.Length-1 ) ==> 
    //     (
    //       Content == old(Content) + [item] &&
    //       |Content| == old(|Content|) + 1
    //     )
    // ||
    //   (rear + 1 != front && rear != circularQueue.Length-1 && rear + 1 < circularQueue.Length - 1) ==> 
    //     (
    //       Content == old(Content[0..rear]) + [item] + old(Content[rear..circularQueue.Length])
    //     )
    // ||
    //   (rear + 1 == front) ==> 
    //   (
    //     Content[0..rear + 1] == old(Content[0..rear]) + [item] &&
    //     forall i :: rear + 2 <= i <= circularQueue.Length ==> Content[i] == old(Content[i-1])
    //   )
    // )
    {

      //counter := counter + 1;
      // if front == 0 && rear == 0 && circularQueue.Length == 0
      // {
      //   var queueInsert: array<int>;
      //   queueInsert := new int [circularQueue.Length + 1];
      //   queueInsert[0] := item;
      //   circularQueue := queueInsert;
      //   Content := [item];
      //   rear := rear + 1;
      // }   
      // else if front == 0 && rear == circularQueue.Length-1 && circularQueue.Length > 0
      // {
      //   var queueInsert: array<int>;
      //   queueInsert := new int [circularQueue.Length + 1];
      //   var i: nat := 0;
      //   while i < circularQueue.Length
      //   invariant circularQueue.Length + 1 == queueInsert.Length
      //   {
      //     queueInsert[i] := circularQueue[i];
      //     i := i + 1;
      //   }
      //   queueInsert[queueInsert.Length - 1] := item;
      //   Content := Content + [item];
      //   rear := rear + 1;
      //   circularQueue := queueInsert;
      // }
    }

  method auxInsertEmptyQueue(item:int)
  {
    counter := counter + 1;
    var queueInsert: array<int>;
    queueInsert := new int [circularQueue.Length + 1];
    queueInsert[0] := item;
    circularQueue := queueInsert;
    Content := [item];
    rear := rear + 1;
  }

  method auxInsertEndQueue(item:int)
  // {
  //   counter := counter + 1;
  //   var queueInsert: array<int>;
  //   queueInsert := new int [circularQueue.Length + 1];
  //   var i: nat := 0;
  //   while i < circularQueue.Length
  //   invariant circularQueue.Length + 1 == queueInsert.Length
  //   invariant 0 <= i <= circularQueue.Length
  //   invariant forall j :: 0 <= j < i ==> queueInsert[j] == circularQueue[j]
  //   {
  //     queueInsert[i] := circularQueue[i];
  //     i := i + 1;
  //   }
  //   queueInsert[queueInsert.Length - 1] := item;
  //   Content := Content + [item];
  //   rear := rear + 1;
  //   circularQueue := queueInsert;
  // }

  method auxInsertSpaceQueue(item:int)
  /*{
    if counter == 0 {
      item := -1;

    } else {
      item := circularQueue[front];
      front := (front + 1) % circularQueue.Length;
      counter := counter - 1;
    }
  }*/

  method size() returns (size:nat)
  {
    size := counter;
  }

  method isEmpty() returns (isEmpty: bool)
  {
    isEmpty := if counter == 0 then true else false;
  }

  method contains(item: int) returns (contains: bool)
  {
    var i: nat := 0;
    contains := false;

    while (i < circularQueue.Length)
    {
      if (circularQueue[i] == item) {
        contains := true;
        break;
      }
      i := i + 1;
    }
  }

  // TODO
  method mergeQueues(otherQueue: Queue) returns (mergedQueue: Queue) 
  {
    
    // queue1.merge(queue2)
    var newQueueSize : int := otherQueue.circularQueue.Length + circularQueue.Length;
    var newFront: int := front;
    var newRear: int := otherQueue.rear;

    var tmp: array<int> := new int[newQueueSize];

    forall i | 0 <= i < circularQueue.Length
    { 
      tmp[i] := circularQueue[i];
    }

    // vamos copiar valores vazios?
    // como identificamos os vazios? entre o rear e o front
    // como iteramos entre rear e front? front -> rear
    // [1, 3, 5, 7, 9] + [0, 2, 4, 6, 8] => [0, 2, 4, 6, 8, 1, 3, 5, 7, 9]
    // front => 8 
    // rear => 0
    
    mergedQueue := new Queue(); 
  }
}

method Main ()
{
  var circularQueue := new Queue();
  var isQueueEmpty := circularQueue.isEmpty();
  var queueSize := circularQueue.size();
  circularQueue.auxInsertEmptyQueue(2);
  circularQueue.auxInsertEndQueue(4);
  circularQueue.auxInsertEndQueue(4);
  circularQueue.auxInsertEndQueue(56);
  var contains56 := circularQueue.contains(56);
  var contains4 := circularQueue.contains(4);
  var item := circularQueue.remove();
  //assert circularQueue.Content == [2, 4, 4, 56];

}
