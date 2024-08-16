package com.iss.training.java11;

import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.io.IOException;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URI;

public class LocalVariableExample {

	public static void main(String[] args) throws IOException, InterruptedException {
		// TODO Auto-generated method stub
		String text = "Hello World";
		var textJava11 = "Hello java 11";
		textJava11 = "Hello Java Reassigning";
		//textJava11 = 45; // Incompatible types
		/*
		 * var a; var nothing = null; 
		 * var lambda =()-> System.out.println("Pity!"); 
		 * var method =this::someMethod;
		 */
		var myMap = new HashMap<String, List<Integer>>();
		myMap.put("A",List.of(1, 2, 3));
		myMap.put("B",List.of(4, 5, 6));
		myMap.put("C",List.of(7, 8, 9));
		System.out.println(myMap);
		
		for(var current : myMap.entrySet()){
			// current is infered to type: Map<String, List<Integer>>    
			System.out.println(current);
		}
		
		/*
		 * Response get and send done
		*/
		var request = HttpRequest.newBuilder()
				.uri(URI.create("http://localhost:8081/users/e573f27b-9cb8-48b8-a7f6-fd44da376a96"))
				.header("Accept","application/json")
				.GET()
				.build();
		var client = HttpClient.newHttpClient();
		HttpResponse<String> response = client.send(request,HttpResponse.BodyHandlers.ofString());
		System.out.println(response.body());
//		System.out.println(response.body())
		
		/*
		 * Authentication Done
		*/
		var requestAuth = HttpRequest.newBuilder()
				.uri(URI.create("https://postman-echo.com/basic-auth"))
				.build();
		var clientAuth = HttpClient.newBuilder()
				.authenticator(new Authenticator(){
					@Override
					protected PasswordAuthentication getPasswordAuthentication(){
						return new PasswordAuthentication("postman","password".toCharArray());
						}
					})
				.build();
		var responseAuth = clientAuth.send(requestAuth, HttpResponse.BodyHandlers.ofString());
		System.out.println(responseAuth.statusCode());
		System.out.println(responseAuth.body());
		var listImmutable = List.of("A","B","C");
		var copy = List.copyOf(listImmutable); //Creates immutable copy of list
		System.out.println(listImmutable==copy); //true
		// same instanc
		
		
		var listMutable =new ArrayList<String>();
		var copy2 = List.copyOf(listMutable);
		System.out.println(listMutable == copy);// false
		
		useStreamImprovements();
		useOptionalsImprovements();
		useStringImprovements();
	}

	private static void useStringImprovements() {
		var blank = " ".isBlank();
		var strip = "  Foo    Bar    	".strip();
		var stripTrails = "  Foo    Bar    	".stripTrailing();
		var stripLeads = "  Foo    Bar    	".stripLeading();
		var repeateString = "java".repeat(2);
		var lineCount = "A\nB\nC".lines().count();
		
		System.out.println(blank);
		System.out.println(strip);
		System.out.println(stripTrails);
		System.out.println(stripLeads);
		System.out.println(repeateString);
		System.out.println(lineCount);
	}

	private static void useOptionalsImprovements() {
		var vt = Optional.of("foo").orElseThrow();// foo
		var optionalStream = Optional.of("foo").stream().collect(Collectors.toList());// 1
		var value = Optional.ofNullable(null)
			.or(()-> Optional.of("fallback"))
			.get();
		
		System.out.println("password".toCharArray());
		System.out.println(vt);
		System.out.println(optionalStream);
		System.out.println(value);
		
	}

	private static void useStreamImprovements() {
		Stream.ofNullable(null).count();
		
		var conditonedStream = Stream.of(1,2,3,4,5,6,7,8).dropWhile(n->n<3).collect(Collectors.toList());
		System.out.println(conditonedStream);
		
		var conditonedStream2 = Stream.of(1,2,3,4,5,6,7,8).takeWhile(n->n<3).collect(Collectors.toList());
		System.out.println(conditonedStream2);
	}

}
