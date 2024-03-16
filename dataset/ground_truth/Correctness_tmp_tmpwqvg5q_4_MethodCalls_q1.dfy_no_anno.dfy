/**
  (a) Verify whether or not the following program
      satisfies total correctness.
      You should use weakest precondition reasoning
      and may extend the loop invariant if required.
      You will need to add a decreases clause to prove termination
  (a) Weakest precondition proof (without termination) (6 marks)
      Termination proof (2marks)
*/

function fusc(n: int): nat

lemma rule1()
{
  b := 0;
  var n, a := N, 1;
  {
    ghost var d := n; // termination metric

    {
      rule4(n/2);
      rule3(n/2);
      a := a + b;
      
      n := n / 2;
      
    } else {
      rule4((n-1)/2);
      rule3((n-1)/2);
      rule3((n+1)/2);
              b * fusc(n) - b  * fusc(n) + b  * fusc(((n-1)/2)+1) + a * fusc(n);
      
              b * fusc(n) - b  * (fusc(n) - fusc(((n-1)/2)+1)) + a * fusc(n);
      
              a * fusc(n - 1) + b  * fusc(n) - b  * fusc(n-1) + a * fusc(n) - a * fusc(n-1);
      b := b + a;
      
      n := (n - 1) / 2;

    }
  }
  rule1();
  rule2();
}