package com.trinity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trinity.model.Filemodel;
import com.trinity.model.ProjectModel;
import com.trinity.service.FileService;
import com.trinity.service.TrinityService;

@Controller
public class DataExtractController {

	@Autowired
	@Qualifier("trinityServiceImpl")
	private TrinityService trinityService;
	
	@Autowired
	@Qualifier("fileServiceImpl")
	private FileService fileService;
	
	@RequestMapping("/regularExpression")
	public String gotoRegularExpression(){
		return "trinity/generateRegEx";
	}	
	@RequestMapping(value="/getExtractedData",method=RequestMethod.POST,produces = "application/json")
	public @ResponseBody String getExtractedData(@RequestBody ProjectModel projectModel){
		projectModel= this.trinityService.getExtractData(projectModel);
		String data=projectModel.getExtractdata();
		return data;
	}
	@RequestMapping(value="/generateRegEx",method=RequestMethod.POST,produces = "application/json")
	public @ResponseBody ProjectModel gotoExtractedData(@RequestBody ProjectModel projectModel){
		Iterable<Filemodel> filesList=this.fileService.getFilesList(projectModel);		
		this.trinityService.extractData(filesList);
		return projectModel;
	}
}
