class myVector{
  
  static final double EPS = 1e-9;
  double x, y; 
  
  myVector(double a, double b) {
    x = a; y = b;
  }
  
  myVector(myPoint a, myPoint b) { 
    this.x = b.x - a.x;
    this.y = b.y - a.y; 
  }

  myVector scale(double s) {//s is a non-negative value
    return new myVector(x * s, y * s); 
  }              

  double dot(myVector v) { return (x * v.x + y * v.y); }

  double cross(myVector v) { return x * v.y - y * v.x; }

  double norm2() { return x * x + y * y; }
  
  myVector reverse() { return new myVector(-x, -y); }
  
}