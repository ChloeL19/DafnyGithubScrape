method mergeSort(a: array<int>)
modifies a
{/* TODO */ }

method merging(a: array<int>, low: int, medium: int, high: int)
requires 0 <= low <= medium <= high < a.Length
modifies a
{/* TODO */ }

method sorting(a: array<int>, low: int, high: int)
requires 0 <= low && high < a.Length
decreases high-low
modifies a
{/* TODO */ }
