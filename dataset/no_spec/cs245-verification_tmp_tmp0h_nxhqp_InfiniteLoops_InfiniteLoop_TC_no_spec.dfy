// InfiniteLoop_TC -- Stephanie McIntyre
// Based on examples in class 

/* This method is satisfied under Total Correctness.
   Do you know why? */
   
method InfiniteLoop_TC()
  /*Pre-Condition*/  requires false;
  /*Post-Condition*/ ensures true; //TBH, this can be anything...
{
  var x := 0;
  while(true)
  {
    x := x+1;
  }
}

