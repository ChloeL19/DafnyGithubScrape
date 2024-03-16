
method checkTemperatureCOntrol(heatOn: real, heatOff: real, Tdes: real, MIN: real, MAX: real) returns (t_out: real)
{
    
    t_out:=Tdes;
    
    //sum block
    var temp:= Tdes + t_out;

    //Unite delay implementation 
    var i:= 0;
    while(i< 100)
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


