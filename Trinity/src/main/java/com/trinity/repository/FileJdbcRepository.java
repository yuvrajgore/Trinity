package com.trinity.repository;

import com.trinity.model.Filemodel;
import com.trinity.model.ProjectModel;

public interface FileJdbcRepository {
public Iterable<Filemodel> findByProjectId_Id(ProjectModel projectModel);
}
