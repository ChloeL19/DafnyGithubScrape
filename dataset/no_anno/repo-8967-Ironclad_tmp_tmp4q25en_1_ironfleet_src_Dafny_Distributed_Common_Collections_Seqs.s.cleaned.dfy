
module Collections__Seqs_s {

function last<T>(s:seq<T>):T
{
  s[|s|-1]
}

function all_but_last<T>(s:seq<T>):seq<T>
{
  s[..|s|-1]
}
    
}

