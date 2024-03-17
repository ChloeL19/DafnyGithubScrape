// define data type Matrix to represent normal dense matrix with rows x columns
// for non-empty matrix, we requires both numbers of rows and columns to be greater or equal to 1
// for empty matrix, we requires number of rows equal to 0, number of columns equal to 0, while the values is represented by an empty sequence.

datatype Matrix = Matrice(vals: seq<seq<int>>, rows: int, columns: int)

predicate isMatrix(mat: Matrix) {
    mat.rows >= 0 && mat.columns >= 0 && |mat.vals| == mat.rows && forall i :: 0 <= i < mat.rows ==> |mat.vals[i]| == mat.columns
}

