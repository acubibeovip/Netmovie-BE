package com.java.project.entity;

import java.util.Date;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "table_order")
public class OrderEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_order;
	
	@Column(name = "order_date")
	private Date order_date;
	
	@Column(name = "status")
	private int status;
	
	@Column(name = "total_price")
	private float total_price;
	
	@Column(name = "update_order")
	private Date update_order;
	
	@Column(name = "modify_order")
	private Date modify_order;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_user" , nullable = false)
	private UserEntity user;
	
}
