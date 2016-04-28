package com.trinity.repository;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.trinity.model.UserRole;
@Transactional
public interface UserRoleRepository extends CrudRepository<UserRole,Integer> {

}
