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
        ellipse(0, -230, 200, 300);
        
        //the belt
        fill(0, 0, 0);
        rect(-100, -230, 200, 50);
    }
    
    private void drawHead()
    {
        //the head
        noStroke();
        fill(255, 223, 196);
        ellipse(0, -405, 150, 150);
        
        //the face
        //right eye
        fill(0, 0, 0);
        ellipse(-37, -410, 10, 10);
        
        //left eye
        ellipse(37, -410, 10, 10);
        
        //the beard
        fill(255, 255, 255);
        beginShape();
        vertex(70, -380);
        quadraticVertex(0, -405, -70, -380);
        quadraticVertex(-100, -200, 0, -130);
        quadraticVertex(100, -200, 70, -380);
        endShape(CLOSE);
        
        //the mouth
        stroke(0, 0, 0);
        curve(50, -400, 30, -360, -30, -360, -50, -400);
        
         //the hat
         noStroke();
         fill(225, 0, 0);
         triangle(0, -580, 73, -460, -73, -460);
         
         //the trim on the hat
         fill(255, 255, 255);
         rect(-73, -460, 146, 30);
         
         //the pompom on top of the hat
         stroke(200);         
         ellipse(0, -580, 50, 50);
    }
    
    private void drawArms()
    {
        //right arm
        pushMatrix();
        translate(-110, -240);
        rotate(rArmAngle);         
        fill(225, 0, 0);
        ellipse(0, 0, 75, 200);
        
        //right hand
        fill(255, 223, 196);
        ellipse(0, 100, 50, 50);
        popMatrix();
        
        //left arm
        pushMatrix();
        translate(110, -240);
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
        ellipse(-50, -55, 75, 150);
        ellipse(50, -55, 75, 150);
        
        //the shoes
        fill(0, 0, 0);
        ellipse(-75, 0, 100, 50);
        ellipse(75, 0, 100, 50);         
    }
}