//Jessica and Paul Drury December 2015

final int FRAMES_PER_SECOND = 18;

ArrayList<Actor> cast = new ArrayList<Actor>();
ArrayList<StageDirection> script = new ArrayList<StageDirection>();

void setup()
{
    //set the size of the stage
    size(800, 600, P3D);
    frameRate(FRAMES_PER_SECOND);
    
    Actor tree = new Actor(new TreeCostume());
    cast.add(tree);
    
    Actor santa = new Actor(new SantaCostume());
    cast.add(santa);
    
    //script.add(new Entrance(tree, 40, 300, 300, 50));
    script.add(new Entrance(santa, 40, 300, 300, 1000));
    //script.add(new Movement(tree, 80, 200, 2, 2, 2));
}

void draw() 
{
    //lets do the play!
    
    //loop through the stage directions and execute any actions that 
    //are scheduled for this frame 
    for(StageDirection direction : script)
    {
        if (direction.isCurrent(frameCount))
        {
            direction.execute(frameCount);
        }
    }

    //erase the screen
    background(255);
    
    //redraw the cast members
    for(Actor actor : cast)
    {
        actor.draw();
    }
}