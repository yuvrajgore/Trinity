package com.trinity.repository;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.trinity.model.User;
@Transactional
public interface UserRepository extends CrudRepository<User,Integer> {

}
