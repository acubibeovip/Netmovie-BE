package com.java.project.entity;

import java.sql.Date;

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
@Table(name = "table_coin")
public class CoinEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_coin;
	
	@Column(name = "amount")
	private float amount;
	
	@Column(name = "status")
	private int status;
	
	@Column(name = "update_coin")
	private Date update_coin;
	
	@Column(name = "modify_coin")
	private Date modify_coin;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_user" , nullable = false)
	private UserEntity user;
}
