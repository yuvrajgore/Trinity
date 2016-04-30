package com.trinity.repositoryImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.trinity.model.FileMapper;
import com.trinity.model.Filemodel;
import com.trinity.model.ProjectModel;
import com.trinity.repository.FileJdbcRepository;
@Repository
public class FileJdbcRepositoryImpl implements FileJdbcRepository {
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Override
	public Iterable<Filemodel> findByProjectId_Id(ProjectModel projectModel) {
		List<Filemodel> fileList=null;
		String Query="SELECT ft.id fileId,pt.id projectId,pt.projectName,pt.projectDescription,ft.fileName,ft.fileDescription FROM `projecttable` pt INNER JOIN filestable ft ON pt.id=ft.projectId WHERE ft.projectId="+projectModel.getProjectId()+"";
		try {
			fileList=jdbcTemplate.query(Query,new FileMapper());
		} catch (Exception e) {
			System.out.println("Error to fecth data using jdbcttemplate:"+e.getMessage());
		}			
		return fileList;		
	}

}
