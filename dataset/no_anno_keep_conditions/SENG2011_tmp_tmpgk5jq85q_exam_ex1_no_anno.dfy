predicate sorted(s: string) // DO NOT CHANGE
{ // DO NOT CHANGE
    if |s| == 0 || |s| == 1 then true
    else if s[0] <= s[1] then sorted(s[1..])
    else false
} // DO NOT CHANGE
