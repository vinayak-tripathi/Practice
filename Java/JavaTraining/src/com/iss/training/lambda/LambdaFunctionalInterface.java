package com.iss.training.lambda;

import java.util.function.Function;

public class LambdaFunctionalInterface {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		  System.out.println("Without using Lambda: "+process("Vinayak Tripathi",new Processor() { 
			  public String process(String str) { 
				  return str.toUpperCase(); 
			  }
		  }));
		
		System.out.println(process("Vinayak Tripathi",(String str)->{
			return str.toUpperCase();
		}));
		
		System.out.println(process("Vinayak Tripathi",str-> str.toUpperCase()));
		
		System.out.println(processFunction("Vinayak Tripathi", str->str.toUpperCase()));
		// To run this there is no need of Functional Interface since we are using default 
	}
	
	private static String process(String str, Processor processor) {
		return processor.process(str);
	}
	
	private static String processFunction(String str, Function<String, String> processor) {
		return processor.apply(str);
	}
}

@FunctionalInterface
interface Processor{
	/*
	 * An interface with single function is called functional interface
	*/
	String process(String str);
}
