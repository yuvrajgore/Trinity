package com.trinity.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class FileMapper implements RowMapper<Filemodel>  {

	@Override
	public Filemodel mapRow(ResultSet rs, int rowNum) throws SQLException {
		Filemodel filemodel=new Filemodel();
		ProjectModel projectModel=new ProjectModel();
		projectModel.setProjectId(rs.getInt("projectId"));
		projectModel.setProjectName(rs.getString("projectName"));
		projectModel.setProjectDescription(rs.getString("projectDescription"));
		filemodel.setFileId(rs.getInt("fileId"));
		filemodel.setProjectModel(projectModel);
		filemodel.setFileName(rs.getString("fileName"));
		filemodel.setFileDescription(rs.getString("fileDescription"));
		return filemodel;
	}

}
