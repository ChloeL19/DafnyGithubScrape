/*
You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
function climbStairs(n: number): number {
function climbStairs(n: number): number {
    let steps = new Array(n+1);
    steps[0] = 0;
    steps[1] = 1;
    steps[2] = 2;
    for(let i = 3; i <= n; i++) {
        steps[i] = steps[i-1] + steps[i-2];
    }
    return steps[n];
};
*/

datatype Steps = One | Two

function stepSum(xs: seq<Steps>): nat {
function stepSum(xs: seq<Steps>): nat {
    if xs == [] then 0 else (match xs[0] {
        case One => 1
        case Two => 2
    } + stepSum(xs[1..]))
}

ghost predicate stepEndsAt(xs: seq<Steps>, n: nat) {
    stepSum(xs) == n
}
ghost predicate allEndAtN(ss: set<seq<Steps> >, n: nat) {
    forall xs ::  xs in ss ==> stepEndsAt(xs, n)
}

lemma stepBaseZero() 
{
    assert allEndAtN({[]}, 0);
}
lemma stepBaseOne() 
{
    assert allEndAtN({[One]}, 1);
}

lemma stepBaseTwo() 
{
    assert allEndAtN({[One,One], [Two]}, 2);
}

ghost function plusOne(x: seq<Steps>): seq<Steps> {
    [One]+x
}

ghost function addOne(ss: set<seq<Steps>>): set<seq<Steps>> 
    ensures forall x :: x in ss ==> plusOne(x) in addOne(ss)
    ensures addOne(ss) == set x | x in ss :: plusOne(x)
{
    set x | x in ss :: plusOne(x)
}

lemma SeqsNotEqualImplication<T>(xs: seq<T>, ys: seq<T>, someT: T)
{}

lemma UnequalSeqs<T>(xs: seq<T>, ys: seq<T>, someT: T)
{
    if |xs| < |ys| {} else if |ys| > |xs| {}
    else if i: nat :| i < |xs| && i <|ys| && xs[i] != ys[i] {
        assert ([someT]+xs)[i+1] != ([someT]+ys)[i+1];
    }
}

lemma plusOneNotIn(ss: set<seq<Steps>>, x: seq<Steps>)
{
    if x == [] {
        assert [] !in ss;
        assert [One]+[] !in addOne(ss);
    }
    if plusOne(x) in addOne(ss) {
        forall y | y in ss 
            ensures y != x
            ensures plusOne(y) in addOne(ss)
            ensures plusOne(y) != plusOne(x)
        {
            UnequalSeqs(x, y, One);
            assert plusOne(y) != [One]+x;
        }
        assert false;
    }
}

lemma addOneSize(ss: set<seq<Steps>>)
{
    var size := |ss|;
    if x :| x in ss {
        assert |ss - {x}| == size - 1;
        addOneSize(ss - {x});
        assert |addOne(ss-{x})| == size - 1;
        assert addOne(ss) == addOne(ss-{x}) + {[One]+x};
        assert x !in ss-{x};
        plusOneNotIn(ss-{x}, x);
        assert plusOne(x) !in addOne(ss-{x});
        assert |addOne(ss)| == |addOne(ss-{x})| + |{[One]+x}|;
    }else{

    }
}

lemma addOneSum(ss: set<seq<Steps>>, sum: nat) 
{

}

lemma endAtNPlus(ss: set<seq<Steps>>, sz: set<seq<Steps>>, sum: nat)
{

}

ghost function plusTwo(x: seq<Steps>): seq<Steps> {
    [Two]+x
}

ghost function addTwo(ss: set<seq<Steps>>): set<seq<Steps>> 
    ensures forall x :: x in ss ==> plusTwo(x) in addTwo(ss)
    ensures addTwo(ss) == set x | x in ss :: plusTwo(x)
{
    set x | x in ss :: plusTwo(x)
}

lemma plusTwoNotIn(ss: set<seq<Steps>>, x: seq<Steps>)
{
    if x == [] {
        assert [] !in ss;
        assert [Two]+[] !in addTwo(ss);
    }
    if plusTwo(x) in addTwo(ss) {
        forall y | y in ss 
            ensures y != x
            ensures plusTwo(y) in addTwo(ss)
            ensures plusTwo(y) != plusTwo(x)
        {
            UnequalSeqs(x, y, Two);
            assert plusTwo(y) != [Two]+x;
        }
    }
}

lemma addTwoSize(ss: set<seq<Steps>>)
{
    var size := |ss|;
    if x :| x in ss {
        // assert |ss - {x}| == size - 1;
        addTwoSize(ss - {x});
        // assert |addTwo(ss-{x})| == size - 1;
        assert addTwo(ss) == addTwo(ss-{x}) + {[Two]+x};
        // assert x !in ss-{x};
        plusTwoNotIn(ss-{x}, x);
        // assert plusTwo(x) !in addTwo(ss-{x});
        assert |addTwo(ss)| == |addTwo(ss-{x})| + |{[Two]+x}|;
    }
}

lemma addTwoSum(ss: set<seq<Steps>>, sum: nat) 
{

}

lemma setSizeAddition<T>(sx: set<T>, sy: set<T>, sz: set<T>) 
{

}

lemma stepSetsAdd(i: nat, steps: array<nat>) 
{
    var oneStepBack :| steps[i-1] == |oneStepBack| && allEndAtN(oneStepBack, i-1);
    var twoStepBack :| steps[i-2] == |twoStepBack| && allEndAtN(twoStepBack, i-2);
    var stepForward := addOne(oneStepBack);
    var stepTwoForward := addTwo(twoStepBack);
    assert forall x :: x in stepForward ==> x[0] == One;
    // assert stepForward !! stepTwoForward;
    addOneSize(oneStepBack);
    addTwoSize(twoStepBack);
    var sumSet := stepForward + stepTwoForward;
    // assert |sumSet| == steps[i-1]+steps[i-2];
}

method climbStairs(n: nat) returns (count: nat) 
{
    var steps := new nat[n+1];
    steps[0] := 0;
    if n > 0 {
        steps[1] := 1;
    }
    if n > 1 {
        steps[2] := 2;
    }
    stepBaseZero();
    stepBaseOne();
    stepBaseTwo();
    if n < 3 {
        return steps[n];
    }
    assert steps[0] == 0;
    assert steps[1] == 1;
    assert steps[2] == 2;
    assert forall k: nat :: k < 3 ==> exists ss: set< seq<Steps> > :: steps[k] == |ss| && allEndAtN(ss, k);
    var i := 3;
    while i <= n 
        invariant 3 <= i <= n+1
        invariant forall k: nat :: k < i ==> exists ss: set< seq<Steps> > :: steps[k] == |ss| && allEndAtN(ss, k)
    {   
        steps[i] := steps[i-1] + steps[i-2];
        stepSetsAdd(i, steps);
        i := i + 1;
    }
    return steps[n];
}


method Test() {
method Test() {
    var foo := [One, One, Two];
    assert stepSum(foo) == 4;
}
