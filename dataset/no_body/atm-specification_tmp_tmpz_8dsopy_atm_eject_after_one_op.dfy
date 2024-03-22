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
    {/* TODO */ }
    
    method EjectCard()
        requires IsCardInserted()
        modifies this
        ensures !IsCardInserted()
        ensures this.stored_amount == old(this.stored_amount)
        ensures this.entered_pin == -1
        ensures this.card == null
    {/* TODO */ }

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
    {/* TODO */ }

    method ChangePIN(new_pin: nat, card: Card)
        requires IsCardInserted()
        modifies this, this.card, card
        ensures this.stored_amount == old(this.stored_amount)
        ensures this.card == null
        ensures 0 <= new_pin <= 9999 ==> card.pin == new_pin
        ensures card.balance == old(card.balance)
    {/* TODO */ }

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
    {/* TODO */ }

    method Refill(amount: nat)
        requires !IsCardInserted()
        modifies this
        ensures old(IsAddedStoredAmountValid(amount)) ==> this.stored_amount == old(this.stored_amount) + amount
        ensures this.entered_pin == old(this.entered_pin)
        ensures !IsCardInserted()
    {/* TODO */ }
}

method Main() {/* TODO */ }
