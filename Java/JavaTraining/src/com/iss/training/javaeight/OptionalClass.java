package com.iss.training.javaeight;

import java.util.Optional;

public class OptionalClass {
	public static void main(String[] args) {
		OptionalClass optionalClass = new OptionalClass();
		Integer value1 = null;
		Integer value2 = 10;
		
		//Optional.ofNullable - allows passed parameter to be null.
	    Optional<Integer> a = Optional.ofNullable(value1);
			
	    //Optional.of - throws NullPointerException if passed parameter is null
	    Optional<Integer> b = Optional.of(value2);
	    System.out.println(optionalClass.sum(a,b));
	}

	private Integer sum(Optional<Integer> a, Optional<Integer> b) {
		// TODO Auto-generated method stub
		
		//Optional.isPresent - checks the value is present or not
		System.out.println("First Parameter is present: "+a.isPresent());
		System.out.println("Second Parameter is present: "+b.isPresent());
		
		//Optional.orElse - returns the value if present otherwise returns
	    //the default value passed.
		Integer value1 = a.orElse(new Integer(0));
		
		//Optional.get - gets the value, value should be present
		Integer value2 = b.get();
		
		return value1 + value2;
	}
}
