package com.iss.training.lambda.person;

public class Person{
	private String firstName;
	private String lastName;
	private int age;
	
	public Person(String firstName, String lastName, int age){
		this.firstName = firstName;
		this.lastName = lastName;
		this.age = age;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Person[Name="+firstName+" "+lastName+", Age="+age+"]";
	}

	public int compareTo(Person o) {
		// TODO Auto-generated method stub
		return this.firstName.compareTo(o.getFirstName());
	}

//	@Override
//	public int compareTo(Object o) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
}
