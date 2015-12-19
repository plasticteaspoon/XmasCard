class SantaCostume extends Costume
{
    float rArmAngle = PI/8;
    float lArmAngle = -PI/8;
    
     public void drawAtOrigin()
     {         
         noStroke();
         
         //the legs
         drawLegs();
         //the arms 
         drawArms();
         //the body
         drawBody();
         stroke(0, 0, 0);
         //the head
         drawHead();
             
         
     }
     
    private void drawBody()
    {
        //the body
        fill(225, 0, 0);
        ellipse(0, -500, 200, 300);
        
        //the belt
        fill(0, 0, 0);
        rect(-100, -500, 200, 50);
    }
    
    private void drawHead()
    {
        //the head
        noStroke();
        fill(255, 223, 196);
        ellipse(0, -675, 150, 150);
        
        //the face
        //right eye
        fill(0, 0, 0);
        ellipse(-37, -680, 10, 10);
        
        //left eye
        ellipse(37, -680, 10, 10);
        
        //the beard
        fill(255, 255, 255);
        beginShape();
        vertex(70, -650);
        quadraticVertex(0, -675, -70, -650);
        quadraticVertex(-100, -550, 0, -400);
        quadraticVertex(100, -550, 70, -650);
        endShape(CLOSE);
        
        //the mouth
        stroke(0, 0, 0);
        curve(50, -670, 30, -630, -30, -630, -50, -670);
        
         //the hat
         noStroke();
         fill(255, 0, 0);
         triangle(0, -850, 73, -730, -73, -730);
         
         //the trim on the hat
         fill(255, 255, 255);
         rect(-73, -730, 146, 30);
         
         //the pompom on top of the hat
         stroke(200);         
         ellipse(0, -850, 50, 50);
    }
    
    private void drawArms()
    {
        //right arm
        pushMatrix();
        translate(-110, -510);
        rotate(rArmAngle);         
        fill(225, 0, 0);
        ellipse(0, 0, 75, 200);
        
        //right hand
        fill(255, 223, 196);
        ellipse(0, 100, 50, 50);
        popMatrix();
        
        //left arm
        pushMatrix();
        translate(110, -510);
        rotate(lArmAngle);
        fill(225, 0, 0);
        ellipse(0, 0, 75, 200);
        
        //left hand
        fill(255, 223, 196);
        ellipse(0, 100, 50, 50);
        popMatrix(); 
    }
    
    private void drawLegs()
    {
        //the legs
        fill(225, 0, 0);
        ellipse(-50, -325, 75, 150);
        ellipse(50, -325, 75, 150);
        
        //the shoes
        fill(0, 0, 0);
        ellipse(-75, -270, 100, 50);
        ellipse(75, -270, 100, 50);         
    }
}