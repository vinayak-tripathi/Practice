package com.iss.training.apacheclient.tutotrial;

import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;

public class UserAuthenticationExample {
   
   public static void main(String args[]) throws Exception{
      
      //Create an object of credentialsProvider
      CredentialsProvider credentialsPovider = new BasicCredentialsProvider();

      HttpHost httpshost = new HttpHost("https://postman-echo.com");
      //Set the credentials
      AuthScope scope = new AuthScope(httpshost);
      
      Credentials credentials = new UsernamePasswordCredentials("postman", "password");
      credentialsPovider.setCredentials(scope,credentials);

      //Creating the HttpClientBuilder
      HttpClientBuilder clientbuilder = HttpClients.custom();

      //Setting the credentials
      clientbuilder = clientbuilder.setDefaultCredentialsProvider(credentialsPovider);

      //Building the CloseableHttpClient object
      CloseableHttpClient httpclient = clientbuilder.build();

      //Creating a HttpGet object
      HttpGet httpget = new HttpGet("https://postman-echo.com/basic-auth");

      //Printing the method used
      System.out.println(httpget.getMethod()); 

      //Executing the Get request
      HttpResponse httpresponse = httpclient.execute(httpget);

      //Printing the status line
      System.out.println(httpresponse.getStatusLine());
      int statusCode = httpresponse.getStatusLine().getStatusCode();
      System.out.println(statusCode);

      Header[] headers= httpresponse.getAllHeaders();
      for (int i = 0; i<headers.length;i++) {
         System.out.println(headers[i].getValue());
      }
   }
}
