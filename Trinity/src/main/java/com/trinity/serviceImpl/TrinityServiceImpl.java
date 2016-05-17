package com.trinity.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trinity.model.Filemodel;
import com.trinity.model.ProjectModel;
import com.trinity.repository.ProjectRepository;
import com.trinity.service.TrinityService;
@Service("trinityServiceImpl")
public class TrinityServiceImpl implements TrinityService {

	@Autowired
	private ProjectRepository projectRepository;
	@Override
	public Iterable<ProjectModel> getTrinityProjectInfo() {
		Iterable<ProjectModel> projectList=null;
		try{
			projectList=projectRepository.findAll();
			}catch(Exception e){
				System.out.println("Exception to find project information......."+e.getMessage());
			}	
		return projectList;
	}

	@Override
	public ProjectModel getProjectIdInfo(ProjectModel projectModel) {
		try {
			projectModel=projectRepository.findOne(projectModel.getProjectId());
		} catch (Exception e) {
			System.out.println("Exception to get  project id information......."+e.getMessage());
		}
		return projectModel;
	}

	@Override
	public void submitProject(ProjectModel projectModel) {
	try {
		projectRepository.save(projectModel);
	} catch (Exception e) {
		System.out.println("Exception to save  project  information......."+e.getMessage());
	}
	}

	@Override
	public void deleteProject(ProjectModel projectModel) {
		try {
			projectRepository.delete(projectModel.getProjectId());
		} catch (Exception e) {
			System.out.println("Exception to delete  project  information......."+e.getMessage());
		}
	}

	@Override
	public ProjectModel getExtractData(ProjectModel projectModel) {
		try {
			projectRepository.findOne(projectModel.getProjectId());
		} catch (Exception e) {
			System.out.println("Exception to fetch  Extracted data......"+e.getMessage());
		}
		return projectModel;
	}

	@Override
	public void extractData(Iterable<Filemodel> filesList) {
		ProjectModel projectModel=new ProjectModel();
		List<Filemodel> list=new ArrayList<Filemodel>();
		for(Filemodel model:filesList){
			list.add(model);
		}
		int max=list.size();
		try {
			projectRepository.save(projectModel);
		} catch (Exception e) {
			System.out.println("Exception to save  extracted  data......."+e.getMessage());
		}
	}
}
