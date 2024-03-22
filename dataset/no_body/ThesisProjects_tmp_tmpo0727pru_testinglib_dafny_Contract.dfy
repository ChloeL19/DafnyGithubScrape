

module Contract {



    trait address{

        var balance: nat
        var msg: Message
        var block: Block


        method transfer(payer: address)
            requires payer.msg.value < payer.balance
            requires payer != this
            modifies payer
            ensures balance == old(balance) + payer.msg.value
            ensures payer.balance == old(payer.balance) - payer.msg.value

        method send(amount: nat, sender: address)
            requires sender.balance > amount
            ensures this.balance == old(this.balance) + amount;
    }


    trait Message{/* TODO */ }

    trait Block{
        var timestamp: nat
    }
}
