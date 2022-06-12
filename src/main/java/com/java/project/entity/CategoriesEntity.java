package com.java.project.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "table_categories")
public class CategoriesEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_categories;
	
	@Column(name = "name_categories")
	private String name_categories;
	
	@Column(name = "status_categories")
	private int status_categories;
	
	@Column(name = "update_categories")
	private Date update_categories;
	
	@Column(name = "modify_categories")
	private Date modify_categories;
}
