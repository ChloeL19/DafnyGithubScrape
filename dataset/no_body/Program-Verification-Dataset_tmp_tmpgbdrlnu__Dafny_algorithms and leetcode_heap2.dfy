class Heap {
  var arr: array<int>

  constructor Heap (input: array<int>)
   ensures this.arr == input {
     this.arr := input;
  }

  function parent(idx: int): int
  {
    if idx == 0 then -1
    else if idx % 2 == 0 then (idx-2)/2
    else (idx-1)/2
  }

  predicate IsMaxHeap(input: seq<int>)
  {
    forall i :: 0 <= i < |input| ==>
      && (2*i+1 < |input| ==> input[i] >= input[2*i+1])
      && (2*i+2 < |input| ==> input[i] >= input[2*i+2])
  }

  predicate IsAlmostMaxHeap(input: seq<int>, idx: int)
    requires 0 <= idx
  {
    && (forall i :: 0 <= i < |input| ==>
        && (2*i+1 < |input| && i != idx ==> input[i] >= input[2*i+1])
        && (2*i+2 < |input| && i != idx ==> input[i] >= input[2*i+2]))
    && (0 <= parent(idx) < |input| && 2*idx+1 < |input| ==> input[parent(idx)] >= input[2*idx+1])
    && (0 <= parent(idx) < |input| && 2*idx+2 < |input| ==> input[parent(idx)] >= input[2*idx+2])
  }

  method heapify(idx: int)
    returns (nidx: int)
    modifies this, this.arr
    requires 0 <= idx < this.arr.Length
    requires IsAlmostMaxHeap(this.arr[..], idx)
    ensures nidx == -1 || idx < nidx < this.arr.Length
    ensures nidx == -1 ==> IsMaxHeap(this.arr[..])
    ensures idx < nidx < this.arr.Length ==> IsAlmostMaxHeap(this.arr[..], nidx)
  {/* TODO */ }
}
