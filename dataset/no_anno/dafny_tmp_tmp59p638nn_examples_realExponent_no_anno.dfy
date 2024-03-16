
ghost function power(n: real, alpha: real): real
lemma test() {
    var pow3 := power(3.0,4.0);
    consistency(3.0,4.0);
    var log6 := log(6.0,8.0);
    logarithmSum(6.0, 8.0, 2.0, 3.0);
}

lemma test2() {
    var pow3 := power(3.0, 4.0);
    var power4 := power(4.0, 4.0);
    powerLemma(3.0, 4.0);
}

method pow(n: nat, alpha: real) returns (product: real)
{
    product := alpha;
    var i: nat := 1;
    power1(alpha);
    {
        powerLemma(i as real, alpha);
        product := product * alpha;
        i := i + 1;
    }
}
