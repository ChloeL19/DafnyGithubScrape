method M()
{
  N();
  if (*)
  {

  }
  else
  {
  }
  N();
  {

  }
  else
  {
  }
}


method N()
  ensures (forall b: bool :: b || !b) || 2 != 2;

