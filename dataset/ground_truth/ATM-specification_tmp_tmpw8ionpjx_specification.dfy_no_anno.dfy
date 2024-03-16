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
    {
        this.isCardInserted := true;
        this.cardPasscode := cardPasscode;
        this.accountAmount := accountAmount;
    }

    method WithdrawCard()
    {
        this.isCardInserted := false;
    } 

    method EnterPasscode(enteredPasscode : nat)
    {
        this.enteredPasscode := enteredPasscode;
    }

    method Withdraw(withdrawAmount : nat)
    {
        this.storedAmount := this.storedAmount - withdrawAmount;
        this.accountAmount := this.accountAmount - withdrawAmount;
    }

    method AddStoredFunds(addedAmount : nat)
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

