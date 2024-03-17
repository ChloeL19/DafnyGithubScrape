module OneSpec {
    datatype Variables = Variables(value: int)

    predicate Init(v: Variables)
    {
        v.value == 0
    }

    predicate IncrementOp(v: Variables, v': Variables)
    {
        && v'.value == v.value + 1
    }

    predicate DecrementOp(v: Variables, v': Variables)
    {
        && v'.value == v.value - 1
    }

    datatype Step = 
        | IncrementStep()
        | DecrementStep()

    predicate NextStep(v: Variables, v': Variables, step: Step)
    {
        match step
            case IncrementStep() => IncrementOp(v, v')
            case DecrementStep() => DecrementOp(v, v')
    }

    predicate Next(v: Variables, v': Variables)
    {
        exists step :: NextStep(v, v', step)
    }
}

module OneProtocol {
    datatype Variables = Variables(value: int)

    predicate Init(v: Variables)
    {
        v.value == 0
    }

    predicate IncrementOp(v: Variables, v': Variables)
    {
        && v'.value == v.value - 1
    }

    predicate DecrementOp(v: Variables, v': Variables)
    {
        && v'.value == v.value + 1
    }

    datatype Step = 
        | IncrementStep()
        | DecrementStep()

    predicate NextStep(v: Variables, v': Variables, step: Step)
    {
        match step 
            case IncrementStep() => IncrementOp(v, v')
            case DecrementStep() => DecrementOp(v, v')
    }

    predicate Next(v: Variables, v': Variables)
    {
        exists step :: NextStep(v, v', step)
    }
}

module RefinementProof {
    import OneSpec
    import opened OneProtocol

    function Abstraction(v: Variables) : OneSpec.Variables {
        OneSpec.Variables(v.value)
    }

    lemma RefinementInit(v: Variables)
    {

    }

    lemma RefinementNext(v: Variables, v': Variables)
    {
        var step :| NextStep(v, v', step);
        match step {
            case IncrementStep() => {
            }
            case DecrementStep() => {
            }
        }
    }
}
