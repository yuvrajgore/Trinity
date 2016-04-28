package com.trinity.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}