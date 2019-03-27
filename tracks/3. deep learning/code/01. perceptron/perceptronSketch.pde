Perceptron p;

TrainingInstance[] data;

void setup()
{
  // Set window size for visualization
  size(500, 500);
  
  // Create the training data (OR)
  data = new TrainingInstance[4];
  data[0] = new TrainingInstance(0, 0, -1);
  data[1] = new TrainingInstance(0, 1, 1);
  data[2] = new TrainingInstance(1, 0, 1);
  data[3] = new TrainingInstance(1, 1, 1);
  
  // Create a new perceptron object
  p = new Perceptron(2);
}

void draw()
{
  translate(100, height - 100);
  scale(1, -1);
  background(150);

  for(TrainingInstance x : data)
  {
    // Get correct prediction
    int prediction = p.predict(x.toArray());
    
    // Draw points
    if(prediction == x.label)
    {
      x.setColor(true);
    } else {
      x.setColor(false);
    }
    x.show();
  }
  strokeWeight(5);
  stroke(0,0,255);
  // Draw perceptron line
  p.drawLine();
  strokeWeight(1);
}
