package com.java.project.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.project.entity.OrderEntity;
import com.java.project.repository.OrderRepository;
import com.java.project.service.OrderService;
import com.java.project.service.ShareService;

@Service
public class OrderServiceImpl extends ShareService implements OrderService {

	@Autowired
	private OrderRepository orderRepo;
	
	@Override
	public OrderEntity updateOrder(Optional<OrderEntity> orderEntity) {
		return orderRepo.save(orderEntity.get());
	}

	@Override
	public OrderEntity save(OrderEntity orderEntity) {
		return orderRepo.save(orderEntity);
	}

	@Override
	public List<OrderEntity> findAll() {
		return orderRepo.findAll();
	}

	@Override
	public <T> List<T> findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<OrderEntity> findById(Long id) {
		return orderRepo.findById(id);
	}

	@Override
	public void deleteById(Long id) {
		// TODO Auto-generated method stub
		
	}

}
