package com.iss.training.multithreading;
/**
 * 
 */

/**
 * @author tripvin
 *
 */
class RunnableDemo implements Runnable{
	private Thread thread;
	private String threadName;
	
	RunnableDemo(String name){
		threadName = name;
		System.out.print("Creating"+ threadName);
	}
	
	public void run() {
		System.out.println("Running" + threadName);
	      try {
	         for(int i = 4; i > 0; i--) {
	            System.out.println("Thread: " + threadName + ", " + i);
	            // Let the thread sleep for a while.
	            Thread.sleep(50);
	         }
	      } catch (InterruptedException e) {
	         System.out.println("Thread " +  threadName + " interrupted.");
	      }
	      System.out.println("Thread " +  threadName + " exiting.");
	}
	
	public void start() {
		System.out.println("Starting"+ thread);
		if (thread==null) {
			thread = new Thread (this,threadName);
			thread.start();
		}
	}
}


public class ThreadRunnable {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RunnableDemo R1 = new RunnableDemo("Thread-1");
		R1.start();
		System.out.println("vt");
		
		RunnableDemo R2 = new RunnableDemo("Thread-2");
		R2.start();
		R1.start();
	}

}
