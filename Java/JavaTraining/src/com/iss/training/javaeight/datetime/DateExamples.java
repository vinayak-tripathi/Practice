package com.iss.training.javaeight.datetime;

import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Month;
import java.time.Period;
import java.time.temporal.ChronoUnit;

public class DateExamples {

	public static void main(String[] args) {
		testLoaclDatetime();
		testPeriod();
		testDuration();
	}

	private static void testLoaclDatetime() {
		LocalDateTime currentTime = LocalDateTime.now();
		
		System.out.println("Currently it's : "+currentTime.toLocalTime().truncatedTo(ChronoUnit.SECONDS));
		LocalDate todayDate = currentTime.toLocalDate();
		
		System.out.println("Today's date: "+todayDate);
		
		Month month = todayDate.getMonth();
		DayOfWeek dayName = todayDate.getDayOfWeek();
		int day = todayDate.getDayOfMonth();
		int year = todayDate.getYear();
		System.out.println("Month: " + month +"; dayName: " + dayName +"; day: " + day +"; year: " + year);
		// parse previous dates as Local Dates
        LocalDate thatDay = LocalDate.of(2010, Month.FEBRUARY, 20);      
        System.out.println("thatDay: "+thatDay);
        
        LocalTime thatTime = LocalTime.of(22, 15);
        System.out.println("thatTime: "+thatTime);
        
        LocalTime timeString = LocalTime.parse("20:30:40");
        System.out.print("Parsed Time is: ");
        System.out.println(timeString.getHour()+"HRS:"+timeString.getMinute()+"MNS:"+timeString.getSecond()+"SECS");
        /*
		LocalDate dateString = LocalDate.parse("21-12-2020");
		System.out.print("Parsed Date is: ");
		System.out.println(dateString.getYear()+"yr::"+dateString.getMonth()+"MNS::"+"DY");
		*/
	}
	
	private static void testPeriod() {
	      //Get the current date
	      LocalDate dateToday = LocalDate.now();
	      System.out.println("Current date: " + dateToday);
			
	      //add 1 month to the current date
	      LocalDate dateNextMonth = dateToday.plus(1, ChronoUnit.MONTHS);
	      System.out.println("Next month: " + dateNextMonth);
	      
	      Period period = Period.between(dateNextMonth, dateToday);
	      System.out.println("Period: " + period);
	 }
		
	 private static void testDuration() {
	    LocalTime timeNow = LocalTime.now();
	    Duration twoHours = Duration.ofHours(2);
			
	    LocalTime timeThen = timeNow.plus(twoHours);
	    Duration duration = Duration.between(timeNow, timeThen);
			
	    System.out.println("Duration: " + duration);
	 }
}
