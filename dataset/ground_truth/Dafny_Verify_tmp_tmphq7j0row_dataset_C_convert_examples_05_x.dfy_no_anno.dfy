// MODULE main
// 	int x;
// 	int y;

// 	int j;
// 	int i;

// 	assume(x == 0);
// 	assume(y == 0);
// 	assume(i == 0);
// 	assume(j == 0);

// 	while(*) {
// 		x = x + 1;
// 		y = y + 1;
// 		i = i + x;
// 		j = j + y;

// 		if(*){
// 			j = j + 1;
// 		}
// 		else{
// 			skip;
// 		}
	
// 	} 

// 	assert(j >= i);

// END MODULE

// (
//     let ((.def_189 (+ j (* (- 1) i)))) (
//         let ((.def_421 (<= 1 (+ x (* (- 1) y))))) (
//             not (and (or (<= .def_189 (- 1)) .def_421) (
//                 and (or .def_421 (<= (+ (* 3 x) (+ (* (- 3) y) .def_189)) (- 1))) (
//                     and (or .def_421 (<= (+ x (+ (* (- 1) y) .def_189)) (- 1))) (
//                         not (and (not .def_421) (
//                             and (not (<= (+ (* 2 x) (+ (* (- 2) y) .def_189)) (- 2))) (
//                                 not (<= (+ (* 2 x) (+ (* (- 2) y) .def_189)) (- 1)))))))))))
//                                 )

method main()
{
    var x := 0;
    var y := 0;
    var i := 0;
    var j := 0;

    while(x <= 100000) 
        decreases 100000 - x
    {
        x := x + 1;
        y := y + 1;
        i := i + x;
        j := j + y;

        if(*) {
            j := j + 1;
        }
    }

}

