// RUN: %testDafnyForEachCompiler --refresh-exit-code=0 "%s" -- --relax-definite-assignment

method Main()
{/* TODO */ }

function Inc(x: int): int
{
  x + 2
}




