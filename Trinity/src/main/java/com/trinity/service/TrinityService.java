package com.trinity.service;

import com.trinity.model.Filemodel;
import com.trinity.model.ProjectModel;

public interface TrinityService {

	public Iterable<ProjectModel> getTrinityProjectInfo();
	public ProjectModel getProjectIdInfo(ProjectModel projectModel);
	public void submitProject(ProjectModel projectModel);
	public void deleteProject(ProjectModel projectModel);
	public ProjectModel getExtractData(ProjectModel projectModel);
	public void  extractData(Iterable<Filemodel> filesList);
}
