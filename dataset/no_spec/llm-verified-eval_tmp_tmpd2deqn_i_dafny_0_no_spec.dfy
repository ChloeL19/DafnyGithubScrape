function abs(x: real): real
{
  if x < 0.0 then -x else x
}

method has_close_elements(numbers: seq<real>, threshold: real) returns (result: bool)
{
    result := false;

                   abs(numbers[i0] - numbers[j0]) >= threshold)));

    for i := 0 to |numbers|
    {
        for j := 0 to |numbers|
        {
            if i != j && abs(numbers[i] - numbers[j]) < threshold {
                result := true;
                return;
            }

        }
    }
}

