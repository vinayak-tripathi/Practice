package com.iss.training.json;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ObjectMapperExample {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		ObjectMapper objectMapper = new ObjectMapper();
		String carJson = "{\"brand\": \"Mercedes\",\"doors\": 5}";
		System.out.println(carJson);
		Car car = objectMapper.readValue(carJson, Car.class);
		System.out.println(car);
		
		URL url = new URL("file:///C:/Users/tripvin/Desktop/Training/Java/json/src/main/java/com/iss/training/json/carfile.json");
		Car car2 = objectMapper.readValue(url, Car.class);
		System.out.println("URL:" +car2);
		
		String jsonArray = "[{\"brand\":\"ford\"}, {\"brand\":\"Fiat\"}]";

		Car[] cars1 = objectMapper.readValue(jsonArray, Car[].class);
		System.out.println(cars1.length);
		
		File file = new File("C:\\Users\\tripvin\\Desktop\\Training\\Java\\json\\src\\main\\java\\com\\iss\\training\\json\\carfile.json");
		
		car = objectMapper.readValue(file, Car.class);
		
		System.out.println(car);
		List<Car> cars2 = objectMapper.readValue(jsonArray, new TypeReference<List<Car>>() {
		});
		
		System.out.println(cars2);
	}

}

class Car {
	private String brand = null;
	private int doors = 0;

	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getDoors() {
		return this.doors;
	}

	public void setDoors(int doors) {
		this.doors = doors;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return brand + "   " + doors;
	}
}
