package com.java.project.service;

import java.util.Optional;

import com.java.project.entity.OrderEntity;

public interface OrderService {
	OrderEntity updateOrder(Optional<OrderEntity> orderEntity);
	OrderEntity save(OrderEntity orderEntity);
}
