package com.iss.training.java9;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class CollectionsExample {

	public static void main(String[] args) {
		
		System.out.println("Old way");
		collectionDeclarationOldWay();
		System.out.println("\nNew way");
		collectionDeclarationNewWay();
	}

	private static void collectionDeclarationNewWay() {
		Set<String> set = Set.of("A", "B", "C");
		System.out.println(set);
		
		List<String> list = List.of("A", "B", "C");
		System.out.println(list);
		
		Map<String, String> map = Map.of("A","Apple","B","Boy","C","Cat");
	    System.out.println(map);
	    
	    Map<String, String> map1 = Map.ofEntries (
	            new AbstractMap.SimpleEntry<>("A","Apple"),
	            new AbstractMap.SimpleEntry<>("B","Boy"),
	            new AbstractMap.SimpleEntry<>("C","Cat"));
	    System.out.println(map1);
		
	}

	private static void collectionDeclarationOldWay() {
		Set<String> set = new HashSet<>();
		set.add("A");
		set.add("B");
		set.add("C");
		set = Collections.unmodifiableSet(set);
		System.out.println(set);
		
		List<String> list = new ArrayList<>();
		list.add("A");
		list.add("B");
		list.add("C");
		list = Collections.unmodifiableList(list);
		System.out.println(list);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("A", "Apple");
		map.put("B", "Ball");
		map.put("C", "Cat");
		System.out.println(map);
	}

}
