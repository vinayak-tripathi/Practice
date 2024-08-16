package com.iss.training.multithreading;
/**
 * 
 */

/**
 * @author tripvin
 *
 */
public class GuessANumber extends Thread {
	private int number;
	public GuessANumber(int number) {
		this.number = number;
	}
	
	public void run() {
		int counter = 0;
		int guess = 0;
		do {
			guess = (int) (Math.random()*100+1);
			System.out.print(this.getName()+ " guesses "+ guess);
			counter++;
		} while(guess != number);
		System.out.println("** Correct "+this.getName()+"in"+counter +"guessess.**");
	}
}
