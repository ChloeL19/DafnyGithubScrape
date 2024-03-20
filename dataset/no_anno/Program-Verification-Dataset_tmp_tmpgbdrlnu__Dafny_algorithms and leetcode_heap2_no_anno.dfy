class Heap {
  var arr: array<int>

  constructor Heap (input: array<int>)
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
  {
    if (2*idx+1 >= this.arr.Length) && (2*idx+2 >= this.arr.Length) {
      nidx := -1;
      return;
    }
    else {
      nidx := idx;
      if 2*idx+1 < this.arr.Length && this.arr[nidx] < this.arr[2*idx+1] {
        nidx := 2*idx+1;
      }
      if 2*idx+2 < this.arr.Length && this.arr[nidx] < this.arr[2*idx+2] {
        nidx := 2*idx+2;
      }
      if nidx == idx {
        nidx := -1;
        return;
      }
      else {
        this.arr[idx], this.arr[nidx] := this.arr[nidx], this.arr[idx];
        forall i | 0 <= i < this.arr.Length
            if (i != nidx) && (2*i+1 < this.arr.Length) {
              if 2*i+1 == idx {
              }
            }
          }
        forall i | 0 <= i < this.arr.Length
            if (i != nidx) && (2*i+2 < this.arr.Length) {
              if 2*i+2 == idx {
              }
            }
        }
      }
    }
  }
}
