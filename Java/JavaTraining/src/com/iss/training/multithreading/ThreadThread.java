package com.iss.training.multithreading;
/**
 * 
 */

/**
 * @author tripvin
 *
 */

class ThreadDemo extends Thread {
   private Thread thread;
   private String threadName;
   
   ThreadDemo( String name) {
      threadName = name;
      System.out.println("Creating " +  threadName );
   }
   
   public void run() {
      System.out.println("Running " +  threadName );
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
   
   public void start () {
      System.out.println("Starting " +  threadName );
      if (thread == null) {
         thread = new Thread (this, threadName);
         thread.start ();
      }
   }
}

public class ThreadThread {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadDemo firstThread = new ThreadDemo( "Thread-1");
		firstThread.start();
		ThreadDemo secondThread = new ThreadDemo( "Thread-2");
		secondThread.start();
	}

}
