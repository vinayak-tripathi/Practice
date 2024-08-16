package com.iss.training.generics.bar;

public class BarOperations {
	public static void main(String[] args) {
		Glass<Juice> glass = new Glass<Juice>();
		Juice juice = new Juice();
		glass.liquid = juice;
		
		// retrieve
		//Juice j = (Juice) g.liquid; //If g.liquid would have been Object type
		Juice j = glass.liquid;
		
		Glass<Water> waterGlass = new Glass<Water>();
		waterGlass.liquid = new Water();
		Water water  = waterGlass.liquid;
		
		//invoking generics methods
		Bartender bartender = new Bartender();
		
		Cocktail cocktail = bartender.<Juice, Water>mix(juice, water);
		Glass<Cocktail> cocktailGlass = new Glass<Cocktail>();
		cocktailGlass.liquid = cocktail;
		
		Cake cake = new Cake();
		//***Below line will throw error as Cake is not Liquid(NO is a relationship)
		//Glass<Cake> cakeGlass = new Glass<Cake>();
		/*
		 * To limit the types of values that can be
		 * passed in generic we can use bounded types
		*/
	}
}

