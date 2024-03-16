// Höfundur spurningar:  Snorri Agnarsson, snorri@hi.is
// Permalink spurningar: https://rise4fun.com/Dafny/G4sc3

// Höfundur lausnar:     Alexander Guðmundsson
// Permalink lausnar:    https://rise4fun.com/Dafny/nujsu

// Insertion sort með hjálp helmingunarleitar.

method Search( s: seq<int>, x: int ) returns ( k: int )
    // Ekki má breyta forskilyrðum eða eftirskilyrðum fallsins
{
    // Setjið viðeigandi stofn fallsins hér.
    var p := 0;
    var q := |s|;

    if p == q
    {
        return p;
    }
    while p != q 
    {
        var m := p + (q-p)/2;
        if s[m] == x
        {
            return m;
        }
        if s[m] < x
        {
            p := m+1;
        }
        else
        {
            q := m;
        }
    }

    return p;



}

method Sort( m: multiset<int> ) returns ( r: seq<int> )
{
    // Setjið viðeigandi frumstillingu á r og rest hér.
    // r er skilabreyta en rest er ný breyta sem þið búið til.
    r := [];
    var rest := m;
    while rest != multiset{}
        // Ekki breyta fastayrðingu lykkju
    {
        // Setjið viðeigandi stofn lykkjunnar hér.
        // Fjarlægið eitt gildi úr rest með
        //    var x :| x in rest;
        //    rest := rest-multiset{x};
        // og notið Search til að finna réttan stað
        // í r til að stinga [x] inn í r.
        var x :| x in rest;
        rest := rest - multiset{x};
        var k := Search(r, x);
        r := r[..k] + [x] + r[k..];
    }
    return r;
}
