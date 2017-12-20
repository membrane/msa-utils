package com.msa;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.msa.service.KafkaSender;
import org.springframework.context.annotation.Bean;

import javax.annotation.PostConstruct;
import java.util.UUID;
import java.util.HashMap;

@SpringBootApplication
public class Application {

	@Autowired
	KafkaSender ks;

	@Autowired
	ObjectMapper mapper;

	/*
	{
		"action": "create",
			"bo": "article",
			"object": {
				"uuid": "cab08236-1924-4f90-975d-9e056ed14c48",
				"name": "Apples",
				"price": 1.99,
				"quantity": 1000
	}
	}
	*/

	public static void main(String[] args) {
		SpringApplication.run(new Object[] { Application.class }, args);
	}

	@PostConstruct
	public void rndGenArticle(){
		long start = System.nanoTime();
		HashMap<String, Object> article = new HashMap<>();
		HashMap<String, String> obj = new HashMap<>();
		article.put("action", "create");
		article.put("bo", "article");
		article.put("object", obj);
		obj.put("price", "1.99");
		obj.put("quantity", "1000");

		for (int i = 0; i < 1000000; i++){
			obj.put("uuid", UUID.randomUUID().toString());
			obj.put("name", "Apples " + i);

			try {
				String data = mapper.writeValueAsString(article);
				ks.send(data);
				// System.out.println("data = " + data);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		long end = System.nanoTime();
		System.out.println("time =" + ((end - start) / 1000000000));
	}
}