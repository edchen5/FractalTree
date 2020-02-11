private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  

double lenBranch = 1;

boolean skew = false;

public void setup() 
{   
  size(800, 600);  
} 

public void draw() 
{   
  if(skew == false && lenBranch < 100)
  {
    branchAngle += 0.001;
    lenBranch += 0.25;
  }

  if(skew == true && lenBranch < 100)
  {
    lenBranch += 0.25;
    branchAngle += 0.0001;
  }

  background(0);   
  stroke(0, 255, 0); 

  line(400, 580, 400, 480);  

  drawBranches(400, 480, lenBranch, 3 * Math.PI / 2);

} 

public void mousePressed()
{
  if(skew == false && lenBranch == 100)
  {
    skew = true;
    frameCount = 0;
    lenBranch = 1;
    branchAngle = 0.2;
  }
  else if(skew == true && lenBranch == 100)
  {
    skew = false;
    frameCount = 0;
    lenBranch = 1;
    branchAngle = 0.2;
  }
  
}

public void drawBranches(int x, int y, double branchLength, double angle) 
{   
  double angle1;
  if(skew == true)
    angle1 = angle + 2 * branchAngle;
  else 
    angle1 = angle + branchAngle;
  
  double angle2 = angle - branchAngle;

	int endX1 = (int)(branchLength * Math.cos(angle1) + x);
  int endY1 = (int)(branchLength * Math.sin(angle1) + y);

  int endX2 = (int)(branchLength * Math.cos(angle2) + x);
  int endY2 = (int)(branchLength * Math.sin(angle2) + y);

  branchLength *= fractionLength;

  line(x , y, endX1, endY1);
  line(x , y, endX2, endY2);
  
  if(branchLength > smallestBranch)
  {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }

} 