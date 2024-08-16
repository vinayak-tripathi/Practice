package com.iss.training.generics.bar;

public class Bartender {
	/*This is the class with generic method*/
	public <J,W> Cocktail mix(J juice, W water) {
		// return type Cockail
		/* System.out.println("VT"); */
		return new Cocktail();
	}
	
	public <J,W> void mix2(J juice, W water) {
		// void return type but generic for two different types
	}
	
	public static <J,W> void mix3(J juice, W water) {
		
	}
	
	public static void main(String[] args) {
		Bartender bartender = new Bartender();
		Juice juice  = new Juice();
		Water water = new Water();
		Cocktail cocktail = bartender.<Juice, Water>mix(juice, water);
		Glass<Cocktail> cocktailGlass = new Glass<Cocktail>();
		cocktailGlass.liquid = cocktail;
	}

}