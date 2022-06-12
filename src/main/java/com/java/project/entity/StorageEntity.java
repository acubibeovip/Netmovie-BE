package com.java.project.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.Optional;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@Entity
@Table(name = "table_storage")
@AllArgsConstructor
@RequiredArgsConstructor
public class StorageEntity implements Serializable  {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_storage;
	
	@Column(name = "image_storage")
	private String image_storage;
	
	@Column(name = "video_storage")
	private String video_storage;
	
	@Column(name = "update_storage")
	private Date update_storage;
	
	@Column(name = "modify_storage")
	private Date modify_storage;
	
	@Column(name = "id_user")
	private Long id_user;
	
	@Column(name = "description_storage")
	private String description_storage;
	
//	@ManyToOne (fetch = FetchType.LAZY)
//	@JoinColumn(name = "id_actor" , nullable = false)
//    private ActorEntity actor;
	
}
