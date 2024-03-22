// RUN: %testDafnyForEachCompiler --refresh-exit-code=0 "%s" -- --relax-definite-assignment

method lol() returns (c: int)
{/* TODO */ }

