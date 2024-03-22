// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class MyList<T>
{
}

method AAA<U>(aax: MyList?<U>) returns (aay: MyList?<U>)
  ensures BBB(aax, aay)

predicate BBB<V>(bbx: MyList?<V>, bby: MyList?<V>)
{/* TODO */ }

predicate CCC<W>(ccx: MyList?<W>, ccy: MyList?<W>)

