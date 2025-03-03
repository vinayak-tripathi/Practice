package com.iss.training.javaeight;

public class LambdaExpressions {
	
	/*
	 * Using lambda expression, you can refer to any 
	 * final variable or effectively
	 * final variable (which is assigned only once)
	 */
	public static String salutation = "Hello! ";
	public static void main(String args[]) {
		LambdaExpressions tester = new LambdaExpressions();
		
	    //with type declaration
		MathOperation addition = (int a, int b) -> a + b;
		
	  //with out type declaration
	  MathOperation subtraction = (a, b) -> a - b;
		
	  //with return statement along with curly braces
	  MathOperation multiplication = (int a, int b) -> { return a * b; };
		
	  //without return statement and without curly braces
	  MathOperation division = (int a, int b) -> a / b;
		
	  System.out.println("10 + 5 = " + tester.operate(10, 5, addition));
	  System.out.println("10 - 5 = " + tester.operate(10, 5, subtraction));
	  System.out.println("10 x 5 = " + tester.operate(10, 5, multiplication));
	  System.out.println("10 / 5 = " + tester.operate(10, 5, division));
		
	  //without parenthesis
	  GreetingService greetService1 = message ->
	  System.out.println(salutation + message);
		
	  //with parenthesis
	  GreetingService greetService2 = (message) ->
	  System.out.println(salutation + message);
		
	  greetService1.sayMessage("Vinayak");
	  greetService2.sayMessage("Suresh");
	}
		
   interface MathOperation {
      int operation(int a, int b);
   }
	
   interface GreetingService {
      void sayMessage(String message);
   }
	
   private int operate(int a, int b, MathOperation mathOperation) {
      return mathOperation.operation(a, b);
   }
}
