function truncate(x: real): real
{
    if x < 1.0 then 0.0 else 1.0 + truncate(x - 1.0)
}

function truncate_number(x: real): real
{
    x - truncate(x)    
}
