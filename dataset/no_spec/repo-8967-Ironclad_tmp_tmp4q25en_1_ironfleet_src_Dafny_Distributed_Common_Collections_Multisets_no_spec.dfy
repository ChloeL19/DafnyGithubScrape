
module Collections__Multisets_s {
function RestrictMultiset<S(!new)>(m:multiset<S>, f:S->bool):multiset<S>
{
  if |m| == 0 then
    multiset{}
  else
    var x :| x in m;
    var m_without_x := m[x := 0];
    if f(x) then
      RestrictMultiset(m_without_x, f)[x := m[x]]
    else
      RestrictMultiset(m_without_x, f)
}

} 

