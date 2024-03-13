
ghost function power(n: real, alpha: real): real
    requires n > 0.0 && alpha > 0.0
    ensures power(n, alpha) > 0.0

ghost function log(n: real, alpha: real): real
    requires n > 0.0 && alpha > 0.0
    ensures log(n, alpha) > 0.0

lemma consistency(n: real, alpha: real)
lemma logarithmSum(n: real, alpha: real, x: real, y: real)
lemma powerLemma(n: real, alpha: real)
lemma power1(alpha: real)
lemma test() {
lemma test() {
    var pow3 := power(3.0,4.0);
    consistency(3.0,4.0);
    assert log(pow3, 4.0) == 3.0;
    var log6 := log(6.0,8.0);
    logarithmSum(6.0, 8.0, 2.0, 3.0);
    assert log6 == log(2.0,8.0)+log(3.0,8.0);
}

lemma test2() {
lemma test2() {
    var pow3 := power(3.0, 4.0);
    var power4 := power(4.0, 4.0);
    powerLemma(3.0, 4.0);
    assert pow3 * 4.0 == power4;
}

method pow(n: nat, alpha: real) returns (product: real)
{
    product := alpha;
    var i: nat := 1;
    power1(alpha);
    assert product == power(1.0, alpha);
    while i < n
        invariant i <= n
        invariant product == power(i as real, alpha)
    {
        powerLemma(i as real, alpha);
        product := product * alpha;
        i := i + 1;
    }
    assert i == n;
    assert product == power(n as real, alpha);
}
