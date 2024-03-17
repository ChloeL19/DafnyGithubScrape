/**
CVS 2021-22 Handout 1
Authors
Gonçalo Martins Lourenço nº55780
Joana Soares Faria  nº55754
 */

// First Exercise
lemma peasantMultLemma(a:int, b:int)
    {
        if (b % 2 == 0 && b > 0) { 
            peasantMultLemma(a, b - 2);
        }

        if (b % 2 == 1 && b > 1) {
            peasantMultLemma(a, b - 2);
        }

    }

method peasantMult(a: int, b: int) returns (r: int)
    {
        r := 0;
        var aa := a;
        var bb := b;
    
        while(bb > 0)
        { 
            // Use of lemma was not necessary for a successful verification
            // peasantMultLemma(aa, bb);
            if (bb % 2 == 0)
            {
                aa := 2 * aa;
                bb := bb / 2;

            } else if (bb % 2 == 1)
            {
                r := r + aa;
                aa := 2 * aa;
                bb := (bb-1) / 2;
            }
        } 
    }


//Second Exercise
method euclidianDiv(a: int,b : int) returns (q: int,r: int)
    {
        r := a;
        q := 0;
        while(r - b >= 0)
        {
            r := r - b;
            q := q + 1;
        }

    }

