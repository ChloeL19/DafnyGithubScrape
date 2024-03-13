// one of my own soluition avoiding self reference (some wierd induction).
function add(x:nat, y:nat): nat
{
  if(y == 0) then x
  else add(x,y - 1) + 1
}

lemma add_to_zero_lemma (x:nat, y:nat)
  ensures add(x, y) == add(x, 0) + y
{
}

lemma zero_to_add_lemma (x:nat, y:nat)
  ensures add(x, y) == add(0, y) + x
{
}

lemma add_comm_zero_lemma (x:nat)
  ensures add(x,0) == add(0, x)

lemma add_comm_lemma (x: nat, y: nat)
  ensures add(x,y) == add(y,x)
{
  if (x == 0) {}
  else if (y == 0) {}
  else
  {
    calc
    {
      add(x, y);
      {add_to_zero_lemma(x, y);}
      add(x, 0) + y;
      {add_comm_zero_lemma(x);}
      add(0, x) + y;
      {zero_to_add_lemma(y, x);}
      add(y, x);
    }
    // calc
    // {
    //   add(x, y);
    //   add(x, y-1) + 1;
    //   {add_comm_lemma(x, y-1);}
    //   add(y-1, x) + 1;
    //   add(y, x);
    // }
  }
}
