method factImp(n: int) returns (r: int)
{
  r := 1;
  var m := n;
  while (m > 0) {
    r := r*m;
    m := m-1;
  }
}

function power(n: int, m: nat) : int {
  if m==0 then 1 else n*power(n,m-1)
}

function pow(n: int, m: nat,r: int) : int {
  if m==0 then r else pow(n,m-1,r*n)
}

function powerAlt(n: int,m: nat) : int {
  pow(n,m,1)
}

// 3

function equivalentes(n: int,m: nat,r: int) : int
{
  if n==0 then 1 else n*fact(n-1)
}

function factAcc(n: nat,a: int) : int
{
  if (n == 0) then a else factAcc(n-1,n*a)
}

function factAlt(n: nat) : int { factAcc(n,1) }

lemma factAcc_correct(n: nat,a: int)
  factAcc_correct(n, 1);
}

// 5. a)
function mystery1(n: nat,m: nat) : nat
{ if n==0 then m else mystery1(n-1,m+1) }


// 5. b)
function mystery2(n: nat,m: nat) : nat
{ if m==0 then n else mystery2(n+1,m-1) }

// 5. c)
function mystery3(n: nat,m: nat) : nat
{ if n==0 then 0 else mystery1(m,mystery3(n-1,m)) }

// 5. d)
function mystery4(n: nat,m: nat) : nat
{ if m==0 then 1 else mystery3(n,mystery4(n,m-1)) }

// 6

// 8

// 9

// 10

// 11
