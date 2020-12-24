class ppoint{
  static final double EPS = 1e-9;

  double x, y;
  
  ppoint(){
  
  }
  
  ppoint(double a,double b){
    x = a;
    y = b;
  }
  
  
  
  ppoint rotate(double angle)
  {
    double c = Math.cos(angle), s = Math.sin(angle);
    return new ppoint(x * c - y * s, x * s + y * c);
  }
  
   ppoint translate(vvector v) { 
    return new ppoint(x + v.x ,y + v.y); 
  }
  
  double sq(double x) { return x * x; }
  
  double dist(ppoint p) {
    //return Math.sqrt(sq(x - p.x) + sq(y - p.y));
    return sq(x - p.x) + sq(y - p.y);
  }
}
