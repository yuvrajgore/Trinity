package com.trinity.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trinity.model.Filemodel;
import com.trinity.model.ProjectModel;
import com.trinity.repository.FileJdbcRepository;
import com.trinity.repository.FilesRepository;
import com.trinity.service.FileService;
@Service("fileServiceImpl")
public class FileServiceImpl implements FileService{

	@Autowired
	private FilesRepository filesRepository;
	
	@Autowired
	private FileJdbcRepository fileJdbcRepository;
	@Override
	public Iterable<Filemodel> getFilesList(ProjectModel projectModel) {
		Iterable<Filemodel> filesList=null;
		try {
			//filesList=filesRepository.findAll();
			filesList=fileJdbcRepository.findByProjectId_Id(projectModel);
		} catch (Exception e) {
			System.out.println("Error to fetch files list:"+e.getMessage());
		}
		return filesList;
	}
	@Override
	public Filemodel getFileInformationById(Filemodel fileModel) {
		try {
			fileModel=filesRepository.findOne(fileModel.getFileId());
		} catch (Exception e) {
			System.out.println("Error to get file information:"+e.getMessage());
		}
		return fileModel;
	}
	@Override
	public void submitFile(Filemodel fileModel) {
		try {
			filesRepository.save(fileModel);
		} catch (Exception e) {
			System.out.println("Error to submit the form:"+e.getMessage());
		}
	}
	@Override
	public void deleteFile(Filemodel fileModel) {
		try {
			filesRepository.delete(fileModel.getFileId());
		} catch (Exception e) {
			System.out.println("Error to delete the file");
		}
		
	}

}
