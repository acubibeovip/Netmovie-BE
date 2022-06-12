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
@Table(name = "table_comment")
@AllArgsConstructor
@RequiredArgsConstructor
public class CommentEntity implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_comment;
	
	@Column(name = "comment")
	private String comment;
	
	@Column(name = "status_comment")
	private int status_comment;
	
	@Column(name = "update_comment")
	private Date update_comment;
	
	@Column(name = "modify_comment")
	private Date modify_comment;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_user" , nullable = false)
	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
	private UserEntity user;
	
	@Column(name = "id_ratting")
	private Long id_ratting;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_film" , nullable = false)
	@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
	private FilmEntity film;
}
