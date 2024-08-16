package com.iss.training.lambda;

public class RunnableExample {
	public static void main(String[] args) {
		Thread myThread = new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				System.out.println("Printed inside Runnable");
			}
			
		});
		
		Thread myThreadLambda = new Thread(()->System.out.println("Lambda Runnable"));
		
		myThread.run();
		myThreadLambda.run();
	}
}
