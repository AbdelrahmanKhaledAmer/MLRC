int n = 50;
ppoint[] points = new ppoint[n];
lline line;
double bluePointsDistanceToLine = 0;
double redPointsDistanceToLine = 0;
lline bestFitLine;
boolean foundBestFit = false;
double minError = (double) 1e13;
int iterations = 1000;
double rotation = 0.005;
double rotationCount = 10000;
double rotations = 0;
int changeInLine = 5;

void setup(){
   size(800, 800);
   frameRate(240);
   for(int i=0; i<n; i++){
     points[i] = new ppoint(random(200, 500), random(200, 700));
   }
   line = new lline(new ppoint(50, 0), new ppoint(0, 900));
}

void draw(){
  background(0);
  //ellipse(100, 100, 50, 50);
  //x, y, x-radius, y-radius  
  points();
  strokeWeight(5);
  stroke(255, 0, 0);
  if(!foundBestFit){
    error();
    line((float)line.p1.x, (float)line.p1.y, (float)line.p2.x, (float)line.p2.y);
  }
  else{
    text("This is the best fit line", 0, 0);
    line((float) bestFitLine.p1.x, (float)bestFitLine.p1.y, (float)bestFitLine.p2.x, (float)bestFitLine.p2.y);
  }
}

void points(){
  for(int i=0; i<n; i++){
    if(!foundBestFit){
      if(ccw(points[i], line.p1, line.p2))
        fill(255, 0, 0);
      else
        fill(0, 0, 255);
    }
    else{
      if(ccw(points[i], bestFitLine.p1, bestFitLine.p2))
        fill(255, 0, 0);
      else
        fill(0, 0, 255);
      println("minError: " + minError);
    }
    noStroke();
    ellipse((float)points[i].x, (float)points[i].y, 25, 25);
  }
}

void error(){
  redPointsDistanceToLine = 0;
  bluePointsDistanceToLine = 0;
  for(int i=0; i<n; i++){
    if(ccw(points[i], line.p1, line.p2))
      redPointsDistanceToLine+=line.distToLine(points[i]);
    else
      bluePointsDistanceToLine+=line.distToLine(points[i]);
    //println("red: " + redPointsDistanceToLine);
    //println("blue: "+ bluePointsDistanceToLine);
  }
  shiftLine(bluePointsDistanceToLine, redPointsDistanceToLine);
}

void shiftLine(double blue, double red){
  double error = blue + red;
  println("error: " + error);
  //println("iterations left: " + iterationsLeft);
  println("rotations: " + rotations);
  //iterationsLeft--;
  //if(iterationsLeft--==0){
  //  rotations++;
  //  iterationsLeft = iterations;
  //  rotate(line, rotation, line.p1);
  //  line.updateLine();
  //}
  if(rotations == rotationCount)
    foundBestFit = true;
  if(error <= minError){
    bestFitLine = new lline(line.p1, line.p2);
    minError = error;
    //iterationsLeft = iterations;
  }
  else{
    rotations++;
    //iterationsLeft = iterations;
    rotate(line, rotation, line.p1);
    line.updateLine();
  }
  if(blue > red){
     line.c += changeInLine;
  }
  else{
     line.c -= changeInLine;
  }
  line.p1.x = 900;
  line.p1.y = line.slope * line.p1.x + line.c;
  line.p2.x = -1;
  line.p2.y = line.slope * line.p2.x + line.c;  
}

boolean ccw(ppoint p, ppoint q, ppoint r){
    return new vvector(p, q).cross(new vvector(p, r)) > 0;
}

void rotate(lline line, double theta, ppoint point){
  vvector vector = new vvector(point, new ppoint(0, 0));
  line.p2 = line.p2.translate(vector).rotate(theta).translate(vector.reverse());
}
