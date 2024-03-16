// RUN: /compile:0 /nologo /rlimit:10000

lemma lemma_mul_le(x: int, y: int, z: int)
{}

method foo(input: array<int>, rows:int, cols:int)
{
   var i := 0;
   while i < rows
   {
     var j := 0;
     while j < cols
     {
       lemma_mul_le(i, rows-1, cols);
       var s := input[i*cols + j];
       j := j + 1;
     }
     i := i + 1;
   }
}

