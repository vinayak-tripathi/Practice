package com.iss.training.java9;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

public class TryWithResourceExample {
	public static void main(String[] args) throws IOException {
		System.out.println(readData("test"));
		System.out.println(readDataTrywithResource("test"));
	}

	static String readData(String message) throws IOException {
		Reader inputString = new StringReader(message);
		BufferedReader br = new BufferedReader(inputString);
		try (BufferedReader br1 = br) {
			return br1.readLine();
		}
	}

	static String readDataTrywithResource(String message) throws IOException {
		Reader inputString = new StringReader(message);
		BufferedReader br = new BufferedReader(inputString);
		try (br) {
			return br.readLine();
		}
	}
}
