package com.iss.training.regex;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexExtractor {
	public static void main(String[] args) {
		Pattern emailPattern = Pattern.compile("[a-z0-9._]+@[a-z]+\\.[a-z]+\\.{0,1}[a-z]*");
		String text = "Please contact us at contact@tutorialspoint.com for further "
				+ "information.\nYou can also give feedbacl at vinayak.tripathi@spit.ac.in";
		Matcher emailMatcher = emailPattern.matcher(text);
		ArrayList<String> emailList = new ArrayList<>();
		while(emailMatcher.find()) {
			emailList.add(emailMatcher.group());
		}
		System.out.println(emailList);
		emailList.forEach(System.out::println);
		
	}
}
