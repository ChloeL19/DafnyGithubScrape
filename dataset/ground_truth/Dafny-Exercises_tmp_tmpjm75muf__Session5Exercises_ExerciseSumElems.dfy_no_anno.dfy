function SumR(s:seq<int>):int
decreases s
{
    if (s==[]) then 0
    else SumR(s[..|s|-1])+s[|s|-1]
}

function SumL(s:seq<int>):int
decreases s
{
    if (s==[]) then 0
    else s[0]+SumL(s[1..])
}


lemma concatLast(s:seq<int>,t:seq<int>)
{}
lemma concatFirst(s:seq<int>,t:seq<int>)
{}

lemma {:induction s,t} SumByPartsR(s:seq<int>,t:seq<int>)
decreases s,t
{ if (t==[])
     {assert s+t == s;}
  else if (s==[])
     {assert s+t==t;}   
   else
     { 
       calc =={
        SumR(s+t);
        SumR((s+t)[..|s+t|-1])+(s+t)[|s+t|-1];
        SumR((s+t)[..|s+t|-1])+t[|t|-1];
        {concatLast(s,t);}
        SumR(s+t[..|t|-1])+t[|t|-1];
        {SumByPartsR(s,t[..|t|-1]);}
        SumR(s)+SumR(t[..|t|-1])+t[|t|-1];
        SumR(s)+SumR(t);

       }
     }


}


lemma {:induction s,t} SumByPartsL(s:seq<int>,t:seq<int>)
decreases s,t
{
  if(t==[]){
  }
  else if(s==[]){
  }
  else{
      calc == {
        SumL(s+t);
        (s+t)[0] + SumL((s+t)[1..]);
        s[0] + SumL((s+t)[1..]);
        {concatFirst(s,t);}
        s[0] + SumL(s[1..] + t);
        {SumByPartsL(s[1..], t);}
        s[0] + SumL(s[1..]) + SumL(t);
      }
  }
}




lemma  {:induction s,i,j} equalSumR(s:seq<int>,i:int,j:int)
decreases j-i
{
  if(s==[]){
  }else{
    if(i==j){
    }
    else{
      calc == {
        SumR(s[i..j]);
        {
        }
        SumR(s[i..j-1]) + s[j-1];
        {equalSumR(s, i, j-1);}
        SumL(s[i..j-1]) + s[j-1];
        {assert s[j-1] == SumL([s[j-1]]);}
        SumL(s[i..j-1]) + SumL([s[j-1]]);
        {SumByPartsL(s[i..j-1], [s[j-1]]);}
        SumL(s[i..j-1] + [s[j-1]]);
        {
        }
        SumL(s[i..j]);
        /*SumR(s[i..j-1])+SumR(s[j..j]);
        SumR(s[i..j-1]) + s[j..j];
        SumL(s);*/
      }
    }
  }
}


lemma equalSumsV() 
  { forall v:array<int>,i,j | 0<=i<=j<=v.Length
    {equalSumR(v[..],i,j);}
  }


function SumV(v:array<int>,c:int,f:int):int
  {SumR(v[c..f])}


lemma ArrayFacts<T>()
 {equalSumsV();}
  

method sumElems(v:array<int>) returns (sum:int)
//ensures sum==SumL(v[0..v.Length])
{ArrayFacts<int>();
 sum:=0;
 var i:int;
 i:=0;
 while (i<v.Length)
   decreases v.Length - i//write
 {
   
  sum:=sum+v[i];
  i:=i+1;
  }
}

method sumElemsB(v:array<int>) returns (sum:int)
//ensures sum==SumL(v[0..v.Length])
{
 ArrayFacts<int>();
 sum:=0;
 var i:int;
 i:=v.Length;
 equalSumsV();
 while(i>0)
   decreases i//write
 {
  sum:=sum+v[i-1];
  i:=i-1;
  }


}







