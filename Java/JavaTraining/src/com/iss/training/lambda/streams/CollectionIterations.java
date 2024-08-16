package com.iss.training.lambda.streams;

import java.util.Arrays;
import java.util.List;
import com.iss.training.lambda.person.Person;

public class CollectionIterations {
	public static void main(String[] args) {
		List<Person> people = Arrays.asList(
				new Person("Charles", "Patel", 60),
				new Person("Brij", "Trump", 23),
				new Person("Harry", "Chaube", 51),
				new Person("Rohan", "Carroll",45),
				new Person("Mathew", "Shinde", 39)
				);
		
		//External iterator
		for (Person person: people) {
			System.out.println(person);
		}
		System.out.println("---------------");
		//forEach takes Consumer interface
		//Internal iterator
		people.forEach(p->System.out.println(p));
		people.forEach(System.out::println);
		
	}
}
