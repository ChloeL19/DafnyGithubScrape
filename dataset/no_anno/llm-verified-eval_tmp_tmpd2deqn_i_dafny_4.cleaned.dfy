function abs(x: real): real
{
  if x < 0.0 then -x else x
}

function sum(numbers: seq<real>): real
{
    if |numbers| == 0 then
        0.0
    else
        numbers[0] + sum(numbers[1..])
}

function mean(numbers: seq<real>): real
{
    sum(numbers) / (|numbers| as real)
}

function mapf<A,B>(f: A -> B, xs: seq<A>): seq<B>
{
    if |xs| == 0 then
        []
    else
        [f(xs[0])] + mapf(f, xs[1..])
}


function mean_absolute_deviation(numbers: seq<real>):real
{
    if |numbers| > 1 then
        mean(mapf<real,real>(x => abs(x - mean(numbers)), numbers))
    else
        0.0
}

lemma sum_nonnegative(numbers: seq<real>)
{
}

lemma mean_nonnegative(numbers: seq<real>)
{
    sum_nonnegative(numbers);
}

lemma mean_absolute_deviation_nonnegative(numbers: seq<real>)
{
   mean_nonnegative(mapf<real,real>(x => abs(x - mean(numbers)), numbers));
}
