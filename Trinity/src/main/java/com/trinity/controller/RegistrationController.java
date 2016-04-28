package com.trinity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trinity.model.User;
import com.trinity.model.UserResponsemodel;
import com.trinity.model.UserRole;
import com.trinity.service.UserService;

@Controller
public class RegistrationController {

	@Autowired
	@Qualifier("userServiceImpl")
	UserService userService;
	
	@RequestMapping("/registration")
	public String gotoRegistration(){
		return "registration";
	}
	@RequestMapping(value="/getUserInfo",method=RequestMethod.POST,produces = "application/json")
	public @ResponseBody Iterable<User> getUserInfo(){
		UserResponsemodel userRoleResponse=this.userService.getUserInformation();
		return userRoleResponse.getUserInformation();		
	}
	@RequestMapping(value="/getUserIdInfo",method=RequestMethod.POST,produces = "application/json")
	public @ResponseBody User getUserIdInfo(@RequestBody User user){
		return this.userService.getUserInformationById(user);	
	}
	@RequestMapping(value="/getUserRole",method=RequestMethod.POST,produces = "application/json")
	public @ResponseBody Iterable<UserRole> getUserRole(){
		UserResponsemodel userRoleResponse=this.userService.getUserRole();
		return userRoleResponse.getUserRole();		
	}
	@RequestMapping(value = "/submitUser", method = RequestMethod.POST,headers = "Accept=application/json")
	public @ResponseBody User saveUser(@RequestBody User user) {
		userService.saveUser(user);
		return user;
	}
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST,headers = "Accept=application/json")
	public @ResponseBody void deleteUser(@RequestBody User user) {
		userService.deleteUser(user);
	}	
}
