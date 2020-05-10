class myLine{
  myPoint p1;
  myPoint p2;
  double slope;
  double c; 
  //double err=(double)1e9;
  //y = slope * x + c
  myLine(){
    p1 = new myPoint();
    p2 = new myPoint();
    double tmp1x=random(50, 800);
    double tmp1y=random(50, 800);
    double tmp2x=random(50, 800);
    double tmp2y=random(50, 800);
    slope = (tmp2y - tmp1y)/(tmp2x - tmp2y);
    c = tmp1y - slope * tmp1x;
    p1.x = 900;
    p1.y = slope * p1.x + c ;
    p2.x = -1;
    p2.y = slope * p2.x + c ;
  }
  
  myLine(myPoint po1,myPoint po2){
    p1 = new myPoint();
    p2 = new myPoint();
    slope = (po2.y - po1.y)/(po2.x - po1.x);
    c = po1.y - slope * po1.x;
    p1.x=po1.x;
    p1.y=po1.y;
    p2.x=po2.x;
    p2.y=po2.y;
  }
  
  double distToLine(myPoint p) {
    // formula: c = a + u * ab
    myVector ap = new myVector(p1, p), ab = new myVector(p1, p2);
    double u = ap.dot(ab) / ab.norm2();
    myPoint c = p1.translate(ab.scale(u)); 
    return p.dist(c);
  }
  
  void updateLine(){
  slope = (p2.y - p1.y)/(p2.x - p1.x);
  p1.x = 900;
  p1.y = slope * p1.x + c ;
  p2.x = -1;
  p2.y = slope * p2.x + c ;
}
    
}