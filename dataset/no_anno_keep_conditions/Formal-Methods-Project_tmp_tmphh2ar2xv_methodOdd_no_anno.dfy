method Odd(x: int) returns (r: int)
ensures r % 2 != 0;
{
  if (x % 2 != 0)
  {
    return x;
  }
  else
  {
    return x+1;
  }
}
method Main() {
  var a := Odd(4);
  var b := Odd(3);
  print a,"\n";
  print b; 
}

