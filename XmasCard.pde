//Jessica and Paul Drury December 2015

final int FRAMES_PER_SECOND = 18;

ArrayList<Actor> cast = new ArrayList<Actor>();
ArrayList<StageDirection> script = new ArrayList<StageDirection>();

PImage png;

void setup()
{
    //set the size of the stage
    size(800, 600, P3D);
    frameRate(FRAMES_PER_SECOND);
    
    Actor santa = new Actor(new SantaCostume());
    cast.add(santa);
    
    script.add(new Entrance(santa, 1, 300, 2000, 2500));
    script.add(new Movement(santa, FRAMES_PER_SECOND, 2*FRAMES_PER_SECOND, 20, 0, 0));
    
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