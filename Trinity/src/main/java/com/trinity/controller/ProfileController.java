package com.trinity.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.trinity.model.FileuploadModel;
import com.trinity.service.UserService;

@Controller
public class ProfileController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	UserService userService;
	
	@RequestMapping("/myProfile")
	public String gotoHome(){
		return "myProfile";
	}
	@RequestMapping("/upload")
	public String gotoFileUpload(){
		return "upload";
	}
	@RequestMapping(value = "/uploadProfile", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> uploadFile(@RequestParam("uploadprofile") MultipartFile uploadprofile) {	  
	  try {
		  System.out.println("upload File name:"+uploadprofile);
	    // Get the filename and build the local file path (be sure that the 
	    // application have write permissions on such directory)
	    String filename = uploadprofile.getOriginalFilename();
	    System.out.println("filename:"+filename);
	    String directory = "/WEB-INF/view/";
	    System.out.println("directory:"+directory);
	    String filepath = Paths.get(directory, filename).toString();
	    System.out.println("filepath:"+filepath);
	    // Save the file locally
	    BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filepath)));
	    stream.write(uploadprofile.getBytes());
	    stream.close();
	  }
	  catch (Exception e) {
	    System.out.println(e.getMessage());
	  }
	  
	  return new ResponseEntity<>(HttpStatus.OK);
	} 
	//@RequestParam("name") String name,@RequestParam("file") MultipartFile file
	//@RequestParam("file") MultipartFile multipartFile
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST,headers = "Accept=application/json")
	public @ResponseBody	String uploadFileHandler(@RequestParam("file") MultipartFile multipartFile) {
		//userService.uploadImage(fileUploadModel);
	/*	if (!file.isEmpty()) {
			try {
				fileUploadModel.setFileName(name);
				fileUploadModel.setData(file.getBytes());
				userService.uploadImage(fileUploadModel);
				return "You successfully uploaded file=" + name;
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name
					+ " because the file was empty.";
		}*/
		return "success";
	}
	@RequestMapping(value = "/imageDisplay",method=RequestMethod.POST,produces = "application/json")
	  public @ResponseBody FileuploadModel showImage(){
		FileuploadModel fileUploadModel=new FileuploadModel();
		fileUploadModel.setId(1L);
		fileUploadModel=userService.getImage(fileUploadModel);
	  
	return fileUploadModel;
	}
}
