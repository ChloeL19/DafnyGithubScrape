module Exponential {
  ghost function {:axiom} Exp(x: real): real

  lemma {:axiom} FunctionalEquation(x: real, y: real)
  lemma {:axiom} Increasing(x: real, y: real)
  lemma {:axiom} EvalOne()
  {
      var sqrt := Exp(x / 2.0);
      calc {
        Exp(x);
        { FunctionalEquation(x / 2.0, x / 2.0); }
        sqrt * sqrt;
      >=
        0.0;
      }
    }
    if Exp(x) == 0.0 {
      calc {
        0.0;
        Exp(x);
      < { Increasing(x, x + 1.0); }
        Exp(x + 1.0);
        { FunctionalEquation(x, 1.0); }
        Exp(x) * Exp(1.0);
      ==
        0.0;
      }
    }
  }

  lemma EvalZero()
  {
    var one := Exp(0.0);
      Positive(0.0);
    }
      FunctionalEquation(0.0, 0.0);
    }
  }
}

