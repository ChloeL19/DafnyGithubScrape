class Room
{
    var isAlarmTurnedOn : bool;
    var isThereABreach : bool;
    var hasAlarmFired : bool;

    constructor()
    {
        this.isAlarmTurnedOn := false;
        this.isThereABreach := false;
        this.hasAlarmFired := false;
    }

    predicate ShouldFireAlarm()
    {
        this.isThereABreach == true
    }

    method TurnAlarmOn()
    {
        isAlarmTurnedOn := true;
    }

    method Enter(authorized : bool)
    {
        isThereABreach := !authorized;
    }

    method FireAlarm()
    {
        hasAlarmFired := true;
    }

    method Main() {
        var room := new Room();

        room.TurnAlarmOn();
        room.Enter(false);
        room.FireAlarm();
    }
}
