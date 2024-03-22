class Room
{
    var isAlarmTurnedOn : bool;
    var isThereABreach : bool;
    var hasAlarmFired : bool;

    constructor()
        ensures isAlarmTurnedOn == false;
        ensures hasAlarmFired == false;
        ensures isThereABreach == false;
    {
        this.isAlarmTurnedOn := false;
        this.isThereABreach := false;
        this.hasAlarmFired := false;
    }

    predicate ShouldFireAlarm()
        reads this
    {
        this.isThereABreach == true
    }

    method TurnAlarmOn()
        requires this.isAlarmTurnedOn == false;
        modifies this
        ensures this.isAlarmTurnedOn == true;
        ensures this.hasAlarmFired == old(this.hasAlarmFired);
        ensures this.isThereABreach == old(this.isThereABreach);
    {/* TODO */ }

    method Enter(authorized : bool)
        modifies this
        ensures isAlarmTurnedOn == old(isAlarmTurnedOn)
        ensures isThereABreach == !authorized;
    {/* TODO */ }

    method FireAlarm()
        requires this.isAlarmTurnedOn == true;
        requires this.isThereABreach == true;
        modifies this
        ensures this.hasAlarmFired == true;
        ensures this.isAlarmTurnedOn == old(this.isAlarmTurnedOn)
        ensures this.isThereABreach == old(this.isThereABreach)
    {/* TODO */ }

    method Main() {/* TODO */ }
}
