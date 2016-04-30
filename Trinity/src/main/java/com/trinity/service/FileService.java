package com.trinity.service;

import com.trinity.model.Filemodel;
import com.trinity.model.ProjectModel;

public interface FileService {

	public Iterable<Filemodel> getFilesList(ProjectModel projectModel);
	public Filemodel getFileInformationById(Filemodel fileModel);
	public void submitFile(Filemodel fileModel);
	public void deleteFile(Filemodel fileModel);
}
