//Jessica and Paul Drury December 2015

final int FRAMES_PER_SECOND = 18;

ArrayList<Actor> cast = new ArrayList<Actor>();
ArrayList<StageDirection> script = new ArrayList<StageDirection>();

PImage png;

void setup()
{
    //set the size of the stage
    size(800, 600, P3D); //<>//
    frameRate(FRAMES_PER_SECOND);
    
    Actor santa = new Actor(new SantaCostume());
    cast.add(santa);
    
    Actor sleigh = new Actor(new SleighCostume());
    cast.add(sleigh);
    
    //script.add(new Entrance(santa, 1, 300, 2000, 2500));
    script.add(new Entrance(sleigh, 1, -5000, -1000, 5000));
    script.add(new MoveTo(sleigh, 1, 4*FRAMES_PER_SECOND, -200, 880, 2500));
    
    //garage roof coordinates  880, 2500
    
    png = loadImage("dot.png");
}

void draw() 
{
    //lets do the play!
    
    background(png);
    
    //loop through the stage directions and execute any actions that 
    //are scheduled for this frame 
    for(StageDirection direction : script)
    {
        if (direction.isCurrent(frameCount))
        {
            direction.execute(frameCount);
        }
    }
    
    //redraw the cast members
    for(Actor actor : cast)
    {
        actor.draw();
    }
}