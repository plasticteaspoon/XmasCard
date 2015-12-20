//base class for screen items
public class Actor
{
    private PVector _position;
    private Costume _costume;
    private boolean _visible = false;
    
    public Actor(Costume costume)
    {
        _position = new PVector(0, 0, 8);
        _costume = costume;
    }
    
    //go onto the stage
    public void enterStage(PVector position)
    {
        _position = position.copy();
        _visible = true;
    }
    
    //leave the stage
    public void exitStage()
    {
        _visible = false;
    }

    //move to a point on the screen
    public void goTo(PVector position)
    {
        _position = position;
    }
    
    public void move(PVector path)
    {
        _position.add(path);
    }
    
    //draws the shape 
    public void draw()
    {
        if (_visible)
        {
            pushMatrix();
            translate(_position.x, _position.y, -_position.z);
            _costume.drawAtOrigin();
            popMatrix();
        }
    }
    
    public PVector getPosition()
    {
        return _position;
    }
    
 }
 
 public class Costume
 {
     public void drawAtOrigin()
     {
     }
 }