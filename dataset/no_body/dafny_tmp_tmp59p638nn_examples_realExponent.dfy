
ghost function power(n: real, alpha: real): real
    requires n > 0.0 && alpha > 0.0
    ensures power(n, alpha) > 0.0

ghost function log(n: real, alpha: real): real
    requires n > 0.0 && alpha > 0.0
    ensures log(n, alpha) > 0.0

lemma consistency(n: real, alpha: real)
    requires n > 0.0 && alpha > 0.0
    ensures log(power(n,alpha), alpha) == n
    ensures power(log(n, alpha), alpha) == n

lemma logarithmSum(n: real, alpha: real, x: real, y: real)
    requires n > 0.0 && alpha > 0.0
    requires x > 0.0
    requires n == x * y
    ensures log(n,alpha) == log(x, alpha) +  log(y, alpha)

lemma powerLemma(n: real, alpha: real)
    requires n > 0.0 && alpha > 0.0
    ensures power(n, alpha) * alpha == power(n+1.0, alpha)

lemma power1(alpha: real)
    requires alpha > 0.0
    ensures power(1.0, alpha) == alpha

lemma test() {/* TODO */ }

lemma test2() {/* TODO */ }

method pow(n: nat, alpha: real) returns (product: real)
    requires n > 0
    requires alpha > 0.0
    ensures product == power(n as real, alpha)
{/* TODO */ }
