package com.trinity.repository;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.trinity.model.FileuploadModel;

@Transactional
public interface UserProfilePictureRepository  extends CrudRepository<FileuploadModel,Long>{

}
