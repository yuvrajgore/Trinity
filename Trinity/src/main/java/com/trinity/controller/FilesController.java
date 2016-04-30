package com.trinity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.trinity.model.Filemodel;
import com.trinity.model.ProjectModel;
import com.trinity.service.FileService;
import com.trinity.service.TrinityService;

@Controller
public class FilesController {
	@Autowired
	@Qualifier("trinityServiceImpl")
	private TrinityService trinityService;
	
	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;
	
	@RequestMapping(value="/openProject",method=RequestMethod.POST)
	public ModelAndView gotoProject(@ModelAttribute ProjectModel projectModel){
		ModelAndView mv=new ModelAndView();
		mv.addObject("projectInfo",this.trinityService.getProjectIdInfo(projectModel));
		mv.addObject("filesList",this.fileService.getFilesList(projectModel));
		mv.setViewName("trinity/projectFiles");		
		return mv;
	}
	@RequestMapping(value="/getFileIdInfo",method=RequestMethod.POST,produces = "application/json")
	public @ResponseBody Filemodel getUserIdInfo(@RequestBody Filemodel fileModel){
		return this.fileService.getFileInformationById(fileModel);	
	}
	@RequestMapping(value = "/submitFile", method = RequestMethod.POST,headers = "Accept=application/json")
	public @ResponseBody Filemodel submitFile(@RequestParam("fileData") MultipartFile fileData,@RequestParam("fileName") String fileName,@RequestParam("fileDescription") String fileDescription,
																@RequestParam("projectId") Integer projectId,@RequestParam("fileId") Integer fileId) {
	
		Filemodel fileModel=new Filemodel();
		ProjectModel projectModel=new ProjectModel();
			try {
				if (fileId!=null) {
				fileModel.setFileId(fileId);
				}
				projectModel.setProjectId(projectId);
				fileModel.setProjectModel(projectModel);
				fileModel.setFileName(fileName);
				fileModel.setFileDescription(fileDescription);
				fileModel.setFileData(fileData.getBytes());
				fileService.submitFile(fileModel);
			} catch (Exception e) {
				System.out.println("You failed to upload " + fileName + " => " + e.getMessage());
			}
		return fileModel;
	}
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST,headers = "Accept=application/json")
	public @ResponseBody void deleteFile(@RequestBody Filemodel fileModel) {
		fileService.deleteFile(fileModel);
	}
}
