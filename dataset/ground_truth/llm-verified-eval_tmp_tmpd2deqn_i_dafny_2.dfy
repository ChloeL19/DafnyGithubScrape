function truncate(x: real): real
    requires x >= 0.0
    ensures truncate(x) >= 0.0
    ensures x - truncate(x) < 1.0
    ensures x - truncate(x) >= 0.0
{
    if x < 1.0 then 0.0 else 1.0 + truncate(x - 1.0)
}

function truncate_number(x: real): real
    requires x >= 0.0
    ensures truncate_number(x) < 1.0 && truncate_number(x) >= 0.0
    ensures truncate_number(x) + truncate(x) == x
{
    x - truncate(x)    
}
