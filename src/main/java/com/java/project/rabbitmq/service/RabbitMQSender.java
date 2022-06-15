package com.java.project.rabbitmq.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.java.project.entity.CategoriesEntity;
import com.java.project.entity.ProductsEntity;

@Service
public class RabbitMQSender {
	
	@Autowired
	private AmqpTemplate amqpTemplate;
	
	@Value("${movienet.rabbitmq.queue}")
	private String queueName;
	
	@Value("${movienet.rabbitmq.exchange}")
	private String exchange;
	
	@Value("${movienet.rabbitmq.routingkey}")
	private String routingKey;
	
//	find all
	public void sendFindByAll(Map<String,List> list) {
		amqpTemplate.convertAndSend(exchange, routingKey, list );
	}
	
//	find by id
	public <T> void sendFindById(Map<String,Optional<T>> element) {
		amqpTemplate.convertAndSend(exchange,routingKey,element);
	}
	
//	find by name
	public void sendFindByName(Map<String,List> element) {
		amqpTemplate.convertAndSend(exchange,routingKey,element);
	}
	
}
