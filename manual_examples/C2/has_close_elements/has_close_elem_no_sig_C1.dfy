function foo(x: real): real
{
  if x < 0.0 then -x else x
}

method bar(numbers: seq<real>, threshold: real) returns (result: bool)
    ensures result <==> exists i, j ::
      0 <= i < |numbers| &&
      0 <= j < |numbers| &&
      i != j &&
      foo(numbers[i] - numbers[j]) < threshold
    ensures result ==> |numbers| > 1
{
    result := false;

    assert (forall i0 :: (0 <= i0 < 0 ==>
                   forall j0 :: (0 <= j0 < |numbers| ==>
                   foo(numbers[i0] - numbers[j0]) >= threshold)));

    for i := 0 to |numbers|
        invariant (forall i0 :: (0 <= i0 < i ==>
                   forall j0 :: (0 <= j0 < |numbers| ==>
                   (i0 != j0 ==>
                   foo(numbers[i0] - numbers[j0]) >= threshold))))
    {
        for j := 0 to |numbers|
             invariant (forall i0 :: (0 <= i0 <= i ==>
                        forall j0 :: (0 <= j0 < j ==>
                        (i0 != j0 ==>
                        foo(numbers[i0] - numbers[j0]) >= threshold))))
        {
            if i != j && foo(numbers[i] - numbers[j]) < threshold {
                assert foo(numbers[i] - numbers[j]) < threshold;
                result := true;
                return;
            }

        }
    }
}
