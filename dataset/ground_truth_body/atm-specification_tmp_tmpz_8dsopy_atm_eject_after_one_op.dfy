class Card {
    var pin: nat;
    var balance: nat;

    constructor(pin: nat, balance: nat)
        requires 0 <= pin <= 9999
        requires balance >= 0
        ensures this.pin == pin
        ensures this.balance == balance
    {
        this.pin := pin;
        this.balance := balance;
    }
}


class ATM {
    const min_withdraw_amount: nat;
    const max_withdraw_amount: nat;
    const max_stored_amount: nat;

    var card: Card?;
    var entered_pin: int;
    var stored_amount: nat;

    constructor(min_withdraw_amount: nat, max_withdraw_amount: nat, initial_amount: nat, max_stored_amount: nat)
        requires 0 <= min_withdraw_amount <= max_withdraw_amount <= max_stored_amount
        requires 0 <= min_withdraw_amount <= initial_amount <= max_stored_amount
        ensures this.min_withdraw_amount == min_withdraw_amount
        ensures this.max_withdraw_amount == max_withdraw_amount
        ensures this.stored_amount == initial_amount
        ensures this.max_stored_amount == max_stored_amount
        ensures !IsCardInserted()
    {
        this.min_withdraw_amount := min_withdraw_amount;
        this.max_withdraw_amount := max_withdraw_amount;
        this.stored_amount := initial_amount;
        this.max_stored_amount := max_stored_amount;
        this.card := null;
        this.entered_pin := -1;
    }

    predicate IsCardInserted() reads this {
        this.card != null
    }

    predicate IsEnteredPINValid()
        requires IsCardInserted()
        reads this
        reads this.card
    {
        this.card.pin == this.entered_pin
    }

    predicate IsAddedStoredAmountValid(amount: nat) reads this {
        this.stored_amount + amount <= this.max_stored_amount
    }

    predicate IsWithdrawAmountValid(amount: nat, card: Card)
        requires IsCardInserted()
        reads this
        reads card
    {
        && amount >= this.min_withdraw_amount
        && amount <= this.max_withdraw_amount
        && amount <= this.stored_amount
        && amount <= card.balance
    }

    method InsertCard(card: Card)
        requires !IsCardInserted()
        modifies this
        ensures IsCardInserted()
        ensures this.stored_amount == old(this.stored_amount)
        ensures this.entered_pin == old(this.entered_pin)
        ensures this.card == card
    {
        this.card := card;
    }
    
    method EjectCard()
        requires IsCardInserted()
        modifies this
        ensures !IsCardInserted()
        ensures this.stored_amount == old(this.stored_amount)
        ensures this.entered_pin == -1
        ensures this.card == null
    {
        this.card := null;
        this.entered_pin := -1;
    }

    method EnterPIN(pin: nat, card: Card)
        requires IsCardInserted()
        modifies this, this.card
        ensures this.stored_amount == old(this.stored_amount)
        ensures card.pin == old(card.pin)
        ensures card.balance == old(card.balance)
        ensures card.pin != pin ==> this.card == null
        ensures card.pin == pin ==> (
            && this.card == old(this.card)
            && this.card.balance == old(this.card.balance)
            && this.card.pin == old(this.card.pin)
        )
    {
        if card.pin == pin {
            this.entered_pin := pin;
        }
        else {
            print "Error: incorrect PIN";
            EjectCard();
        }
    }

    method ChangePIN(new_pin: nat, card: Card)
        requires IsCardInserted()
        modifies this, this.card, card
        ensures this.stored_amount == old(this.stored_amount)
        ensures this.card == null
        ensures 0 <= new_pin <= 9999 ==> card.pin == new_pin
        ensures card.balance == old(card.balance)
    {
        if 0 <= new_pin <= 9999 {
            card.pin := new_pin;
        }
        else {
            print "Error: invalid PIN format";
        }
        
        EjectCard();
    }

    method Withdraw(amount: nat, card: Card)
        requires IsCardInserted()
        modifies this, this.card, card
        ensures !IsCardInserted()
        ensures old(IsWithdrawAmountValid(amount, card)) ==> (
            && this.stored_amount == old(this.stored_amount) - amount
            && card.balance == old(card.balance) - amount
        )
        ensures this.card == null
        ensures card.pin == old(card.pin)
    {
        if IsWithdrawAmountValid(amount, card) {
            this.stored_amount := this.stored_amount - amount;
            card.balance := card.balance - amount;
        }
        else {
            print "Error: invalid withdraw amount";
        }

        EjectCard();
    }

    method Refill(amount: nat)
        requires !IsCardInserted()
        modifies this
        ensures old(IsAddedStoredAmountValid(amount)) ==> this.stored_amount == old(this.stored_amount) + amount
        ensures this.entered_pin == old(this.entered_pin)
        ensures !IsCardInserted()
    {
        if IsAddedStoredAmountValid(amount) {
            this.stored_amount := this.stored_amount + amount;
        }
        else {
            print "Error: invalid refill amount";
        }
    }
}

method Main() {
    var min_withdraw_amount := 10;
    var max_withdraw_amount := 100;
    var initial_amount := 200;
    var max_stored_amount := 400;
    var pin1 := 4242;
    var pin2 := 9999;
    var balance := 500;
    var atm := new ATM(min_withdraw_amount, max_withdraw_amount, initial_amount, max_stored_amount);
    var card1 := new Card(pin1, balance);
    var card2 := new Card(pin2, balance);

    atm.InsertCard(card1);
    atm.EnterPIN(pin1, card1);
    atm.Withdraw(100, card1);

    atm.Refill(300);

    atm.InsertCard(card2);
    atm.EnterPIN(pin2, card2);
    atm.Withdraw(100, card2);

    var new_pin1 := 8888;
    atm.InsertCard(card1);
    atm.EnterPIN(pin1, card1);
    atm.ChangePIN(new_pin1, card1);

    atm.InsertCard(card1);
    atm.EnterPIN(new_pin1, card1);
    atm.Withdraw(100, card1);
}
