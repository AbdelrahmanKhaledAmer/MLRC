class lline{
  ppoint p1;
  ppoint p2;
  double slope;
  double c; 
  //double err=(double)1e9;
  //y = slope * x + c
  lline(){
    p1 = new ppoint();
    p2 = new ppoint();
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
  
  lline(ppoint po1, ppoint po2){
    p1 = new ppoint();
    p2 = new ppoint();
    slope = (po2.y - po1.y)/(po2.x - po1.x);
    c = po1.y - slope * po1.x;
    p1.x=po1.x;
    p1.y=po1.y;
    p2.x=po2.x;
    p2.y=po2.y;
  }
  
  double distToLine(ppoint p) {
    // formula: c = a + u * ab
    vvector ap = new vvector(p1, p), ab = new vvector(p1, p2);
    double u = ap.dot(ab) / ab.norm2();
    ppoint c = p1.translate(ab.scale(u)); 
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
