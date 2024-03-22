// one of my own soluition avoiding self reference (some wierd induction).
function add(x:nat, y:nat): nat
{
  if(y == 0) then x
  else add(x,y - 1) + 1
}

lemma add_to_zero_lemma (x:nat, y:nat)
  ensures add(x, y) == add(x, 0) + y
{/* TODO */ }

lemma zero_to_add_lemma (x:nat, y:nat)
  ensures add(x, y) == add(0, y) + x
{/* TODO */ }

lemma add_comm_zero_lemma (x:nat)
  ensures add(x,0) == add(0, x)

lemma add_comm_lemma (x: nat, y: nat)
  ensures add(x,y) == add(y,x)
{/* TODO */ }
