class Scenery
{
    private PImage backdrop;
    
    public void createSet()
    {
        drawMountain(0, 300);
        drawTree(0, 300);
        save("background");
        backdrop = loadImage("background");
    }
    
    private void drawTree(float x, float y)
    {
        //the foliage
        fill(0, 225, 0);
        triangle(0 + x, -2.5 + y, 3 + x, -13 + y, 6 + x, -2.5 + y);
        //the trunk
        fill(102, 51, 0);
        rect(2 + x, 0 + y, 1.8, -2.5);    
    }
      
    private void drawMountain(float x, float y)
    {
        fill(102, 51, 0);
        triangle(0 + x, 0 + y, 200 + x, -300 + y, 400 + x, 0 +y);     
    }
    
    public void draw() 
    {
        //erase the screen
        background(backdrop);
    }
}