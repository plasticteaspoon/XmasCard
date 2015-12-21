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
    
    Actor sleigh = new Actor(new SleighCostume(true));
    cast.add(sleigh);
    
    Actor santa = new Actor(new SantaCostume(true));
    cast.add(santa);
    
    //sleigh flies in
    script.add(new Entrance(sleigh, 1, -5000, -1000, 5000));
    script.add(new MoveTo(sleigh, 1, 4*FRAMES_PER_SECOND, -550, 880, 2500));
    script.add(new ChangeCostume(sleigh, 4*FRAMES_PER_SECOND + 9, new SleighCostume(false)));
    //santa enters house
    script.add(new Entrance(santa, 4*FRAMES_PER_SECOND + 9, 0, 880, 2500));
    script.add(new MoveTo(santa, 5*FRAMES_PER_SECOND, FRAMES_PER_SECOND, 500, 880, 2500));
    script.add(new MoveTo(santa, 6*FRAMES_PER_SECOND, FRAMES_PER_SECOND/2, 500, 550, 2500));
    script.add(new MoveTo(santa, 6*FRAMES_PER_SECOND + 9, 3*FRAMES_PER_SECOND, 2000, 550, 2500));
    script.add(new MoveTo(santa, 10*FRAMES_PER_SECOND, FRAMES_PER_SECOND, 2150, 0, 2500));
    script.add(new MoveTo(santa, 11*FRAMES_PER_SECOND + 9, FRAMES_PER_SECOND/4, 2150, 150, 2500));
    script.add(new Exit(santa, 12*FRAMES_PER_SECOND));
    //santa exits house
    script.add(new ChangeCostume(santa, 15*FRAMES_PER_SECOND, new SantaCostume(false)));
    script.add(new Entrance(santa, 15*FRAMES_PER_SECOND, 2150, 150, 2500));
    script.add(new MoveTo(santa, 15*FRAMES_PER_SECOND + 9, FRAMES_PER_SECOND/4, 2150, 0, 2500));
    script.add(new MoveTo(santa, 16*FRAMES_PER_SECOND,  FRAMES_PER_SECOND, 2000, 550, 2500));
    script.add(new MoveTo(santa, 17*FRAMES_PER_SECOND, 3*FRAMES_PER_SECOND, 500, 550, 2500));
    script.add(new MoveTo(santa, 20*FRAMES_PER_SECOND, FRAMES_PER_SECOND/2, 500, 880, 2500));
    script.add(new MoveTo(santa, 21*FRAMES_PER_SECOND, FRAMES_PER_SECOND, 0, 880, 2500));
    script.add(new Exit(santa, 23*FRAMES_PER_SECOND));
    //sleigh flies away
    script.add(new ChangeCostume(sleigh, 23*FRAMES_PER_SECOND, new SleighCostume(true)));
    script.add(new MoveTo(sleigh, 24*FRAMES_PER_SECOND, 4*FRAMES_PER_SECOND, 5500, -2000, 5000));
    
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