class Backdrop extends Actor
{
    private PImage _img;
    
    public Backdrop(PImage img)
    {
        super(null);
        _img = img;
    }
    
    public void draw()
    {
        background(_img);
    }
    
    public void loadBackdrop(PImage img)
    {
        _img = img;
    }
}