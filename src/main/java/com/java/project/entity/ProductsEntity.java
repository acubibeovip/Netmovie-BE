package com.java.project.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "table_products")
public class ProductsEntity implements Serializable  {
	
	//private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_product;
	
	@Column(name = "name_product")
	private String name_product;
	
	@Column(name = "status_product")
	private int status_product;
	
	@Column(name = "update_product")
	private Date update_product;
	
	@Column(name = "modify_product")
	private Date modify_product;
	
	@Column(name = "description_product")
	private String description_product;
}
