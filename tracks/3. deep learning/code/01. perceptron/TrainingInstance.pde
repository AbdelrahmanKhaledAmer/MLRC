/*
 * This class is functionally useless. I only made it to aid with
 * The visualization of the data points.
 */

class TrainingInstance
{
  public float x1;
  public float x2;
  public float x0 = 1;
  public int label;
  
  public TrainingInstance(float x1, float x2, int label)
  {
    this.x1 = x1;
    this.x2 = x2;
    this.label = label;
  }
  
  public float[] toArray()
  {
    float[] arr = new float[3];
    arr[0] = x1;
    arr[1] = x2;
    arr[2] = x0;
    return arr;
  }
  
  // Visualization
  int red = 255;
  int grn = 255;
  public void show()
  {
    stroke(0);
    if(label == 1)
    {
      fill(0);
    } else {
      fill(255);
    }
    ellipse(x1*(width - 200), x2*(height - 200), 32, 32);
    fill(red, grn, 0);
    ellipse(x1*(width - 200), x2*(height - 200), 16, 16);
  }
  
  // Color can be red (if wrong prediction) or green (if correct prediction).
  public void setColor(boolean x)
  {
    if(x)
    {
      red = 0;
      grn = 255;
    } else {
      red = 255;
      grn = 0;
    }
  }
}
