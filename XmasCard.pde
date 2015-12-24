//Jessica and Paul Drury December 2015
/* @pjs preload="dot.png"; */

final int FRAMES_PER_SECOND = 18;

ArrayList<Actor> cast = new ArrayList<Actor>();
ArrayList<StageDirection> script = new ArrayList<StageDirection>();

PImage png;

void setup()
{
    //set the size of the stage
    size(800, 600);
    frameRate(FRAMES_PER_SECOND);
    
    Actor sleigh = new Actor(new SleighCostume(true));
    cast.add(sleigh);
    
    Actor santa = new Actor(new SantaCostume(true));
    cast.add(santa);
    
    //sleigh flies in
    script.add(new Entrance(sleigh, 1, 0, 100, 1000));
    script.add(new MoveTo(sleigh, 1 , 4 * FRAMES_PER_SECOND, 180, 400, 300));
    script.add(new ChangeCostume(sleigh, 4 * FRAMES_PER_SECOND, new SleighCostume(false)));
    //santa enters house
    script.add(new Entrance(santa, 4 * FRAMES_PER_SECOND, 200, 400, 300));                          //appear on garage roof
    script.add(new MoveTo(santa, 5 * FRAMES_PER_SECOND,  1 * FRAMES_PER_SECOND, 425, 400, 300));    //move along garage roof
    script.add(new MoveTo(santa, 6 * FRAMES_PER_SECOND,  3 * FRAMES_PER_SECOND, 425, 345, 300));    //rise to main roof level
    script.add(new MoveTo(santa, 9 * FRAMES_PER_SECOND,  3 * FRAMES_PER_SECOND, 600, 231, 300));    //climb to top of main roof
    script.add(new MoveTo(santa, 12 * FRAMES_PER_SECOND, 2 * FRAMES_PER_SECOND, 650, 268, 300));    //descend far side of roof
    script.add(new MoveTo(santa, 14 * FRAMES_PER_SECOND, 1 * FRAMES_PER_SECOND/4, 700, 268, 300));  //move across to top of chimney
    script.add(new Exit(santa,   16 * FRAMES_PER_SECOND));
    
    //sleigh flies away
    script.add(new ChangeCostume(sleigh, 23*FRAMES_PER_SECOND, new SleighCostume(true)));
    script.add(new MoveTo(sleigh, 24 * FRAMES_PER_SECOND, 4 * FRAMES_PER_SECOND, 800, 100, 5000));
    
    //garage roof coordinates  880, 2500
    
    png = loadImage("http://www.drurys.org/xmascard/dot.png", "png");
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