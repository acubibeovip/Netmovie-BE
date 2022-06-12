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
@Table(name = "table_contact")
public class ContactEntity implements Serializable  {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_contact;
	
	@Column(name = "title_contact")
	private String title_contact;
	
	@Column(name = "message_contact")
	private String message_contact;
	
	@Column(name = "email_contact")
	private String email_contact;
	
	@Column(name = "phone_contact")
	private String phone_contact;
	
	@Column(name = "update_contact")
	private Date update_contact;

	@Column(name = "modify_contact")
	private Date modify_contact;
}
