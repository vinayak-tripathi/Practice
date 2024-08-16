package com.iss.training.lambda;

import java.util.function.BiFunction;
import java.util.function.Function;

public class MethodRefernceDemo {
	public static void main(String[] args) {
		System.out.println(lowercase("Hello World!",String::toLowerCase));
		
		System.out.println(substring("Hello World!",5,String::substring));
		System.out.println(substring("Hello World!",5,(str,i)->str.substring(i)));
		
		int vt = 56;
		System.out.println(valueof(vt,String::valueOf));
		System.out.println(valueof(vt, number -> String.valueOf(number)));
		
		String prefix = "Mr.", name="Vinayak Tripathi";
		System.out.println(addPrefix(name, prefix::concat));
		System.out.println(addPrefix(prefix,(pre)-> pre.concat(name)));
	}


	private static String lowercase(String str, Function<String, String> processor) {
		return processor.apply(str);
	}
	
	private static String substring(String str,int i, BiFunction<String, Integer, String> processor) {
		return processor.apply(str,i);
	}
	
	private static String valueof(int i, Function<Integer, String> processor) {
		return processor.apply(i);
	}
	
	private static String addPrefix(String str, Function<String, String> processor) {
		return processor.apply(str);
	}
}
