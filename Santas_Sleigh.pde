class SleighCostume extends Costume
{
     public void drawAtOrigin()
    {
        fill(225, 0, 0);
        stroke(225, 0, 0);
        //the back
        rect(0, 0, 425, -650);
        //the seat
        rect(425, 0, 275, -325);
        //the side of footwell        
        rect(700, 0, 300, -100);
        //the footwell
        arc(1000, -275, 550, 550, PI + HALF_PI, 2*PI + HALF_PI, CHORD);
        //ellipse(1000, -275, 550, 550);
    }
}