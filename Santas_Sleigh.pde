class SleighCostume extends Costume
{
    private boolean _occupied;
    
    public SleighCostume(boolean occupied)
    {
        _occupied = occupied;
    }
    
    public void drawAtOrigin(String lines)
    {
        if(_occupied == true)
        {
            pushMatrix();
            translate(400, -200);
            
            noStroke();
            //the body
            fill(225, 0, 0);
            ellipse(0, 0, 200, 300);
        
            //the belt
            fill(0, 0, 0);
            rect(-100, 0, 200, 50);
            
            //the head
            noStroke();
            fill(255, 223, 196);
            ellipse(0, -175, 150, 150);
            
            //the eye
            fill(0, 0, 0);
            ellipse(50, -180, 10, 10);
            
            //the beard
            fill(255, 255, 255);
            beginShape();
            vertex(-20, -150);
            bezierVertex(13, -160, 13, -160, 45, -150);
            bezierVertex(100, -75, 100, -90, 100, 0);
            vertex(-20, -150);
            endShape(CLOSE);

            //the hat
            noStroke();
            fill(225, 0, 0);
            triangle(0, -350, 73, -230, -73, -230);
           
            //the trim on the hat
            fill(255, 255, 255);
            rect(-73, -230, 146, 30);
            
            //the pompom on top of the hat
            stroke(200);         
            ellipse(0, -350, 50, 50);
            
            //arm
            pushMatrix();
            translate(50, -20);
            rotate(7*QUARTER_PI);         
            fill(225, 0, 0);
            ellipse(0, 0, 75, 200);
            
            //hand
            fill(255, 223, 196);
            ellipse(0, 100, 50, 50);
            popMatrix();
            
            popMatrix();
        }
       
        pushMatrix();
        scale(0.65);
        
        fill(255, 0, 0);
        noStroke();
        //the back
        rect(0, 0, 425, -650);
        //the seat
        rect(425, 0, 275, -325);
        //the side of footwell        
        rect(700, 0, 300, -100);
        //the footwell
        arc(1000, -275, 550, 550, PI + HALF_PI, 2*PI + HALF_PI);
        
        popMatrix();
    }
}