int n = 50;
myPoint[] points = new myPoint[n];
myLine minErrLine ;
myLine line;
//myLine testLine;
double distLeftOfLine=0;
double distRightofLine=0;
double diff = 0;
double preDiff=0;
boolean done=false;
int speedOfLine = 5;
int cnt=616;
double angOfRot = 0.005; 
double minErr=(double)1e7;

void setup() {
  frameRate(240);
  size(800, 800);
  for (int i=0; i<n; i++) {
    points[i] = new myPoint(random(200, 700),random(200, 500));
  }
  line = new myLine(new myPoint(50,0),new myPoint(0,900));
  //line = new myLine();
  //testLine= new myLine(new myPoint(1,1),new myPoint(0,900));
}

void draw() {
  //println(line.c + " " + line.slope);
  background(0);
  
  drawDots();
  strokeWeight(5);
  stroke(0,255,0);
  
  if(!done){
    textSize(32);
    fill(255);
    text("cnt: " +cnt ,10,25);
    stroke(255,255,0);
    calcErr();
    line((float)line.p1.x,(float)line.p1.y,(float)line.p2.x,(float)line.p2.y);
  }
  else{
    textSize(32);
    fill(255);
    text("min Err: " +minErr ,10,25);
    //println(minErr);
    //println((float)minErrLine.p1.x+" "+(float)minErrLine.p1.y+" "+(float)minErrLine.p2.x+" "+(float)minErrLine.p2.y);
    line((float)minErrLine.p1.x,(float)minErrLine.p1.y,(float)minErrLine.p2.x,(float)minErrLine.p2.y);
  }
  //line((float)testLine.p1.x,(float)testLine.p1.y,(float)testLine.p2.x,(float)testLine.p2.y);
  //rotate(testLine ,0.09, testLine.p1);
  //println(testLine.p1.x + " " + testLine.p1.y + " -- " + testLine.p2.x + " " +testLine.p2.x);
}

void drawDots(){
  for(int i=0; i <n; i++){
    if(!done)
    if(ccw(points[i], line.p1, line.p2)){
      fill(255,0,0);
    }
    else{
      fill(0,0,255);
    }
    else
    if(ccw(points[i], minErrLine.p1, minErrLine.p2)){
      fill(255,0,0);
    }
    else{
      fill(0,0,255);
    }
    noStroke();
    ellipse((float)points[i].x,(float)points[i].y,30,30);
  }
}


boolean ccw(myPoint p, myPoint q, myPoint r){
    return new myVector(p, q).cross(new myVector(p, r)) > 0;
}

void calcErr(){
  distLeftOfLine = 0;
  distRightofLine = 0;
  for(int i=0; i < n; i++){
    if(ccw(points[i], line.p1, line.p2)){
      distLeftOfLine+=line.distToLine(points[i]); 
    }
    else{
      distRightofLine+=line.distToLine(points[i]);
    }    
  }
  moveLine(distLeftOfLine,distRightofLine);
}

void moveLine(double distLeftOfLine,double distRightofLine){
    double tmp=distLeftOfLine-distRightofLine;
    double err=distLeftOfLine+distRightofLine;
    if(cnt==0 || (int)diff*100 == (int)tmp*100){
      done=true;
      println("3ash");
    }
    if(tmp==preDiff){
      println(cnt + " " +err);
      if(Math.abs(minErr) > Math.abs(err)){
        minErrLine = new myLine(line.p1,line.p2);
        minErr=err;
      }
      cnt--;
      //println("gamed"+ cnt);
      rotate(line ,angOfRot, line.p1);
      line.updateLine();
      return;
    }
    else if(tmp<0){
      line.c += speedOfLine;
    }
    else{
      line.c -= speedOfLine;
    }
    //println("left " +left);
    //println("right "+right);
    //println("diff "+diff + " " + "tmp " +tmp);
    preDiff=diff;
    diff=tmp;
    line.p1.x = 900;
    line.p1.y = line.slope * line.p1.x + line.c ;
    line.p2.x = -1;
    line.p2.y = line.slope * line.p2.x + line.c ;
}
  


void rotate(myLine l ,double theta, myPoint p){ //rotate around p
    myVector v = new myVector(p, new myPoint(0, 0));
    l.p2 = l.p2.translate(v).rotate(theta).translate(v.reverse());
  }
