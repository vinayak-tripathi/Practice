package com.iss.training.multithreading;

public class WithConcurrency extends Thread{
	public static int amount = 0;
	
	public static void main(String[] args) {
		WithConcurrency thread = new WithConcurrency();
		thread.start();
		while(thread.isAlive()) {
			System.out.println("Waiting...");
		}
		System.out.println(amount);
		amount++;
		System.out.println(amount);
	}
	
	public void run() {
		amount++;
	}
}
