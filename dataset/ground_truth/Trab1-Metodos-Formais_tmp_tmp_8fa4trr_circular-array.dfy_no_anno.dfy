/*
  Class CircularArray.

  Names:
  Arthur Sudbrack Ibarra,
  Miguel Torres de Castro,
  Felipe Grosze Nipper,
  Willian Magnum Albeche,
  Luiz Eduardo Mello dos Reis.
*/
class {:autocontracts} CircularArray {
  /*
    Implementation
  */
  var arr: array<int>; // The array.
  var start: nat; // The index of the first element.
  var size: nat; // The number of elements in the queue.

  /*
    Abstraction.
  */
  ghost const Capacity: nat; // The capacity of the queue. (WE WERE UNABLE TO MAKE THE SIZE OF THE ARRAY DYNAMIC).
  ghost var Elements: seq<int>; // The elements in the array represented as a sequence.

  /*
    Class invariant.
  */
  ghost predicate Valid()
  {
    0 <= start < arr.Length &&
    0 <= size <= arr.Length &&
    Capacity == arr.Length &&
    Elements == if start + size <= arr.Length
                then arr[start..start + size]
                else arr[start..] + arr[..size - (arr.Length - start)]
  }

  /*
    Constructor.
  */
  constructor EmptyQueue(capacity: nat)
  {
    arr := new int[capacity];
    start := 0;
    size := 0;
    Capacity := capacity;
    Elements := [];
  }

  /*
    Enqueue Method
  */
  method Enqueue(e: int)
  {
    arr[(start + size) % arr.Length] := e;
    size := size + 1;
    Elements := Elements + [e];
  }

  /*
    Dequeue method.
  */
  method Dequeue() returns (e: int)
  {
    e := arr[start];
    if start + 1 < arr.Length {
      start := start + 1;
    }
    else {
      start := 0;
    }
    size := size - 1;
    Elements := Elements[1..];
  }

  /*
    Contains predicate.
  */
  predicate Contains(e: int)
  {
    if start + size < arr.Length then
      e in arr[start..start + size]
    else
      e in arr[start..] + arr[..size - (arr.Length - start)]
  }

  /*
    Size function.
  */
  function Size(): nat
  {
    size
  }

  /*
    IsEmpty predicate.
  */
  predicate IsEmpty()
  {
    size == 0
  }

  /*
    IsFull predicate.
  */
  predicate IsFull()
  {
    size == arr.Length
  }

  /*
    GetAt method.
    (Not requested in the assignment, but useful).
  */
  method GetAt(i: nat) returns (e: int)
  {
    e := arr[(start + i) % arr.Length];
  }

  /*
    AsSequence method.
    (Auxiliary method for the Concatenate method)
  */
  method AsSequence() returns (s: seq<int>)
    {
      s := if start + size <= arr.Length
           then arr[start..start + size]
           else arr[start..] + arr[..size - (arr.Length - start)];
    }

  /*
    Concatenate method.
  */
  method Concatenate(q1: CircularArray) returns(q2: CircularArray)
  {
    q2 := new CircularArray.EmptyQueue(arr.Length + q1.arr.Length);
    var s1 := AsSequence();
    var s2 := q1.AsSequence();
    var both := s1 + s2;
    forall i | 0 <= i < size
    {
      q2.arr[i] := both[i];
    }
    q2.size := size + q1.size;
    q2.start := 0;
    q2.Elements := Elements + q1.Elements;
    
    print q2.arr.Length;
    print q2.size;
  }
}

/*
  Main method.
  Here the the CircularArray class is demonstrated.
*/
method Main()
{
  var q := new CircularArray.EmptyQueue(10); // Create a new queue.
  q.Enqueue(1); // Enqueue the element 1.
  var e1 := q.GetAt(0); // Get the element at index 0.
  q.Enqueue(2); // Enqueue the element 2.
  var e2 := q.GetAt(1); // Get the element at index 1.
  var e := q.Dequeue(); // Dequeue the element 1.
  q.Enqueue(3); // Enqueue the element 3.
  e := q.Dequeue(); // Dequeue the element 2.
  e := q.Dequeue(); // Dequeue the element 3.
}

