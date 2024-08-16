package com.iss.training.assignment;

import java.util.HashMap;

class Student
{
    int id;
    String name;
    
    public Student(int id, String name) {
        this.id = id;
        this.name = name;
        
    }
    //overriding hashcode where we return hashcode as addition of id and name
    @Override
    public int hashCode() {
        Integer idInteger = this.id;
        return (idInteger.hashCode() + name.hashCode());
    }
    //overriding equals which checks that current hashcode and hashcode of Student objects are same or not
    @Override
    public boolean equals(Object stud) {
        return this.hashCode() == stud.hashCode();
    }

 

    
}
class StudentDetail
{
    String address;
    String phone;
    
    public StudentDetail(String address, String phone) {
        this.address = address;
        this.phone = phone;
    }
    
    @Override
    public String toString() {
        return (this.address + " " + this.phone);
    }
    
}
class Functionality {
    
    public static void viewStudentDetail(HashMap<Student, StudentDetail> studs) {
        
        Student stud1 = new Student(1, "Jiten");
        Student stud5 = new Student(5, "Jiten");
        System.out.println(studs.get(stud1));//the reference of stud1 is different here so it will not be able to access the values in dictionaries
        System.out.println(studs.get(stud5));//now we can access as we are checking for hashcodes and 
    }
    
}

 

public class Assignment {
    public static void main(String[] args) {
        
        HashMap<Student, StudentDetail> StudentDetail = new HashMap<>();
        Student stud1 = new Student(1, "Jiten"); 
        Student stud2 = new Student(2, "Jenil");
        Student stud3 = new Student(3, "Nicky");
        Student stud4 = new Student(4, "Sahil");
        Student stud5 = new Student(5, "Jiten");
        
        StudentDetail sd1 = new StudentDetail("a", "1");
        StudentDetail sd2 = new StudentDetail("b", "2");
        StudentDetail sd3 = new StudentDetail("c", "3");
        StudentDetail sd4 = new StudentDetail("d", "4");
        StudentDetail sd5 = new StudentDetail("d", "4");
        
        StudentDetail.put(stud1, sd1);
        StudentDetail.put(stud2, sd2);
        StudentDetail.put(stud3, sd3);
        StudentDetail.put(stud4, sd4);
        StudentDetail.put(stud5, sd5);
        System.out.println(StudentDetail.size());
        Functionality.viewStudentDetail(StudentDetail);
        
    }
}
 