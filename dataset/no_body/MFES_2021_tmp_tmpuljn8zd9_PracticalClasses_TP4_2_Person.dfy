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
        reads this
        reads spouse
        reads mother 
        reads father
    {
        (civilState == Married <==> spouse != null)
        && (mother != null ==> mother.sex == Feminine) 
        && (father != null ==> father.sex == Masculine)
        && (spouse != null ==> sex != spouse.sex)
        && (spouse != null ==> spouse.spouse == this)
    }
 
    constructor (name: string, sex: Sex, mother: Person?, father: Person?)
        requires mother != null ==> mother.sex == Feminine
        requires father != null ==> father.sex == Masculine
        ensures this.name == name 
        ensures this.sex == sex
        ensures this.mother == mother 
        ensures this.father == father
        ensures this.spouse == null
        ensures this.civilState == Single
        ensures Valid()
    {
        this.name := name;
        this.sex := sex;
        this.mother := mother;
        this.father := father;
        this.spouse := null;
        this.civilState := Single;
    }
 
    method marry(spouse: Person)
        modifies spouse
        modifies this
        requires this.spouse == null && spouse.spouse == null
        requires civilState != Married && civilState != Dead 
        requires spouse.civilState != Married && spouse.civilState != Dead
        requires spouse.sex != sex
        requires Valid()
        ensures spouse.spouse == this && this.spouse == spouse 
        ensures spouse.civilState == Married && this.civilState == Married
        ensures Valid()
    {/* TODO */ }
 
    method divorce()
        modifies spouse
        modifies this 
        requires spouse != null && spouse.spouse != null && spouse.spouse == this
        requires civilState == Married && spouse.civilState == Married
        requires Valid()
        ensures old(spouse).spouse == null && spouse == null 
        ensures old(spouse).civilState == Divorced && civilState == Divorced
        ensures Valid()
    {/* TODO */ }
 
    method die()
        modifies this 
        modifies spouse 
        requires civilState != Dead
        requires Valid()
        ensures old(spouse) != null ==> old(spouse).spouse == null && old(spouse).civilState == Widow
        ensures spouse == null && civilState == Dead
        ensures Valid()
    {/* TODO */ }
}

