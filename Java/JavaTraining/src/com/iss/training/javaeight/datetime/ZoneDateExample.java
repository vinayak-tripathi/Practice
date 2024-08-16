package com.iss.training.javaeight.datetime;

import java.time.ZoneId;
import java.time.ZonedDateTime;

public class ZoneDateExample {

	public static void main(String[] args) {
		testZonedDateTime();
	}
	
	public static void testZonedDateTime() {
	      // Get the current date and time
	      ZonedDateTime zoneDate = ZonedDateTime.parse("2007-12-03T10:15:30+05:30[Asia/Calcutta]");
	      System.out.println("date1: " + zoneDate);
			
	      ZoneId id = ZoneId.of("Europe/Paris");
	      System.out.println("Example ZoneId: " + id);
			
	      ZoneId currentZone = ZoneId.systemDefault();
	      System.out.println("CurrentZone: " + currentZone);
	   }
}
