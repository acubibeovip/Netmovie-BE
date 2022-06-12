package com.java.project.service;

import java.util.Optional;

import com.java.project.entity.ContactEntity;

public interface ContactService {
	ContactEntity updateContact(Optional<ContactEntity> contactEntity);
	ContactEntity save(ContactEntity contactEntity);
}
