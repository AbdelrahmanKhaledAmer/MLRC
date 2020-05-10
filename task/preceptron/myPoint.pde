class myPoint{
  static final double EPS = 1e-9;

  double x, y;
  
  myPoint(){
  }
  
  myPoint(double a,double b){
    x = a;
    y = b;
  }
  
  
  
  myPoint rotate(double angle)
  {
    double c = Math.cos(angle), s = Math.sin(angle);
    return new myPoint(x * c - y * s, x * s + y * c);
  }
  
   myPoint translate(myVector v) { 
    return new myPoint(x + v.x ,y + v.y); 
  }
  
  double sq(double x) { return x * x; }
  
  double dist(myPoint p) {
    //return Math.sqrt(sq(x - p.x) + sq(y - p.y));
    return sq(x - p.x) + sq(y - p.y);
  }
}