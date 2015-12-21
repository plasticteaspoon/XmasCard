public class StageDirection
{
    protected Actor _actor;
    protected int _startTime;
    protected int _duration;
    
    //construct an action with a duration
    public StageDirection(Actor actor, int startTime, int duration)
    {
        _actor = actor;
        _duration = duration;
        _startTime = startTime;
    }
    
    public void execute(int time)
    {
    }
    
    protected final boolean isCurrent(int time)
    {
        if (_duration == 0)
        {
            return _startTime == time;
        }
        else
        {
            return time >= _startTime && time - _startTime < _duration;
        }
    }
}

public class Entrance extends StageDirection
{
    PVector _position;
    
    public Entrance(Actor actor, int startTime, float x, float y, float z)
    {
        super(actor, startTime, 0);
        _position = new PVector(x, y, z);
    }
    
    public void execute(int time)
    {
        _actor.enterStage(_position);
    }
}

public class Movement extends StageDirection
{
    PVector _vector;    //the direction of movement
    
    public Movement(Actor actor, int startTime, int duration, float x, float y, float z)
    {
        super(actor, startTime, duration);
        
        _vector = new PVector(x, y, z);
    }
    
    public void execute(int time)
    {
        _actor.move(_vector);
    }
}

public class MoveTo extends StageDirection
{
    PVector _destination;    //the destination
    
    public MoveTo(Actor actor, int startTime, int duration, float destX, float destY, float destZ)
    {
        super(actor, startTime, duration);
        
        _destination = new PVector(destX, destY, destZ);
    }
    
    public void execute(int time)
    {
        int timeRemaining = _startTime + _duration - time;
        
        if(timeRemaining  > 0)
        {
            PVector moveBy = new PVector(_destination.x, _destination.y, _destination.z);
            moveBy.sub(_actor.getPosition());
            moveBy.div(timeRemaining);        
            _actor.move(moveBy);
        }
    }
}

public class Exit extends StageDirection
{
    public Exit(Actor actor, int startTime)
    {
        super(actor, startTime, 0);
    }
    
    public void execute(int time)
    {
        _actor.exitStage();
    }
}

public class ChangeCostume extends StageDirection
{
    private Costume _costume;
    
    public ChangeCostume(Actor actor, int startTime, Costume costume)
    {
        super(actor, startTime, 0);
        _costume = costume;
    }
    
    public void execute(int Time)
    {
        _actor.changeCostume(_costume);
    }
}