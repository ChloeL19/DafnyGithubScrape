method main(x :int) returns (j :int, i :int)
{
    i := 0;
    j := 0;

    while i < x
    {
        j := j + 2;
        i := i + 1;
    }
}


// MODULE main
// 	int i;
// 	int j;
// 	int x;

// 	assume(j == 0);
// 	assume(x > 0);
// 	assume(i == 0);

// 	while(i < x){
// 		j = j + 2;
    		
// 		i = i + 1;
// 	}

// 	assert(j == 2*x);	

// END MODULE


// (and (not (<= (+ (* 2 i) (* (- 1) j)) (- 1))) (and (not (<= 1 (+ j (* (- 2) x)))) (not (<= 1 (+ (* 2 i) (* (- 1) j))))))


// (and 
// (not (<= (+ (* 2 i) (* (- 1) j)) (- 1)))
// (not (<= 1 (+ j (* (- 2) x)))) 
// (not (<= 1 (+ (* 2 i) (* (- 1) j))))

// (
    // and (not (<= (+ (* 2 i) (* (- 1) j)) (- 1))) (
    //     and (not (<= 1 (+ j (* (- 2) x)))) (not (<= 1 (+ (* 2 i) (* (- 1) j))))))
