package com.iss.training.lambda;

import java.util.ArrayList;
import java.util.function.Consumer;

public class LambdaGFG {
	public static void main(String[] args) {
		ArrayList<Integer> numbers = new ArrayList<Integer>();
		numbers.add(31);
		numbers.add(12);
		numbers.add(1);
		numbers.forEach( n-> System.out.println(n));
		/*
		 * Lambda expressions can be stored in variables if the 
		 * variable's type is an interface which has only one method
		*/
		
		Consumer<Integer> method = n -> System.out.println(n);
		numbers.forEach(method);
		
		StringFunction exclaim = s->s+"!";
		StringFunction ask = s->s+"?";
		
		System.out.println(process("Hello",exclaim));
		System.out.println(process("Hello",ask));
		
	}
	
	private static String process(String str, StringFunction func) {
		return func.run(str);
	}
}

interface StringFunction{
	String run(String str);
}
