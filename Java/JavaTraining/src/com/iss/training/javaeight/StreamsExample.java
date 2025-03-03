package com.iss.training.javaeight;

import java.util.Arrays;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class StreamsExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> strings = Arrays.asList("abc", "", "bc", "efg", "abcd","", "jkl");
		List<String> filtered = strings.stream().filter(string -> !string.isEmpty()).collect(Collectors.toList());
		System.out.println(filtered);
		
		Random randomGenerator = new Random();
		System.out.println("Random Integer Stream without sort");
		randomGenerator.ints(10,0,100).forEach(System.out::println);
		System.out.println("\nRandom Integer Stream with sort");
		IntStream randomInts = randomGenerator.ints(10,0,100);
		//randomInts.forEach(System.out::println);
		randomInts.sorted().forEach(System.out::println);;
		
		System.out.println("Filtered List: " + filtered);
		String mergedString = strings.stream().filter(string -> !string.isEmpty()).collect(Collectors.joining(", "));
		System.out.println("Merged String: " + mergedString);
		
		List<Integer> numbers = Arrays.asList(3, 2, 2, 3, 7, 3, 5);

//		@SuppressWarnings("unchecked")
		IntSummaryStatistics stats = numbers.stream().mapToInt((x) -> x).summaryStatistics();
		System.out.println(stats);
		System.out.println("Highest number in List : " + stats.getMax());
		System.out.println("Lowest number in List : " + stats.getMin());
		System.out.println("Sum of all numbers : " + stats.getSum());
		System.out.println("Average of all numbers : " + stats.getAverage());
	}

}
