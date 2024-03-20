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

