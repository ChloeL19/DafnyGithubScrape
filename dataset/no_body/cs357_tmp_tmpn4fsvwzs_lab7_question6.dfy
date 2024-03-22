method swap(a: array<int>, i: nat, j: nat)
modifies a

requires i < a.Length && j < a.Length
requires i >= 0 && j >= 0
requires i != j

ensures a[i] == old(a[j])
ensures a[j] == old(a[i])
{/* TODO */ }

