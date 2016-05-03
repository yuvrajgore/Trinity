package com.trinity.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="projecttable")
public class ProjectModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	public int projectId;
	
	@Column(name="projectname")
	public String projectName;
	
	@Column(name="projectdescription")
	public String projectDescription;

	@Column(name="regexstatus")
	public int regexstatus;	
	
	@Column(name="extractdata")
	public String extractdata;	
	
	public String getExtractdata() {
		return extractdata;
	}

	public void setExtractdata(String extractdata) {
		this.extractdata = extractdata;
	}

	public int getRegexstatus() {
		return regexstatus;
	}

	public void setRegexstatus(int regexstatus) {
		this.regexstatus = regexstatus;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}
	
	
}
