class ATM {
    const minWithdrawAmount : nat;
    const maxWithdrawAmount : nat;
    const maxStoredAmount : nat;

    var isCardInserted : bool;
    var cardPasscode : nat;
    var enteredPasscode : nat;
    var accountAmount : nat;
    var storedAmount : nat;

    constructor(minWithdrawAmount : nat, maxWithdrawAmount : nat, initiallyStoredAmount : nat, maxStoredAmount : nat)
        requires minWithdrawAmount <= maxWithdrawAmount <= maxStoredAmount
        requires initiallyStoredAmount <= maxStoredAmount
        ensures this.minWithdrawAmount == minWithdrawAmount
        ensures this.maxWithdrawAmount == maxWithdrawAmount
        ensures this.storedAmount == initiallyStoredAmount
        ensures this.maxStoredAmount == maxStoredAmount
        ensures isCardInserted == false
    {
        this.minWithdrawAmount := minWithdrawAmount;
        this.maxWithdrawAmount := maxWithdrawAmount;
        this.storedAmount := initiallyStoredAmount;
        this.maxStoredAmount := maxStoredAmount;
        this.isCardInserted := false;
    }

    predicate IsEnteredPasscodeValid(enteredPasscode : nat)
        reads this
    {
        this.cardPasscode == enteredPasscode
    }

    predicate IsWithdrawAmountValid(withdrawAmount : nat)
        reads this
    {
        && withdrawAmount >= this.minWithdrawAmount
        && withdrawAmount <= this.maxWithdrawAmount
        && withdrawAmount <= this.storedAmount
        && withdrawAmount <= this.accountAmount
    }

    predicate IsAddedStoredAmountValid(addedAmount : nat)
        reads this
    {
        this.storedAmount + addedAmount <= this.maxStoredAmount
    }

    method InsertCard(cardPasscode : nat, accountAmount : nat)
        requires this.isCardInserted == false
        modifies this
        ensures this.storedAmount == old(this.storedAmount)
        ensures this.maxStoredAmount == old(this.maxStoredAmount)
        ensures this.minWithdrawAmount == old(this.minWithdrawAmount)
        ensures this.maxWithdrawAmount == old(this.maxWithdrawAmount)
        ensures this.isCardInserted == true
        ensures this.cardPasscode == cardPasscode
        ensures this.accountAmount == accountAmount
    {
        this.isCardInserted := true;
        this.cardPasscode := cardPasscode;
        this.accountAmount := accountAmount;
    }

    method WithdrawCard()
        requires this.isCardInserted == true
        modifies this
        ensures this.isCardInserted == false
        ensures this.storedAmount == old(this.storedAmount)
        ensures this.maxStoredAmount == old(this.maxStoredAmount)
        ensures this.minWithdrawAmount == old(this.minWithdrawAmount)
        ensures this.maxWithdrawAmount == old(this.maxWithdrawAmount)
    {
        this.isCardInserted := false;
    } 

    method EnterPasscode(enteredPasscode : nat)
        requires this.isCardInserted == true
        modifies this
        ensures this.isCardInserted == old(this.isCardInserted)
        ensures this.accountAmount == old(this.accountAmount)
        ensures this.storedAmount == old(this.storedAmount)
        ensures this.cardPasscode == old(this.cardPasscode)
        ensures this.maxStoredAmount == old(this.maxStoredAmount)
        ensures this.minWithdrawAmount == old(this.minWithdrawAmount)
        ensures this.maxWithdrawAmount == old(this.maxWithdrawAmount)
        ensures this.enteredPasscode == enteredPasscode
    {
        this.enteredPasscode := enteredPasscode;
    }

    method Withdraw(withdrawAmount : nat)
        requires this.isCardInserted == true
        requires IsEnteredPasscodeValid(this.enteredPasscode)
        requires IsWithdrawAmountValid(withdrawAmount)
        modifies this
        ensures this.accountAmount == old(this.accountAmount) - withdrawAmount
        ensures this.storedAmount == old(this.storedAmount) - withdrawAmount
        ensures this.cardPasscode == old(this.cardPasscode)
        ensures this.enteredPasscode == old(this.enteredPasscode)
        ensures this.maxStoredAmount == old(this.maxStoredAmount)
        ensures this.minWithdrawAmount == old(this.minWithdrawAmount)
        ensures this.maxWithdrawAmount == old(this.maxWithdrawAmount)
        ensures this.isCardInserted == old(this.isCardInserted)
    {
        this.storedAmount := this.storedAmount - withdrawAmount;
        this.accountAmount := this.accountAmount - withdrawAmount;
    }

    method AddStoredFunds(addedAmount : nat)
        requires IsAddedStoredAmountValid(addedAmount)
        modifies this
        ensures this.accountAmount == old(this.accountAmount)
        ensures this.storedAmount == old(this.storedAmount) + addedAmount
        ensures this.cardPasscode == old(this.cardPasscode)
        ensures this.enteredPasscode == old(this.enteredPasscode)
        ensures this.maxStoredAmount == old(this.maxStoredAmount)
        ensures this.minWithdrawAmount == old(this.minWithdrawAmount)
        ensures this.maxWithdrawAmount == old(this.maxWithdrawAmount)
        ensures this.isCardInserted == old(this.isCardInserted)
    {
        storedAmount := storedAmount + addedAmount;
    }

    method Main() {
        var minWithdrawAmount := 10;
        var maxWithdrawAmount := 100;
        var initialSumInATM := 200;
        var maxSumInATM := 400;

        var atm := new ATM(minWithdrawAmount, maxWithdrawAmount, initialSumInATM, maxSumInATM);

        var cardPasscode := 5392;
        var bankAccountAmount := 500;

        atm.InsertCard(cardPasscode, bankAccountAmount);
        atm.EnterPasscode(cardPasscode);

        atm.Withdraw(100);
        atm.Withdraw(100);
        
        atm.AddStoredFunds(400);

        atm.Withdraw(100); 
        atm.Withdraw(100);
        atm.Withdraw(100);
        
        atm.WithdrawCard();
    }
}

