package com.iss.training.apacheclient.tutotrial.interceptor;

import java.io.IOException;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HttpContext;

public class InterceptorsExample {
 
   public static void main(String args[]) throws Exception{
      
      //Creating an HttpRequestInterceptor
      HttpRequestInterceptor requestInterceptor = new HttpRequestInterceptor() {
         @Override
         public void process(HttpRequest request, HttpContext context) throws
         HttpException, IOException {
            if(request.containsHeader("sample-header")) {
               System.out.println("Contains header sample-header, removing it..");
               request.removeHeaders("sample-header"); 
            }
            //Printing remaining list of headers
            Header[] headers= request.getAllHeaders();
            for (int i = 0; i<headers.length;i++) {
               System.out.println(headers[i].getName());
            }
         }
      };

      //Creating a CloseableHttpClient object
      CloseableHttpClient httpclient =
      HttpClients.custom().addInterceptorFirst(requestInterceptor).build();

      //Creating a request object
      HttpGet httpget1 = new HttpGet("https://www.tutorialspoint.com/");

      //Setting the header to it
      httpget1.setHeader(new BasicHeader("sample-header","My first header"));
      httpget1.setHeader(new BasicHeader("demo-header","My second header"));
      httpget1.setHeader(new BasicHeader("test-header","My third header"));

      //Executing the request
      HttpResponse httpresponse = httpclient.execute(httpget1);

      //Printing the status line
      System.out.println(httpresponse.getStatusLine());
   }
}
