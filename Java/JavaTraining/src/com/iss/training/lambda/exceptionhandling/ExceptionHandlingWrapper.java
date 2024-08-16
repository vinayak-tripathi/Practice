package com.iss.training.lambda.exceptionhandling;

import java.util.function.BiConsumer;

public class ExceptionHandlingWrapper {	
	public static void main(String[] args) {
		int[] numbers = {1,4,5,6,7};
		int key = 0;
		
		process(numbers,key, wrapperLambda((value,ke)-> System.out.println(value/ke)));
	}

	private static BiConsumer<Integer, Integer> wrapperLambda(BiConsumer<Integer, Integer> consumer) {
		// TODO Auto-generated method stub
		return (value,key)->{
			try {
				consumer.accept(value, key);
			}
			catch (ArithmeticException e) {
				System.out.println("Exception caught in wrapper lambda");
			}
		};
	}

	private static void process(int[] numbers, int key, BiConsumer<Integer, Integer> operation) {
		// TODO Auto-generated method stub
		for(int n: numbers) {
			operation.accept(n, key);
		}
	}
}
