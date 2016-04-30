package com.trinity.repository;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.trinity.model.Filemodel;

@Transactional
public interface FilesRepository extends CrudRepository<Filemodel,Integer> {
	
}
