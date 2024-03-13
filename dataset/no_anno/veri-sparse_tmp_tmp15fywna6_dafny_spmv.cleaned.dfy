function sum(X_val: array<int>, X_crd: array<nat>, v : array<int>, b : int, k : int) : (s : int)
  {
    if k <= b then 
      0
    else  sum(X_val, X_crd, v, b + 1, k) + X_val[b] * v[X_crd[b]]
  }


method SpMV(X_val: array<int>, X_crd: array<nat>, X_pos: array<nat>, v : array<int>) returns (y : array<int>)
  {
    var N: nat := X_pos.Length - 1;
    y := new int[N](i => 0);
    var n: nat := 0;
    while n < N
      invariant n <= y.Length
      invariant forall i :: 0 <= i < n ==> y[i] == sum(X_val, X_crd, v, X_pos[i], X_pos[i + 1])
      invariant forall i :: n <= i < y.Length ==> y[i] == 0
      { 
        var k: nat := X_pos[n];
        while k < X_pos[n + 1]
          invariant k <= X_pos[n + 1]
          invariant forall i :: n < i < y.Length ==> y[i] == 0
          invariant forall i :: 0 <= i < n ==> y[i] == sum(X_val, X_crd, v, X_pos[i], X_pos[i + 1])
          invariant y[n] + sum(X_val, X_crd, v, k, X_pos[n+1]) == sum(X_val, X_crd, v, X_pos[n], X_pos[n+1]) 
          {
            y[n] := y[n] + X_val[k] * v[X_crd[k]];
            k := k + 1;
          }
        n := n + 1;
      }
  }


// 0 0 0 0 0 0 1 0
// 0 0 0 0 0 0 0 0
// 0 0 0 0 1 0 0 0
// 0 0 0 0 0 0 0 0
// 0 0 1 0 0 0 0 0
// 0 0 0 0 0 0 0 0
// 1 0 0 0 0 0 0 0
// 0 0 0 0 0 0 0 0

method Main() {
method Main() {
  var X_val := new int[4](i => 1);
  var X_crd := new nat[4](i => if i <= 3 then (3 - i) * 2 else 0);
  var X_pos := new nat[9];
  X_pos[0] := 0;
  X_pos[1] := 1;
  X_pos[2] := 1;
  X_pos[3] := 2;
  X_pos[4] := 2;
  X_pos[5] := 3;
  X_pos[6] := 3;
  X_pos[7] := 4;
  X_pos[8] := 4;

  var v := new int[8];

  v[0] := 30;
  v[1] := 0;
  v[2] := 31;
  v[3] := 0;
  v[4] := 32;
  v[5] := 0;
  v[6] := 33;
  v[7] := 0;

  var y := SpMV(
    X_val,
    X_crd,
    X_pos,
    v
  );

  var i := 0;
  while i < 8 { print y[i]; print "; "; i := i + 1; }
}
