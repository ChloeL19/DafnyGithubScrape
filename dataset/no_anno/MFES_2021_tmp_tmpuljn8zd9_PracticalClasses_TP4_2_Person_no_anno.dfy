datatype Sex = Masculine | Feminine
datatype CivilState = Single | Married | Divorced | Widow | Dead
 
class Person
{
    const name: string; // ‘const’ for immutable fields
    const sex: Sex;
    const mother: Person?; // ‘?’ to allow null
    const father: Person?;
    var spouse: Person?;
    var civilState: CivilState;

    predicate Valid()
    {
        (civilState == Married <==> spouse != null)
        && (mother != null ==> mother.sex == Feminine) 
        && (father != null ==> father.sex == Masculine)
        && (spouse != null ==> sex != spouse.sex)
        && (spouse != null ==> spouse.spouse == this)
    }
 
    constructor (name: string, sex: Sex, mother: Person?, father: Person?)
    {
        this.name := name;
        this.sex := sex;
        this.mother := mother;
        this.father := father;
        this.spouse := null;
        this.civilState := Single;
    }
 
    method marry(spouse: Person)
    {
        spouse.spouse := this;
        spouse.civilState := Married;
        this.spouse := spouse;
        this.civilState := Married;
    }
 
    method divorce()
    {
        spouse.spouse := null;
        spouse.civilState := Divorced;
        this.spouse := null;
        this.civilState := Divorced;
    }
 
    method die()
    {
        if spouse != null
        {
            spouse.spouse := null;
            spouse.civilState := Widow;
        }
        this.spouse := null;
        this.civilState := Dead;
    }
}

