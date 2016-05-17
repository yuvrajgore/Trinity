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
		String Query="SELECT filestable.id fileId,projecttable.id projectId,"
				          + "filestable.filename fileName,filestable.filedescription fileDescription ,filestable.filedata fileData FROM `projecttable` LEFT OUTER JOIN filestable ON"
				          + " projecttable.id=filestable.projectid WHERE projecttable.id="+projectModel.getProjectId()+" ";
		try {
			fileList=jdbcTemplate.query(Query,new FileMapper());
		} catch (Exception e) {
			System.out.println("Error to fecth data using jdbcttemplate:"+e.getMessage());
		}			
		return fileList;		
	}

}
