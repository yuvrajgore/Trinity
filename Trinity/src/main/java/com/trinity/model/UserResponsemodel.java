package com.trinity.model;


public class UserResponsemodel {
Iterable<User> userInformation;
Iterable<UserRole> userRole;

public Iterable<User> getUserInformation() {
	return userInformation;
}
public void setUserInformation(Iterable<User> userInformation) {
	this.userInformation = userInformation;
}
public Iterable<UserRole> getUserRole() {
	return userRole;
}
public void setUserRole(Iterable<UserRole> userRole) {
	this.userRole = userRole;
}

}
