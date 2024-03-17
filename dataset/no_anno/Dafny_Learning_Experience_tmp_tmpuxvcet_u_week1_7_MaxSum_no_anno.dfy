method MaxSum(x:int, y:int) returns (s:int, m:int)
{
    s := x+y;
    if x > y{
      m := x;
    } else if y > x{
      m := y;
    } else {
      m := x;
    }
}

method Main() 
{
  var m, n := 4,5;
  var a,b := MaxSum(m,n);
  print "Search return a is ", a,",,,,, b is ", b, "\n";

}
