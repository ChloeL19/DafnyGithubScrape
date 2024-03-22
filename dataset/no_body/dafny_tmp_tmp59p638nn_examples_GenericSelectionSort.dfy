

trait Comparable<T(==)> {
    function Lt(x: T, y: T): bool
}

  trait Sorted<T(==)> extends Comparable<T> {

    ghost predicate Ordered(a: array<T>, left: nat, right: nat)
      reads a
      requires left <= right <= a.Length
    {
      forall i: nat :: 0 < left <= i < right ==> Lt(a[i-1],a[i]) || a[i-1] == a[i]
    }

    twostate predicate Preserved(a: array<T>, left: nat, right: nat)
      reads a
      requires left <= right <= a.Length
    {
      multiset(a[left..right]) == multiset(old(a[left..right]))
    }

    twostate predicate Sorted(a: array<T>)
      reads a
    {
      Ordered(a,0,a.Length) && Preserved(a,0,a.Length)
    }

  }

//   trait SelectionSort<T(==)> extends Comparable<T>, Sorted<T> {

//     method SelectionSort(a: array<T>)
//       modifies a
//       ensures Sorted(a)
//     {/* TODO */ }

//   }

class Sort<T(==)> extends SelectionSort<T> {
    const CMP: (T,T) -> bool

    constructor(cmp: (T,T) -> bool)
      ensures CMP == cmp
      ensures comparisonCount == 0
    {
      CMP := cmp;
      comparisonCount := 0;
    }

    function Lt(x: T, y: T): bool {
      CMP(x,y)
    }
}

ghost function Sum(x: int): nat
{
    if x <= 0 then 0 else x + Sum(x-1)
}

trait Measurable<T(==)> extends Comparable<T> {

    ghost var comparisonCount: nat

    method Ltm(x: T, y: T) returns (b: bool)
      modifies this`comparisonCount
      ensures b ==> Lt(x,y)
      ensures comparisonCount == old(comparisonCount) + 1
    {/* TODO */ }

}

  trait SelectionSort<T(==)> extends Comparable<T>, Measurable<T>, Sorted<T> {

    method SelectionSort(a: array<T>)
      modifies a, this
      requires comparisonCount == 0
      ensures Sorted(a)
      ensures comparisonCount <= a.Length * a.Length
    {/* TODO */ }

}

method Main()
{/* TODO */ }
