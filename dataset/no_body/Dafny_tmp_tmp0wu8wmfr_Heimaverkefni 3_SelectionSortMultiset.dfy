// Höfundur spurningar:  Snorri Agnarsson, snorri@hi.is
// Permalink spurningar: https://rise4fun.com/Dafny/dtcnY

// Höfundur lausnar:     Alexander Guðmundsson
// Permalink lausnar:    https://rise4fun.com/Dafny/ybUCz

///////////////////////////////////////////////////////////////
// Hér byrjar óbreytanlegi hluti skrárinnar.
// Fyrir aftan þann hluta er sá hluti sem þið eigið að breyta.
///////////////////////////////////////////////////////////////

// Hjálparfall sem finnur minnsta gildi í poka
method MinOfMultiset( m: multiset<int> ) returns( min: int )
    requires m != multiset{/* TODO */ };
    ensures min in m;
    ensures forall z | z in m :: min <= z;
{
    min :| min in m;
    var done := multiset{min};
    var m' := m-done;
    while m' != multiset{}
        decreases m';
        invariant m == done+m';
        invariant min in done;
        invariant forall z | z in done :: min <= z;
    {
        var z :| z in m';
        done := done+multiset{z};
        m' := m'-multiset{z};
        if z < min { min := z; }
    }
}

// Ekki má breyta þessu falli.
method Test( m: multiset<int> )
{/* TODO */ }

method Main()
{/* TODO */ }

///////////////////////////////////////////////////////////////
// Hér lýkur óbreytanlega hluta skrárinnar.
// Hér fyrir aftan er sá hluti sem þið eigið að breyta til að
// útfæra afbrigði af selection sort.
///////////////////////////////////////////////////////////////

// Selection sort sem raðar poka í runu.
// Klárið að forrita þetta fall.
method Sort( m: multiset<int> ) returns ( s: seq<int> )
    // Setjið viðeigandi ensures klausur hér
    ensures multiset(s) == m;
    ensures forall p,q | 0 <= p < q < |s| :: s[p] <= s[q];
{/* TODO */ }
