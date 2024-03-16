function RowColumnProduct(m1: array2<int>, m2: array2<int>, row: nat, column: nat): int
    reads m1
    reads m2
{
    RowColumnProductFrom(m1, m2, row, column, 0)
}

function RowColumnProductFrom(m1: array2<int>, m2: array2<int>, row: nat, column: nat, k: nat): int
    reads m1
    reads m2
{
    if k == m1.Length1 then
        0
    else
        m1[row,k]*m2[k,column] + RowColumnProductFrom(m1, m2, row, column, k+1)
}

method multiply(m1: array2<int>, m2: array2<int>) returns (m3: array2<int>)
{
    m3 := new int[m1.Length0, m2.Length1];
    var i := 0;
    while i < m1.Length0
    {
        var j := 0;

        while j < m2.Length1
        {
            var k :=0;
            m3[i, j] := 0;
            while k < m1.Length1
            {
                m3[i,j] := m3[i,j] + m1[i,k] * m2[k,j];
                k := k+1; 

            }
            j := j+1;
        }
        i := i+1;
    }
}

