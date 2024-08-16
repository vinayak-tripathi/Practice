package com.iss.training.javaeight.datetime;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class ChronoUnitsEnum {

	public static void main(String[] args) {
		testChromoUnits();

	}
	
	public static void testChromoUnits() {
		LocalDate today = LocalDate.now();
		System.out.println("Current Date: "+today);
		
		//add 1 week to the current date
		LocalDate nextWeek = today.plus(1, ChronoUnit.WEEKS);
		System.out.println("Next Week: "+nextWeek);
		
		//add 1 month to the current date
		LocalDate nextMonth = today.plus(1, ChronoUnit.MONTHS);
		System.out.println("Next Month: "+nextMonth);
		
		//add 1 year to the current date
		LocalDate nextYear = today.plus(1,ChronoUnit.YEARS);
		System.out.println("Next Year: "+nextYear);
		
	}

}
