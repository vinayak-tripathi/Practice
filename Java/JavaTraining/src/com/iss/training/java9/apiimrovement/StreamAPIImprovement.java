package com.iss.training.java9.apiimrovement;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;
import java.util.stream.IntStream;

class Person {

	public String name;
	public int age;

	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

}

public class StreamAPIImprovement {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Stream.of("Triangle", "Square", "Circle", ";", "Rectangle", ";").takeWhile(s -> !s.contains(";"))
				.forEach(System.out::println);

		List<Person> persons = Arrays.asList(new Person("Jenil", 20), new Person("Harsh", 33), new Person("Sahil", 42),
				new Person("Mahesh", 28), new Person("Jatin", 67));

		persons.stream().takeWhile(p -> p.age < 40).forEach(p -> System.out.println(p.name + " : " + p.age));
		IntStream.iterate(0, x -> x < 10, x -> x + 2).forEach(System.out::println);

		long intCount = Stream.ofNullable(100).count();
		System.out.println(intCount);

		long strCount = Stream.ofNullable("ISSGovernance").count();
		System.out.println(strCount);

		long nullCount = Stream.ofNullable(null).count();
		System.out.println(nullCount);
	}

}