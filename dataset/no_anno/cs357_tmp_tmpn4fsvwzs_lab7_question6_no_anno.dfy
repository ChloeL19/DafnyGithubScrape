method swap(a: array<int>, i: nat, j: nat)
modifies a

{
    var temp:= a[i];
    a[i]:= a[j];
    a[j]:= temp;
}

