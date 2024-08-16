package com.iss.training.regex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import netscape.javascript.JSObject;

import java.util.Scanner;

public class RegexFundamentals {
	public static void main(String[] args) {
		Pattern pattern = Pattern.compile("https:", Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher("https://www.google.com/");
		boolean matchFound = matcher.find();
		if (matchFound) {
			System.out.println("Match found");
		}
		else {
			System.out.println("Not Found");
		}
		
		Scanner sc=new Scanner(System.in);
		while (true) {
			System.out.print("Enter Email to check validity: ");
			String inputString = sc.nextLine();
			System.out.println(inputString);
			if (inputString.equals("-1")) {
				break;
			}
			boolean emailValid = Pattern.matches("^[a-z0-9._]+@[a-z]+\\.[a-z]+\\.{0,1}[a-z]*$", inputString);
			System.out.println("Is Valid email:"+emailValid);
		}
		
		sc.close();
	}
}
