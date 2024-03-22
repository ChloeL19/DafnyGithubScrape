// verifies
// check that string between indexes low and high-1 are sorted
predicate Sorted(a: string, low:int, high:int)
requires 0 <= low <= high <= |a|
{ 
    forall j, k :: low <= j < k < high ==> a[j] <= a[k] 
}

method String3Sort(a: string) returns (b: string) 
requires |a| == 3;
ensures Sorted(b, 0, |b|);
ensures |a| == |b|;
ensures multiset{/* TODO */ } == multiset{a[0], a[1], a[2]};

{
    b := a;
    if (b[0] > b[1]) {
        b := b[0 := b[1]][1 := b[0]];
    }
    if (b[1] > b[2]) {
        b := b[1 := b[2]][2 := b[1]];
    }
    if (b[0] > b[1]) {
        b := b[0 := b[1]][1 := b[0]];
    }
}

method check() {/* TODO */ }
