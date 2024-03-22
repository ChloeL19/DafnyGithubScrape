function add (x: nat, y: nat): nat
{
  if (y == 0) then x
  else add (x, y-1) + 1
}








































lemma zero_add_lemma (x: nat)
  ensures add (0, x) == x
{/* TODO */ }

lemma add_zero_lemma (x: nat)
  ensures add (x, 0) == x
{/* TODO */ }

lemma add_plus_one (x: nat, y: nat)
  ensures add(x, y) + 1 == add(x, y+1);
{/* TODO */ }


lemma one_plus_add (x: nat, y: nat)
  ensures add(x, y) + 1 == add (x+1, y)
{/* TODO */ }



lemma add_comm_lemma (x: nat, y: nat)
  ensures add (x, y) == add (y, x);
{/* TODO */ }

