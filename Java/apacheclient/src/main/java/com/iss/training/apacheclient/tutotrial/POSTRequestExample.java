package com.iss.training.apacheclient.tutotrial;

import java.util.Scanner;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

public class POSTRequestExample {
 
   public static void main(String args[]) throws Exception{
 
      //Creating a HttpClient object
      CloseableHttpClient httpclient = HttpClients.createDefault();

      //Creating a HttpGet object
      HttpPost httppost = new HttpPost("https://www.github.com/");

      //Printing the method used
      System.out.println("Request Type: "+httppost.getMethod());

      //Executing the Get request
      HttpResponse httpresponse = httpclient.execute(httppost);

      Scanner sc = new Scanner(httpresponse.getEntity().getContent());

      //Printing the status line
      System.out.println(httpresponse.getStatusLine());
      while(sc.hasNext()) {
         System.out.println(sc.nextLine());
      }
   }
}