package com.iss.training.lambda.methodreferences;

public class MethodReferenceThread {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Thread printThread = new Thread(()-> printMessage());
		//Above lambda implements the run abstract class for the runnable
		
		Thread printThread = new Thread(MethodReferenceThread::printMessage);
		printThread.start();

	}
	
	public static void printMessage() {
		System.out.println("Hello");
	}

}
