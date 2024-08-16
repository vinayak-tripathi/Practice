package com.iss.training.generics.bar;

public class Tray {
	/*
	 * This is the add method with unbounded wildcard ?
	*/
	public void add(Glass<? extends Juice> juiceGlass) {
		/*
		 * Upper Bounded Wildcards as 
		 * if you want only to add Juice types(sub types of Juice) as type argument in gengerics
		 * Then you have to extend Juice
		 * This will not allow Liquid to be passed as Type argement 
		 * Because Liquid is on Upper level than Juice
		 */
	}
	
	public void add_liquids(Glass<? super Juice> juiceGlass) {
		/*
		 * Lower Bounded Wildcards as 
		 * if you want only to add Till Juice types as type argument in gengerics
		 * Then you have to super Juice
		 * Any type of super type in Juice heirachy can be used as type argument
		 * But if Gasoline is passed then it is not Allowed since it is different from Juice heirarchy
		 */
	}
}

