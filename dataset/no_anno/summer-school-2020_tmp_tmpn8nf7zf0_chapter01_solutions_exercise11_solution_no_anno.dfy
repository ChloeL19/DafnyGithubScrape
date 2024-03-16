// Algebraic datatypes in their full glory. The include statement.

// A struct is a product:
// There are 3 HAlign instances, and 3 VAlign instances;
// so there are 9 TextAlign instances (all combinations).
// Note that it's okay to omit the parens for zero-element constructors.
datatype HAlign = Left | Center | Right
datatype VAlign = Top | Middle | Bottom
datatype TextAlign = TextAlign(hAlign:HAlign, vAlign:VAlign)

// If you squint, you'll believe that unions are like
// sums. There's one "Top", one "Middle", and one "Bottom"
// element, so there are three things that are of type VAlign.

// There are two instances of GraphicsAlign
datatype GraphicsAlign = Square | Round

// So if we make another tagged-union (sum) of TextAlign or GraphicsAlign,
// it has how many instances?
// (That's the exercise, to answer that question. No Dafny required.)
datatype PageElement = Text(t:TextAlign) | Graphics(g:GraphicsAlign)

// The answer is 11:
// There are 9 TextAligns.
// There are 2 GraphicsAligns.
// So there are 11 PageElements.

// Here's a *proof* for the HAlign type (to keep it simple):
lemma NumPageElements()
{
  var maxSet := { Left, Center, Right };

  // Prove the bound is tight.
  {
    // Prove eltSet <= maxSet
    forall elt | elt in eltSet ensures elt in maxSet {
      if elt.Left? { }  // hint at a case analysis
    }

    // Cardinality relation should have been obvious to Dafny;
    // see comment on lemma below.
    subsetCardinality(eltSet, maxSet);
  }
}

// Dafny seems to be missing a heuristic to trigger this cardinality relation!
// So I proved it. This should get fixed in dafny, or at least tucked into a
// library! How embarrassing.
lemma subsetCardinality<T>(a:set<T>, b:set<T>)
{
  if a == {} {
  } else {
    var e :| e in a;
    if e in b {
      subsetCardinality(a - {e}, b - {e});
    } else {
      subsetCardinality(a - {e}, b);
    }
  }
}

