package com.trinity.repository;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.trinity.model.ProjectModel;
@Transactional
public interface ProjectRepository extends CrudRepository<ProjectModel,Integer> {

}
