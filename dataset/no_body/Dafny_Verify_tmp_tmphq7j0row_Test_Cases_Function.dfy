function Average (a: int, b: int): int 
{
    (a + b) / 2
}

method TripleConditions(x: int) returns (r: int) 
ensures r == 3 * x
{/* TODO */ }

method Triple' (x: int) returns (r: int) 
    ensures Average(r, 3 * x) == 3 * x
    ensures r == 3 * x
{/* TODO */ }


method ProveSpecificationsEquivalent(x: int) {/* TODO */ }

