package com.trinity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trinity.model.ProjectModel;
import com.trinity.service.TrinityService;

@Controller
public class TrinityController {

	@Autowired
	@Qualifier("trinityServiceImpl")
	private TrinityService trinityService;
	
	@RequestMapping("/createProject")
	public String gotoCreateProject(){
		return "trinity/createProject";
	}
	@RequestMapping("/uploadFile")
	public String gotoUploadFile(){
		return "trinity/uploadFileInProject";
	}
	@RequestMapping("/regularExpression")
	public String gotoRegularExpression(){
		return "home";
	}
	@RequestMapping(value="/getTrinityProjectInfo",method=RequestMethod.POST,produces = "application/json")
	public @ResponseBody Iterable<ProjectModel> getTrinityProjectInfo(){
		return this.trinityService.getTrinityProjectInfo();
	}
	@RequestMapping(value="/getProjectIdInfo",method=RequestMethod.POST,produces = "application/json")
	public @ResponseBody ProjectModel getProjectIdInfo(@RequestBody ProjectModel projectModel){
		return this.trinityService.getProjectIdInfo(projectModel);
	}

	@RequestMapping(value = "/submitProject", method = RequestMethod.POST,headers = "Accept=application/json")
	public @ResponseBody ProjectModel submitProject(@RequestBody ProjectModel projectModel) {
		trinityService.submitProject(projectModel);
		return projectModel;
	}
	@RequestMapping(value = "/deleteProject", method = RequestMethod.POST,headers = "Accept=application/json")
	public @ResponseBody void deleteProject(@RequestBody ProjectModel projectModel) {
		trinityService.deleteProject(projectModel);
	}
}
