class Perceptron
{
  // Array containing the weights of the perceptron
  float[] weights;
  float lr = 0.01;
  
  // Constructor for the perceptron that initializes the weights
  // based on the number of inputs
  public Perceptron(int numInputs)
  {
    // Initialize the perceptron
    weights = new float[numInputs + 1];
  }
  
  // Activation function for perceptron
  public int activation(float x)
  {
    if(x < 0)
    {
      return -1;
    }
    return 1;
  }
  
  // Return the perceptron's guess of what class the instance belongs to
  public int predict(float[] instance)
  {
    float sum = 0;
    for(int i = 0; i < instance.length; i++)
    {
      sum += instance[i] * weights[i];
    }
    return activation(sum);
  }
  
  // Function that changes the weights if the prediction is wrong
  public void train(float[] instance, int target)
  {
    float y = predict(instance);
    float e = target - y;
    for(int i = 0; i < weights.length; i++)
    {
      weights[i] += e * instance[i] * lr;
    }
  }
  
  // Visualization
  public void drawLine()
  {
    float scale = width - 200;
    float x1 = -100;
    float y1 = ((-weights[0]/weights[1]) * x1 + scale * (-weights[2]/weights[1]));
    float x2 = width - 100;
    float y2 = ((-weights[0]/weights[1]) * x2 + scale * (-weights[2]/weights[1]));
    line(x1, y1, x2, y2);
  }
  
  public void drawLinePt()
  {
    float x1 = -100;
    float y1 = ((-weights[0]/weights[1]) * x1 + (-weights[2]/weights[1]));
    float x2 = width - 100;
    float y2 = ((-weights[0]/weights[1]) * x2 + (-weights[2]/weights[1]));
    line(x1, y1, x2, y2);
  }
  
  void printOut()
  {
    println("w1:", weights[0]);
    println("w2:", weights[1]);
    println("w0:", weights[2]);
  }
}
