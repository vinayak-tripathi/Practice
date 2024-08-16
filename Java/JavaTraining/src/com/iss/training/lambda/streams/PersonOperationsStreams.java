package com.iss.training.lambda.streams;

import java.util.Arrays;
import java.util.List;

import com.iss.training.lambda.person.Person;

public class PersonOperationsStreams {
	
	public static void main(String[] args) {
		List<Person> people = Arrays.asList(
				new Person("Charles", "Patel", 60),
				new Person("Brij", "Trump", 23),
				new Person("Harry", "Chaube", 51),
				new Person("Rohan", "Carroll",45),
				new Person("Mathew", "Shinde", 39)
				);
		
		people.stream()
		.filter(p->p.getLastName().startsWith("C"))
		.forEach(System.out::println);
		/*
		 * For each stream we have three parts
		 * Source Collection object on which stram is called
		 * Any operation filtering or any thing that is done on Stream
		 * Terminal Operation
		*/
		
		long count = people.stream()
				.filter(p->p.getLastName().startsWith("C"))
				.count();
		
		System.out.println(count);
		
		long count1 = people.parallelStream()
				.filter(p->p.getLastName().startsWith("C"))
				.count();
		
		System.out.println(count1);
		
	}
	
}