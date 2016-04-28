package com.trinity.service;

import com.trinity.model.Filemodel;

public interface FileService {

	public Iterable<Filemodel> getFilesList();
	public Filemodel getFileInformationById(Filemodel fileModel);
	public void submitFile(Filemodel fileModel);
	public void deleteFile(Filemodel fileModel);
}
