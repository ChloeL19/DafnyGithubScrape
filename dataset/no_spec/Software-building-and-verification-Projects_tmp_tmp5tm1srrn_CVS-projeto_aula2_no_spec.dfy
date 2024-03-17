//PRE-CONDITIONS -> REQUIRES
//POST-CONDITIONS -> ENSURES

method max(a: int, b: int) returns (z: int)
{
  if a > b {
    z :=a;
  }
  else {
    z := b;
  }
}

method Main() {
  var x;
  x:=max(23,50);

}

// 3
method mystery1(n: nat,m: nat) returns (res: nat)
{
  if (n==0) {
    return m;
  }
  else {
    var aux := mystery1 (n-1,m);
    return 1+aux;
  }
}

method mystery2(n: nat,m: nat) returns (res: nat)
{
  if (n==0) {
    return 0;
  }
  else {
    var aux := mystery2(n-1,m);
    var aux2 := mystery1(m,aux);
    return aux2;
  }
}

// 5a
method m1(x: int,y: int) returns (z: int)
{
  if (x > 0 && y > 0 && y > x) {
    z := x-1;
  }
}

// 5b
method m2(x: nat) returns (y: int)
{
  if (x <= -1) {
    y := x+1;
  }
}

// 5c
// pode dar false e eles nao serem iguais
// 
method m3(x: int,y: int) returns (z: bool)
{
  if (x == y) {
    z := true;
  }
  else {
    z := false;
  }
}

// 5d
method m4(x: int,y: int) returns (z: bool)
{
  if (x == y) {
    z := true;
  }
  else {
    z := false;
  }
}
