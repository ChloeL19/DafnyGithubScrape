// VERIFY USING DAFNY:
// /Applications/dafny/dafny /Users/apple/GaussianDP/Dafny/gaussian.dfy
method gaussian (size:int, q: array<real>, q_hat: array<real>) returns (out: array<real>)
{
 var i : int := 0;
  var alpha : real := arraySquaredSum(q_hat[..1]);
 var eta: real := 0.0;
 var eta_hat: real := 0.0;
 out := new real[size];
 while (i <size)
 {
  eta := *;
  eta_hat := - q_hat[i];
  alpha := arraySquaredSum(q_hat[..i+1]);
  out[i] := q[i] + eta;
  i := i+1;
 }
}


function arraySquaredSum(a: seq<real>): real
{
  if |a| == 1 then 
    a[0]*a[0]
  else 
    (a[0]*a[0]) + arraySquaredSum(a[1..])
}

