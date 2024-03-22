//PRE-CONDITIONS -> REQUIRES
//POST-CONDITIONS -> ENSURES

method max(a: int, b: int) returns (z: int)
  requires true
  ensures z >= a || z >= b
{/* TODO */ }

method Main() {/* TODO */ }

// 3
method mystery1(n: nat,m: nat) returns (res: nat)
  ensures n+m == res
{/* TODO */ }

method mystery2(n: nat,m: nat) returns (res: nat)
  ensures n*m == res
{/* TODO */ }

// 5a
method m1(x: int,y: int) returns (z: int)
  requires 0 < x < y
  ensures z >= 0 && z < y && z != x
{/* TODO */ }

// 5b
method m2(x: nat) returns (y: int)
  requires x <= -1
  ensures y > x && y < x
{/* TODO */ }

// 5c
// pode dar false e eles nao serem iguais
// 
method m3(x: int,y: int) returns (z: bool)
  ensures z ==> x==y
{/* TODO */ }

// 5d
method m4(x: int,y: int) returns (z: bool)
  ensures z ==> x==y && x==y ==> z
{/* TODO */ }
