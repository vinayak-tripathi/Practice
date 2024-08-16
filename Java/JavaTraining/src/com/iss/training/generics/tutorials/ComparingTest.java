package com.iss.training.generics.tutorials;

public class ComparingTest {
	public static <T extends Comparable<T>> T maximum(T x, T y, T z) {
		T max = x;
		if (y.compareTo(max) > 0) {
			max = y;
		}
		if (z.compareTo(max)>0) {
			 max = z;
		}
		
		return max;
	}
	
	public static void main(String args[]) {
		System.out.printf(" Max of %d, %d, %d is %d",3,4,5,maximum(3, 4, 5));
		System.out.println();
		System.out.printf(" Max of %.1f, %.1f, %.1f is %.1f",3.12,4.12,1.123,maximum(3.12, 4.12, 1.123));
		
	}
}
