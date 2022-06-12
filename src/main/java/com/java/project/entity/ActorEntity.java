package com.java.project.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@Entity
@Table(name = "table_actor")
@AllArgsConstructor
@RequiredArgsConstructor
public class ActorEntity implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_actor;
	
	@Column(name = "name_actor")
	private String name_actor;
	
	@Column(name = "image_actor")
	private String image_actor;
	
	@Column(name = "country_actor")
	private String country_actor;
	
	@Column(name = "age_actor")
	private int age_actor;
	
	@Column(name = "follow_actor")
	private int follow_actor;
	
	@Column(name = "update_actor")
	private Date update_actor;

	@Column(name = "modify_actor")
	private Date modify_actor;
	
	
}
