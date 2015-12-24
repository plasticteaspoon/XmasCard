//Jessica and Paul Drury December 2015
/* @pjs preload="dot.png"; */

final int FRAMES_PER_SECOND = 18;

ArrayList<Actor> cast = new ArrayList<Actor>();
ArrayList<StageDirection> script = new ArrayList<StageDirection>();

PImage png;

void setup()
{
    //set the size of the stage //<>//
    size(800, 600);
    frameRate(FRAMES_PER_SECOND);
    
    Actor sleigh = new Actor(new SleighCostume(true));
    cast.add(sleigh);
    
    Actor santa = new Actor(new SantaCostume(true));
    cast.add(santa);
    
    //sleigh flies in
    script.add(new Entrance(sleigh,      1 * FRAMES_PER_SECOND, 0, 100, 1000));
    script.add(new MoveTo(sleigh,        1 * FRAMES_PER_SECOND, 4 * FRAMES_PER_SECOND, 180, 400, 300));
    script.add(new ChangeCostume(sleigh, 5 * FRAMES_PER_SECOND, new SleighCostume(false)));
    
    script.add(new Entrance(santa, 5    * FRAMES_PER_SECOND, 250, 400, 300));                                //appear on garage roof
    script.add(new Speak(santa,    5    * FRAMES_PER_SECOND,  2    * FRAMES_PER_SECOND, "Ho Ho Ho!"));
    script.add(new MoveTo(santa,   6    * FRAMES_PER_SECOND,  3    * FRAMES_PER_SECOND,  425, 400, 300));    //move along garage roof
    script.add(new MoveTo(santa,   9    * FRAMES_PER_SECOND,  0.5  * FRAMES_PER_SECOND,  425, 345, 300));    //rise to main roof level
    script.add(new MoveTo(santa,   9.5  * FRAMES_PER_SECOND,  4    * FRAMES_PER_SECOND,  675, 345, 300));    //move along the bottom of the roof
    script.add(new MoveTo(santa,   14   * FRAMES_PER_SECOND,  1.5  * FRAMES_PER_SECOND,  700, 231, 300));    //jump into the air
    script.add(new MoveTo(santa,   16.5 * FRAMES_PER_SECOND,  0.25 * FRAMES_PER_SECOND,  700, 268, 300));    //land on the chimney
    script.add(new Speak(santa,    16.5 * FRAMES_PER_SECOND,  1    * FRAMES_PER_SECOND, "Down I go."));
    
    script.add(new Exit(santa,     17.5 * FRAMES_PER_SECOND));
    
    //santa exits house
    script.add(new ChangeCostume(santa, 21*FRAMES_PER_SECOND, new SantaCostume(false)));
    script.add(new Entrance(santa, 21   * FRAMES_PER_SECOND, 700, 268, 300)); //appears on chimney
    
    script.add(new MoveTo(santa,   21.5 * FRAMES_PER_SECOND,  0.25 * FRAMES_PER_SECOND,  700, 231, 300)); //jumps into air
    script.add(new MoveTo(santa,   22.5 * FRAMES_PER_SECOND,  0.33 * FRAMES_PER_SECOND,  675, 345, 300)); //lands on the roof
    script.add(new MoveTo(santa,   24.5 * FRAMES_PER_SECOND,  4    * FRAMES_PER_SECOND,  425, 345, 300)); //walks along roof
    script.add(new MoveTo(santa,   29.5 * FRAMES_PER_SECOND,  0.5  * FRAMES_PER_SECOND,  425, 400, 300)); //jumps onto garage
    script.add(new MoveTo(santa,   30   * FRAMES_PER_SECOND,  1.5  * FRAMES_PER_SECOND,  340, 400, 300)); //walks to the sleigh
    script.add(new Speak(santa,    31.5 * FRAMES_PER_SECOND,  1    * FRAMES_PER_SECOND, "Merry Christmas to all..."));
    script.add(new MoveTo(santa,   32.5 * FRAMES_PER_SECOND,  1.5  * FRAMES_PER_SECOND,  250, 400, 300)); //walks to the sleigh
    script.add(new Speak(santa,    34   * FRAMES_PER_SECOND,  1    * FRAMES_PER_SECOND, "...and to all a goodnight"));    
    
    script.add(new Exit(santa,     35   * FRAMES_PER_SECOND)); //gets into sleigh
    //sleigh flies away
    script.add(new ChangeCostume(sleigh, 35*FRAMES_PER_SECOND, new SleighCostume(true)));
    script.add(new MoveTo(sleigh, 35.5 * FRAMES_PER_SECOND, 4 * FRAMES_PER_SECOND, 800, 100, 5000));
    
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