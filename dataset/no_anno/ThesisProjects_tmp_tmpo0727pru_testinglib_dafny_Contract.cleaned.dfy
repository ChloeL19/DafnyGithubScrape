

module Contract {



    trait address{

        var balance: nat
        var msg: Message
        var block: Block


        method transfer(payer: address)
        method send(amount: nat, sender: address)
    trait Message{
        var sender: address
        var value: nat
        var data: nat
    }

    trait Block{
        var timestamp: nat
    }
}
