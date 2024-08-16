package com.iss.training.generics.bar;

public class Glass<T extends Liquid> {
	// Object is the Parent of all classes
	/*
	 * So one way to make it generic is set the type to Object But while retriving
	 * the value we will need typecasting
	 */
	// public Object liquid;
	/*
	 * Here we have bounded the T by Liquid type The Type argument can only be use
	 * if it has IS-A relationship or implements the Liquid type. Mulitple Bounded
	 * Types can be defined as below "public class Glass<T extends Fluid & Liquid "
	 * Remember First should be a class if it extends class then an interface
	 */
	public T liquid;

	public String getLiquidTaste() {
		return liquid.taste();
		/*
		 * This is due to the fact that every class That implements Liquid will have
		 * taste method And that can be accessed by the gnenerics
		 */
	}
}
/*
 * class WineGlass <T> extends Glass<T>{
 * 
 * This class will be subclass of the Glass only if the Type arguments are same
 * 
 * }
 */