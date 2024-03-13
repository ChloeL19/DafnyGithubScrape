// Ch. 6: Lists

datatype List<T> = Nil | Cons(head: T, tail: List<T>)

function Length<T>(xs: List<T>): int
{
    match xs
    case Nil => 0
    case Cons(_, tl) => 1 + Length(tl)
}

function Length'<T>(xs: List<T>): int
{
    if xs.Nil? then 0 else  1 + Length(xs.tail)
}

// Ex 6.0
lemma LengthIsLength'<T>(xs: List<T>)
{}

function Snoc<T>(xs: List<T>, y: T): List<T>
{
    match xs
    case Nil => Cons(y, Nil)
    case Cons(hd, tl) => Cons(hd, Snoc(tl, y))
}

// Ex 6.1
lemma {:induction false} LengthSnoc<T>(xs: List<T>, y: T)
lemma {:induction false} LengthSnoc<T>(xs: List<T>, y: T)
  ensures Length(Snoc(xs, y)) == Length(xs) + 1
{
    match xs
    case Nil => {}
    case Cons(hd, tl) => {
        LengthSnoc(tl, y);
    }
}

function Append<T>(xs: List<T>, ys: List<T>): List<T>
{
    match xs
    case Nil => ys
    case Cons(hd, tl) => Cons(hd, Append(tl, ys))
}

// extrinsic
lemma LengthAppend<T>(xs: List<T>, ys: List<T>)
{}

// Ex 6.2
lemma SnocIsAppend<T>(xs: List<T>, y: T)
{}

// Ex 6.3
lemma {:induction false} AppendNil<T>(xs: List<T>)
lemma {:induction false} AppendNil<T>(xs: List<T>)
  ensures Append(xs, Nil) == xs
{
    match xs
    case Nil => {}
    case Cons(hd, tl) => { AppendNil(tl); }
}

// Ex 6.5
lemma {:induction false} AppendDecomposition<T>(a: List<T>, b: List<T>, c: List<T>, d: List<T>)
lemma {:induction false} AppendDecomposition<T>(a: List<T>, b: List<T>, c: List<T>, d: List<T>)
  decreases a, c, b, d
  requires Length(a) == Length(c)
  requires Append(a, b) == Append(c, d)
  ensures a == c && b == d
{
    match a
    case Nil => {}
    case Cons(ahd, atl) => { AppendDecomposition(a.tail, b, c.tail, d); }
}

lemma LengthNil<T>(xs: List<T>)
{ }

// Ex 6.6
function F(x: int, y: int): int
lemma LeftUnit(x: int)
lemma RightUnit(x: int)
lemma LEqualsR()
{
  calc {
    L;
  == { RightUnit(L); }
    F(L, R);
  == { LeftUnit(R); }
    R;
  }
}
