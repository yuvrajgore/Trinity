package com.trinity.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trinity.model.FileuploadModel;
import com.trinity.model.User;
import com.trinity.model.UserResponsemodel;
import com.trinity.model.UserRole;
import com.trinity.repository.UserProfilePictureRepository;
import com.trinity.repository.UserRepository;
import com.trinity.repository.UserRoleRepository;
import com.trinity.service.UserService;
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;
	
	@Autowired
	private UserProfilePictureRepository userProfilePictureRepository;
	
	@Override
	public UserResponsemodel getUserInformation() {
		UserResponsemodel userResponseModel=new UserResponsemodel();
		try{
		Iterable<User> userList=userRepository.findAll();
		userResponseModel.setUserInformation(userList);
		}catch(Exception e){
			System.out.println("Exception to find user information......."+e.getMessage());
		}		
		return userResponseModel;
	}
	@Override
	public UserResponsemodel getUserRole() {
		UserResponsemodel userRoleResponseModel=new UserResponsemodel();		
		try{
			Iterable<UserRole> userRoleList=userRoleRepository.findAll();
			userRoleResponseModel.setUserRole(userRoleList);
		}catch(Exception e){
			System.out.println("Exception to find user role data......."+e.getMessage());
		}		
		return userRoleResponseModel;
	}
	@Override
	public void saveUser(User user) {
		try{
			userRepository.save(user);
		}catch(Exception e){
			System.out.println("Exception to save user data......."+e.getMessage());
		}
	}
	@Override
	public void deleteUser(User user) {
		try {
			userRepository.delete(user.getUserId());
		} catch (Exception e) {
			System.out.println("Exception to delete user data......."+e.getMessage());
		}
	}
	@Override
	public User getUserInformationById(User user) {
	try {
		user= userRepository.findOne(user.getUserId());
	} catch (Exception e) {
		System.out.println("Exception to get user data......."+e.getMessage());
	}
	return user;
	}
	@Override
	public void uploadImage(FileuploadModel fileUploadModel) {		
		try{
			userProfilePictureRepository.save(fileUploadModel);
		}catch(Exception e){
			System.out.println("Exception to save user Profile Picture......."+e.getMessage());
		}
	}
	@Override
	public FileuploadModel getImage(FileuploadModel fileUploadModel) {
		try {
			fileUploadModel=userProfilePictureRepository.findOne(fileUploadModel.getId());
		} catch (Exception e) {
			System.out.println("Exception to get user profile picture......."+e.getMessage());
		}
		return fileUploadModel;
		}
}
