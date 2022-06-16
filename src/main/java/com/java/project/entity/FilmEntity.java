package com.java.project.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@Entity
@Table(name = "table_films")
@AllArgsConstructor
@RequiredArgsConstructor
public class FilmEntity implements Serializable  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_film;
	
	@Column(name = "title_film")
	private String title_film;
	
	@Column(name = "description_film")
	private String description_film;
	
	@Column(name = "status_film")
	private int status_film;
	
	@Column(name = "update_film")
	private Date update_film;
	
	@Column(name = "modify_film")
	private Date modify_film;
	 
	@Column(name = "total_rating")
	private float total_rating;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_categories" , nullable = false)
	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
	private	CategoriesEntity categories;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_actor" , nullable = false)
	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
	private ActorEntity actor;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_storage" , nullable = false)
	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
	private StorageEntity storage;
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "id_product" , nullable = false)
//	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
//	private ProductsEntity product;
	
}
