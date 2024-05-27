package hello;

public class HelloWorld {
  
  public static void main(String[] args) {
    System.out.println("Hello Roost");
    
    // Example usage of the addition method
    int a = 10;
    int b = 5;
    System.out.println("Addition: " + add(a, b));
  }

  // Method to add two integers
  public static int add(int x, int y) {
    return x + y;
  }
}
