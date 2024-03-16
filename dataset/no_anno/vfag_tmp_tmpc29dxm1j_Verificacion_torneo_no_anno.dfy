method torneo(Valores : array?<real>, i : int, j : int, k : int) returns (pos_padre : int, pos_madre : int)
{
    
        if Valores[i] < Valores[j] {

                if Valores[j] < Valores[k] {

                        pos_padre := k ;
            
                        pos_madre := j ;

                } else {

                        if Valores[i] < Valores[k] {

                                pos_padre := j ;

                                pos_madre := k ;

                        } else {

                                pos_padre := j ;

                                pos_madre := i ;

                        }

                }

        } else {

                if Valores[j] >= Valores[k] {
            
                        pos_padre := i ;

                        pos_madre := j ;

                } else {

                        if Valores[i] < Valores[k] {

                                pos_padre := k ;

                                pos_madre := i ;

                        } else {

                                pos_padre := i ;

                                pos_madre := k ;

                        }

                }

        }

}
