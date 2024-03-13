function sum(X_val : array<int>, X_crd : array<nat>,
  {
    if pV_end <= kV || pX_end <= kX then 
      0
    else if X_crd[kX] == v_crd[kV] then 
      sum(X_val, X_crd, v_val, v_crd, kX + 1, kV + 1, pX_end, pV_end) + v_val[kV] * X_val[kX]
    else if X_crd[kX] < v_crd[kV] then 
      sum(X_val, X_crd, v_val, v_crd, kX + 1, kV, pX_end, pV_end)
    else sum(X_val, X_crd, v_val, v_crd, kX, kV + 1, pX_end, pV_end)
  }

function min(x : nat, y : nat) : nat {
function min(x : nat, y : nat) : nat {
  if x <= y then x else y
}

predicate notin(y: nat, x : array<nat>) 
{
  forall i :: 0 <= i < x.Length ==> y != x[i]
}

predicate notin_seq(y: nat, x : seq<nat>) 
{
  forall i :: 0 <= i < |x| ==> y != x[i]
}

function index_seq(x : nat, y: seq<nat>) : (i : nat)
{
  if |y| == 0 then 0 
  else 
    if y[0] == x then 0 
    else 1 + index_seq(x, y[1..])
}

function index(x : nat, y: array<nat>) : (i : nat)
{
  index_seq(x, y[.. ])
}

method DSpMSpV(X_val : array<int>, X_crd : array<nat>, X_pos : array<nat>,
  {
    var N : nat := X_len;
    y := new int[N](i => 0);

    var n : nat := 0;
    var kX , pX_end : nat;
    var kV : nat;
    var pV_end : nat := v_val.Length;
    var kX0, kV0    : nat;
    var k : nat;
    var pX_end1 := X_crd1.Length;
    

    while n < pX_end1
      invariant n <= X_crd1.Length
      invariant forall i :: 0 <= i < n ==> y[X_crd1[i]] == sum(X_val, X_crd, v_val, v_crd, X_pos[i], 0, X_pos[i+1], pV_end)
      invariant forall i :: n <= i < X_crd1.Length ==> y[X_crd1[i]] == 0
      invariant forall i :: 0 <= i < y.Length ==> notin(i, X_crd1) ==> y[i] == 0
      {
        kX     := X_pos[n];
        pX_end := X_pos[n + 1];
        kV     := 0;

        while (kX < pX_end && kV < pV_end) 
          invariant X_pos[n] <= kX <= pX_end
          invariant 0 <= kV <= pV_end
          invariant forall i :: n < i < X_crd1.Length ==> y[X_crd1[i]] == 0
          invariant forall i :: 0 <= i < y.Length ==> notin(i, X_crd1) ==> y[i] == 0
          invariant forall i :: 0 <= i < n ==> y[X_crd1[i]] ==  sum(X_val, X_crd, v_val, v_crd, X_pos[i], 0, X_pos[i+1], pV_end)
          invariant y[X_crd1[n]] + sum(X_val, X_crd, v_val, v_crd, kX, kV, pX_end, pV_end) ==  sum(X_val, X_crd, v_val, v_crd, X_pos[n], 0, X_pos[n+1], pV_end)
          decreases pX_end + pV_end - (kX + kV)
          {
            kX0 := X_crd[kX];
            kV0 := v_crd[kV];
            k := min(kV0, kX0);
            if (kX0 == k && kV0 == k) {
              y[X_crd1[n]] := y[X_crd1[n]] + X_val[kX] * v_val[kV];
              kX := kX + 1;
              kV := kV + 1;
            } else if (kX0 == k) {
              kX := kX + 1;
            } else if (kV0 == k) {
              kV := kV + 1;
            }
          }
        n := n + 1;
      }
  }

method Main() {
method Main() {
  var X_val := new int[4](i => 1);
  var X_crd := new nat[4](i => if i <= 3 then (3 - i) * 2 else 0);
  var X_pos := new nat[5](i => i);
  var X_crd1 := new nat[4](i => i * 2);
  var X_pos1 := new nat[2](i => i * 8);
  var X_len := 8;

  var v_val := new int[4](i => 30 + i);
  var v_crd := new nat[4](i => i * 2);
  var v_pos := new nat[2](i => if i == 0 then 0 else 4);

  var y := DSpMSpV(
    X_val,
    X_crd,
    X_pos,
    X_crd1,
    X_len,
    v_val,
    v_crd
  );

  var i := 0;
  while i < 8 { print y[i]; print "; "; i := i + 1; }
}

