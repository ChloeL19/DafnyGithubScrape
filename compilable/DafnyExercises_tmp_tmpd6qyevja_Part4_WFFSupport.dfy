datatype WFF = Var(name:string) | 
               Lit(val:bool) |
               Not(expr : WFF) |
               And(left:WFF, right:WFF) |  
               Or(left:WFF, right:WFF) | 
               Equals(left:WFF, right:WFF) |
               Implies(left:WFF, right:WFF)

type Env = map<string,bool>



