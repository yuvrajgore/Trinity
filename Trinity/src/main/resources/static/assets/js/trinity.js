
	getTrinityProjectInfo();
	$("#projectSuccess-alert").hide();
	$("#projectError-alert").hide();
	
	/*------------submit form------------*/
	$("#submitProjectForm").click(function(){
		if($("#projectName").val()==""){
			showProjectError("Please enter Project Name.");
		}else{
			submitProjectForm();
		}
	}); 	
function getTrinityProjectInfo(){
	/*----------List of users--------------*/
	$.ajax({
	type : "POST",
	url : "getTrinityProjectInfo",
	dataType : 'json',
	contentType: "application/json",
	success : function(data) {
		 var projectList = '';
		 var count=1;
	        $.each(data, function (i, item) {
	        	projectList += '<tr><td>' +count++ + '</td><td>' + item.projectName + 
	        	'</td><td>' + item.projectDescription + '</td>'+'<td><a class="btn btn-primary" data-toggle="modal" href="#" onclick="editProject('+item.projectId+')">Edit</a>'+
	        	'<a	 class="btn btn-danger"  href="#" style="margin-left:5px" onclick="deleteProject('+item.projectId+')">Delete</a></td></tr>';
	        });
	        $('#projectList').html(projectList);
	},
	error:function(response){
		alert("No projects found...");
	}		
});
}
function submitProjectForm(){
	var projectInformation=$("#projectForm").serializeArray();
	var projectObject = '{';
	$(projectInformation).each(function(index, obj) {
		projectObject += '"' + obj.name + '" : "' + obj.value + '",';
	});
	projectObject += ' "" : "" ';
	projectObject += '}';
	$.ajax({
		type:"POST",
		contentType : "application/json",
		dataType : 'json',
		url:"submitProject",
		data:projectObject,
		success:function(response){
			$('#responsive').modal('hide');
			displayProjectSuccessMessage('ADD');
			getTrinityProjectInfo();
		},
		error:function(response){
			showProjectError("Error has been occured while submitting the data.");
			}
	});	
}
function showProjectError(message){
	 $("#projectError-alert").alert();
	 $("#projectErrormessage").html(message);
     $("#projectError-alert").fadeTo(8000, 500).slideUp(1000);
}
function showProjectSuccess(message){
	 $("#projectSuccess-alert").alert();
	 $("#projectSuccessmessage").html(message);
    $("#projectSuccess-alert").fadeTo(8000, 500).slideUp(1000);
}

function displayProjectSuccessMessage(mode){
	var message=new Array();
	switch(mode){
	case 'EDIT':
		showProjectSuccess('Your changes have been successfully saved.');
		 break;
	case 'ADD':
		showProjectSuccess('The Project has been added successfully.');
		break;
	case 'DELETE':
		showProjectSuccess('The Project has been deleted successfully.');
		}
	getTrinityProjectInfo();
	}
function editProject(id){
	$.ajax({
		type : "POST",
		url : "getProjectIdInfo",
		contentType : "application/json",
		dataType : 'json',
		data: JSON.stringify({projectId:id}),
		success : function(data) {
			 $("#responsive").modal('show');
			 $("#projectId").val(data.projectId);
			 $("#projectName").val(data.projectName);
			 $("#projectDescription").val(data.projectDescription);
		},
		error:function(response){
			alert("Unable to load edit modal..");
		}		
	});
	}
	function deleteProject(id){
		$.ajax({
			type : "POST",
			url : "deleteProject",
			dataType :"json",
			data: JSON.stringify({projectId:id}),
			contentType: "application/json",
			success : function(data) {
				displayProjectSuccessMessage('DELETE');				
			},
			error:function(response){
				alert("Error occured to delete Project..");
			}		
		});	
	}