package com.trinity.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class FileMapper implements RowMapper<Filemodel>  {

	@Override
	public Filemodel mapRow(ResultSet rs, int rowNum) throws SQLException {
		Filemodel filemodel=new Filemodel();	
		filemodel.setFileId(rs.getInt("fileId"));
		filemodel.setProjectId(rs.getInt("projectId"));
		filemodel.setFileName(rs.getString("fileName"));
		filemodel.setFileDescription(rs.getString("fileDescription"));
		filemodel.setFileData(rs.getBytes("fileData"));
		return filemodel;
	}

}
