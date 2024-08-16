package com.iss.training.json;

import java.io.IOException;
import java.util.Iterator;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;

public class JsonNodeExample {
	public static void main(String[] args) {
		String carJson = "{ \"brand\" : \"Mercedes\", \"doors\" : 5," + "  \"owners\" : [\"John\", \"Jack\", \"Jill\"],"
				+ "  \"nestedObject\" : { \"field\" : \"value\" } }";

		ObjectMapper objectMapper = new ObjectMapper();

		try {

			JsonNode jsonNode = objectMapper.readValue(carJson, JsonNode.class);
			System.out.println(jsonNode);
			JsonNode brandNode = jsonNode.get("brand");
			String brand = brandNode.asText();
			System.out.println("brand = " + brand);

			JsonNode doorsNode = jsonNode.get("doors");
			int doors = doorsNode.asInt();
			System.out.println("doors = " + doors);

			JsonNode array = jsonNode.get("owners");
			JsonNode johnJson = array.get(0);
			String john = johnJson.asText();
			System.out.println("john  = " + john);

			JsonNode child = jsonNode.get("nestedObject");
			JsonNode childField = child.get("field");
			String field = childField.asText();
			System.out.println("field = " + field);
			traverse(jsonNode);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void traverse(JsonNode root){
	    System.out.println("vt---->"+root.getNodeType());
	    if(root.isObject()){
	        Iterator<String> fieldNames = root.fieldNames();

	        while(fieldNames.hasNext()) {
	            String fieldName = fieldNames.next();
	            JsonNode fieldValue = root.get(fieldName);
	            System.out.println(fieldName+fieldValue);
	            traverse(fieldValue);
	        }
	    } else if(root.isArray()){
	        ArrayNode arrayNode = (ArrayNode) root;
	        for(int i = 0; i < arrayNode.size(); i++) {
	            JsonNode arrayElement = arrayNode.get(i);
	            traverse(arrayElement);
	        }
	    } else {
	        // JsonNode root represents a single value field - do something with it.
	        System.out.println(root+"  "+root);
	        
	    }
	}
}
