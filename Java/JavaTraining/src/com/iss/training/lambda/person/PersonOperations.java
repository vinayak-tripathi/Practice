package com.iss.training.lambda.person;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.Collections;

public class PersonOperations {
	public static void main(String[] args) {
		List<Person> people = Arrays.asList(
				new Person("Charles", "Patel", 60),
				new Person("Brij", "Trump", 23),
				new Person("Harry", "Chaube", 51),
				new Person("Rohan", "Carroll",45),
				new Person("Mathew", "Shinde", 39)
				);
		
		// Sorting the people based on the lastname
//		Collections.sort(people,new Comparator<Person>() {
//
//			@Override
//			public int compare(Person o1, Person o2) {
//				// TODO Auto-generated method stub
//				return o1.getLastName().compareTo(o2.getLastName());
//			}
//			
//		});
		
		Collections.sort(people,(p1, p2)->p1.getLastName().compareTo(p2.getLastName()));

		System.out.println(people);
		
		// Print all people that have last name
//		printConditionally(people,new Condition() {
//
//			@Override
//			public boolean test(Person p) {
//				// TODO Auto-generated method stub
//				return p.getLastName().startsWith("C");
//			}
//			
//		});
		
		printConditionally(people, p->p.getLastName().startsWith("C"));
		
		performConditionally(people, p->p.getLastName().startsWith("C"),p->System.out.println(p));
		
	}

	private static void printConditionally(List<Person> people, Condition condition) {
		// TODO Auto-generated method stub
		for(Person p: people) {
			if (condition.test(p)){
				System.out.println(p);
			}
		}
	}
	
	private static void performConditionally(List<Person> people, Predicate<Person> condition, Consumer<Person> func) {
		// TODO Auto-generated method stub
		for(Person p: people) {
			if (condition.test(p)){
				func.accept(p);
			}
		}
	}
	
	
}

@FunctionalInterface
interface Condition {
	boolean test(Person p);
}
