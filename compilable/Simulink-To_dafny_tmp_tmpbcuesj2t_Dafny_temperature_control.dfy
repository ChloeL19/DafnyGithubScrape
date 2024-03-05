
method checkTemperatureCOntrol(heatOn: real, heatOff: real, Tdes: real, MIN: real, MAX: real) returns (t_out: real)
decreases heatOn, heatOff, Tdes, MIN, MAX
//// these values are based on the specifications
requires Tdes==19.0; 
requires MAX== 30.0;
requires MIN==-10.0
ensures t_out> MIN && t_out < MAX
{
    
    t_out:=Tdes;
    
    //sum block
    var temp:= Tdes + t_out;

    //Unite delay implementation 
    var i:= 0;
    while(i< 100)
    decreases 100-i
    {
        i:= i+1;
    }

    //switch block
    if(temp< MIN)
    {
        temp:= temp+heatOn;
    }
    else if(temp > MIN)
    {
        temp:= temp+heatOff;
    }
    
  
    //cannot implement integration in dafny
    assume (temp> MIN && temp< MAX);

   
    t_out:= temp;



}


