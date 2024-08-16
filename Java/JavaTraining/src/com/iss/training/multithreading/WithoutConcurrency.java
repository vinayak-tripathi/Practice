package com.iss.training.multithreading;

public class WithoutConcurrency extends Thread{
	public static int amount = 0;
	
	public static void main(String[] args) {
		WithoutConcurrency thread = new WithoutConcurrency();
		thread.start();
		System.out.println(amount);
	    amount++;
	    System.out.println(amount);
	}
	
	public void run() {
		amount++;
	}
}
