package com.trinity.service;

import com.trinity.model.FileuploadModel;
import com.trinity.model.User;
import com.trinity.model.UserResponsemodel;

public interface UserService {
public UserResponsemodel getUserInformation();
public User getUserInformationById(User user);
public UserResponsemodel getUserRole();
public void saveUser(User user);
public void deleteUser(User user);
public void uploadImage(FileuploadModel fileUploadModel);
public FileuploadModel getImage(FileuploadModel fileUploadModel);

}
