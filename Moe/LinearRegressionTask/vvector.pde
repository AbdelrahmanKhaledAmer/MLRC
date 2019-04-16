class vvector{
  
  static final double EPS = 1e-9;
  double x, y; 
  
  vvector(double a, double b) {
    x = a; y = b;
  }
  
  vvector(ppoint a, ppoint b) { 
    this.x = b.x - a.x;
    this.y = b.y - a.y; 
  }

  vvector scale(double s) {//s is a non-negative value
    return new vvector(x * s, y * s); 
  }              

  double dot(vvector v) { return (x * v.x + y * v.y); }

  double cross(vvector v) { return x * v.y - y * v.x; }

  double norm2() { return x * x + y * y; }
  
  vvector reverse() { return new vvector(-x, -y); }
  
}
