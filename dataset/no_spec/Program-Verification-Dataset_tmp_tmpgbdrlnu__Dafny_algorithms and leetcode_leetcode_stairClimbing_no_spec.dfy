/*
You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
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
}
lemma stepBaseOne() 
{
}

lemma stepBaseTwo() 
{
}

ghost function plusOne(x: seq<Steps>): seq<Steps> {
    [One]+x
}

ghost function addOne(ss: set<seq<Steps>>): set<seq<Steps>> 
{
    set x | x in ss :: plusOne(x)
}

lemma SeqsNotEqualImplication<T>(xs: seq<T>, ys: seq<T>, someT: T)
{}

lemma UnequalSeqs<T>(xs: seq<T>, ys: seq<T>, someT: T)
{
    if |xs| < |ys| {} else if |ys| > |xs| {}
    else if i: nat :| i < |xs| && i <|ys| && xs[i] != ys[i] {
    }
}

lemma plusOneNotIn(ss: set<seq<Steps>>, x: seq<Steps>)
{
    if x == [] {
    }
    if plusOne(x) in addOne(ss) {
        forall y | y in ss 
        {
            UnequalSeqs(x, y, One);
        }
    }
}

lemma addOneSize(ss: set<seq<Steps>>)
{
    var size := |ss|;
    if x :| x in ss {
        addOneSize(ss - {x});
        plusOneNotIn(ss-{x}, x);
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
{
    set x | x in ss :: plusTwo(x)
}

lemma plusTwoNotIn(ss: set<seq<Steps>>, x: seq<Steps>)
{
    if x == [] {
    }
    if plusTwo(x) in addTwo(ss) {
        forall y | y in ss 
        {
            UnequalSeqs(x, y, Two);
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
        // assert x !in ss-{x};
        plusTwoNotIn(ss-{x}, x);
        // assert plusTwo(x) !in addTwo(ss-{x});
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
    var i := 3;
    while i <= n 
    {   
        steps[i] := steps[i-1] + steps[i-2];
        stepSetsAdd(i, steps);
        i := i + 1;
    }
    return steps[n];
}


method Test() {
    var foo := [One, One, Two];
}
