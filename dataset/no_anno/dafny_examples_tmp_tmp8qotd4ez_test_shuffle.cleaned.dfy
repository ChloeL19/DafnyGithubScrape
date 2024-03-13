
method random(a: int, b: int) returns (r: int)
lemma eqMultiset_t<T>(t: T, s1: seq<T>, s2: seq<T>)
{
  calc <==> {
    t in s1;
    t in multiset(s1);
    // Not necessary:
//    t in multiset(s2);
//    t in s2;
  }
/*  
  if (t in s1) {
    assert t in multiset(s1);
  }
  else {
    assert t !in multiset(s1);
  }
*/
}

lemma eqMultiset<T>(s1: seq<T>, s2: seq<T>)
{
  forall t {
    eqMultiset_t(t, s1, s2);
  }
}

method swap<T>(a: array<T>, i: int, j: int)
{
  var t := a[i];
  a[i] := a[j];
  a[j] := t;
}
  
method getAllShuffledDataEntries<T(0)>(m_dataEntries: array<T>) returns (result: array<T>)
{
  result := new T[m_dataEntries.Length];
  forall i | 0 <= i < m_dataEntries.Length {
    result[i] := m_dataEntries[i];
  }

  assert result[..] == m_dataEntries[..];
  
  var k := result.Length - 1;
  while (k >= 0)
    invariant multiset(result[..]) == multiset(m_dataEntries[..])
  {
    var i := random(0, k);
    assert i >= 0 && i <= k;

    if (i != k) {
      swap(result, i, k);
    }
    
    k := k - 1;
  }
}

function set_of_seq<T>(s: seq<T>): set<T>
{
  set x: T | x in s :: x
}

lemma in_set_of_seq<T>(x: T, s: seq<T>)
lemma subset_set_of_seq<T>(s1: seq<T>, s2: seq<T>)
method getRandomDataEntry<T(==)>(m_workList: array<T>, avoidSet: seq<T>) returns (e: T)
{
  var k := m_workList.Length - 1;

  while (k >= 0)
  {
    var i := random(0, k);
    assert i >= 0 && i <= k;

    e := m_workList[i];
    if (e !in avoidSet) {
      return e;
    }
    
    k := k - 1;
  }
  
  return m_workList[0];
}

