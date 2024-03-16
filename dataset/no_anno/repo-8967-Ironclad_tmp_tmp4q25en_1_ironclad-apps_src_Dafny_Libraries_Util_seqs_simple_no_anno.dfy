static lemma lemma_vacuous_statement_about_a_sequence(intseq:seq<int>, j:int)
{
}

static lemma lemma_painful_statement_about_a_sequence(intseq:seq<int>)
{
}

static lemma lemma_obvious_statement_about_a_sequence(boolseq:seq<bool>, j:int)
{
}

static lemma lemma_obvious_statement_about_a_sequence_int(intseq:seq<int>, j:int)
{
}

static lemma lemma_straightforward_statement_about_a_sequence(intseq:seq<int>, j:int)
{
}

static lemma lemma_sequence_reduction(s:seq<int>, b:nat)
{
    var t := s[0..b];
    forall (i | 0<=i<b-1)
    {
    }
}

static lemma lemma_seq_concatenation_associative(a:seq<int>, b:seq<int>, c:seq<int>)
{
}


static lemma lemma_subseq_concatenation(s: seq<int>, left: int, middle: int, right: int)
{
}

static lemma lemma_seq_equality(a:seq<int>, b:seq<int>, len:int)
{
}

static lemma lemma_seq_suffix(s: seq<int>, prefix_length: int, index: int)
{
}

