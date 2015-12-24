class Backdrop extends Actor
{
    private PImage _png;
    
    public Backdrop(String fileName)
    {
        super(null);
        _png = loadImage(fileName);
    }
    
    public void draw()
    {
        background(_png);
    }
    
    public void loadBackdrop(String fileName)
    {
        _png = loadImage(fileName);
    }
}