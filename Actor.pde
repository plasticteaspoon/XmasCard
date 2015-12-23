//base class for screen items
public class Actor
{
    private PVector _position;
    private Costume _costume;
    private boolean _visible = false;
    private String _lines;
    
    public Actor(Costume costume)
    {
        _position = new PVector(0, 0, 0);
        _costume = costume;
    }
    
    //go onto the stage
    public void enterStage(PVector position)
    {
        _position = new PVector(position.x, position.y, position.z);
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
            translate(_position.x, _position.y); //, -_position.z);
            
            //draw the costume
            pushMatrix();
            scale(0.2 * 300 / _position.z);
            _costume.drawAtOrigin();            
            popMatrix();
            
            //draw the speech bubble
            if(_lines != null)
            {
                text(_lines, 0, 0);
            }
            
            popMatrix();
        }
    }
    
    public PVector getPosition()
    {
        return _position;
    }
    
    public void changeCostume(Costume costume)
    {
        _costume = costume;
    }
    
    public void speak(String lines)
    {
        _lines = lines;
    }
    
 }
 
 public class Costume
 {   
    public void drawAtOrigin()
    {
    }
 }