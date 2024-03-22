
method checkTemperatureCOntrol(heatOn: real, heatOff: real, Tdes: real, MIN: real, MAX: real) returns (t_out: real)
decreases heatOn, heatOff, Tdes, MIN, MAX
//// these values are based on the specifications
requires Tdes==19.0; 
requires MAX== 30.0;
requires MIN==-10.0
ensures t_out> MIN && t_out < MAX
{/* TODO */ }


