method main(n: int, k: int) returns (k_out: int)
    requires n > 0;
	requires k > n;
	ensures k_out >= 0;
{/* TODO */ }


// C code:
// MODULE main
// 	int i;
// 	int n;
// 	int j;
// 	int k;

// 	assume(n > 0);
// 	assume(k > n);
// 	assume(j == 0);

// 	while(j < n){
// 		j = j + 1;
// 		k = k - 1;
// 	}

// 	assert(k >= 0);	

// END MODULE

// Invariant
// (
    // not (or (<= 1 (+ n (+ (* (- 1) j) (* (- 1) k)))) (
    //     and (<= k (- 1)) (<= (+ n (* (- 1) j)) (- 1)))))

