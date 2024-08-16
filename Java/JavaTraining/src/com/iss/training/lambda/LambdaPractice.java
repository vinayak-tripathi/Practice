package com.iss.training.lambda;


import java.util.Arrays;
import java.util.Comparator;

public class LambdaPractice {
	public static void main(String[] args) {
		String[] names = {"Mr. Vinayak","Mr. Harry","Mr. Ron","Dr Zerom"};
		
//		Arrays.sort(names, new Comparator<String>() {
//			@Override
//			public int compare(String o1, String o2) {
//				// TODO Auto-generated method stub
//				return o1.split(" ")[1].compareTo(o2.split(" ")[1]);
//			}
//		});
		
//		Arrays.sort(names,Comparator.comparing(name -> name.split(" ")[1]));
		
		Arrays.sort(names, Comparator.comparing(LambdaPractice::firstname));
		System.out.println(Arrays.toString(names));
		
		
	}
	
	public static String firstname(String name) {
		return name.split(" ")[1];
	}
}
