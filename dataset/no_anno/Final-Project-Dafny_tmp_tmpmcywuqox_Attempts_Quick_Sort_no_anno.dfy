predicate quickSorted(Seq: seq<int>)
{
  forall idx_1, idx_2 :: 0 <= idx_1 < idx_2 < |Seq| ==> Seq[idx_1] <= Seq[idx_2]
}

method threshold(thres:int,Seq:seq<int>) returns (Seq_1:seq<int>,Seq_2:seq<int>)
{
  Seq_1 := [];
  Seq_2 := [];
  var i := 0;
  while (i < |Seq|)
  {
    if (Seq[i] <= thres) {
      Seq_1 := Seq_1 + [Seq[i]];
    } else {
      Seq_2 := Seq_2 + [Seq[i]];
    }
    i := i + 1;
  }
}


lemma Lemma_1(Seq_1:seq,Seq_2:seq)  // The proof of the lemma is not necessary
{
  forall x | x in Seq_1
  {
    var i := 0;
    while (i < |Seq_1|)
    {
      i := i + 1;
    }
  }

}



method quickSort(Seq: seq<int>) returns (Seq': seq<int>)
{
  if |Seq| == 0 {
    return [];
  } else if |Seq| == 1 {
    return Seq;
  } else {  
    var Seq_1,Seq_2 := threshold(Seq[0],Seq[1..]);
    var Seq_1' := quickSort(Seq_1);
    Lemma_1(Seq_1',Seq_1);
    var Seq_2' := quickSort(Seq_2);
    Lemma_1(Seq_2',Seq_2);
    return Seq_1' + [Seq[0]] + Seq_2';
  }
}






