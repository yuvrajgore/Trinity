
	getUserInfo();
	$("#success-alert").hide();
	$("#error-alert").hide();
	/* ----------Get user role list -------------*/
	$.ajax({
		type : "POST",
		url : "getUserRole",
		dataType : 'json',
		contentType: "application/json; charset=utf-8",
		success : function(data) {
			var userRole = '';
			$.each( data, function( key, value ) {
				userRole += '<option value="'+value.id+'">'
				+ value.name
				+ '</option>';

			});
			$('#userRoleId').append(userRole);
		},
		error:function(response){
			alert("No records found...");
		}		
	});
	
	/*------------submit form------------*/
	$("#submitForm").click(function(){
		var email=$("#email").val();
		if($("#firstName").val()==""){
			showError("Please enter First Name.");
		}else{
		if($("#lastName").val()==""){
			showError("Please enter Last Name.");
		}else{
		if($("#userName").val()==""){
			showError("Please enter an User Name.");
		}else{
		if(email==""){
			showError("Please enter an email address.");
		}else{
		if($("#userRoleId").val()!=""){
			submitForm();
		}else{
			showError("Please select a User Role from the list");
		}
		}
		}
		}
		}
	}); 	
function getUserInfo(){
	/*----------List of users--------------*/
	$.ajax({
	type : "POST",
	url : "getUserInfo",
	dataType : 'json',
	contentType: "application/json; charset=utf-8",
	success : function(data) {
		 var userList = '';
		 var count=1;
	        $.each(data, function (i, item) {
	        	userList += '<tr><td>' +count++ + '</td><td>' + item.firstName + 
	        	'</td><td>' + item.lastName + '</td>'+ '<td>' + item.userName+
	        	'</td>'+ '<td><a class="btn btn-primary registration" data-toggle="modal" href="0" onclick="editUser('+item.userId+')">Edit</a>'+
	        	'<a	 class="btn btn-danger"  href="javascript:void(0)" style="margin-left:5px" onclick="deleteUser('+item.userId+')">Delete</a></td></tr>';
	        });
	        $('#userList').html(userList);
	},
	error:function(response){
		alert("No records found...");
	}		
});
}
function submitForm(){
	var userInformation=$("#userForm").serializeArray();
	var userObject = '{';
	$(userInformation).each(function(index, obj) {
		userObject += '"' + obj.name + '" : "' + obj.value + '",';
	});
	userObject += ' "" : "" ';
	userObject += '}';
	$.ajax({
		type:"POST",
		contentType : "application/json",
		dataType : 'json',
		url:"submitUser",
		data:userObject,
		success:function(response){
			$('#responsive').modal('hide');
			displaySuccessMessage('ADD');
			getUserInfo();
		},
		error:function(response){
			showError("Error has been occured while submitting the data.");
			}
	});	
}
function showError(message){
	 $("#error-alert").alert();
	 $("#errormessage").html(message);
     $("#error-alert").fadeTo(2000, 500).slideUp(1000);
}
function showSuccess(message){
	 $("#success-alert").alert();
	 $("#successmessage").html(message);
    $("#success-alert").fadeTo(2000, 500).slideUp(1000);
}

function displaySuccessMessage(mode){
	var message=new Array();
	switch(mode){
	case 'EDIT':
		showSuccess('Your changes have been successfully saved.');
		 break;
	case 'ADD':
		showSuccess('The user registration successfully completed.');
		break;
	case 'DELETE':
		showSuccess('The user has been deleted successfully.');
		}
	getUserInfo();
	}
function editUser(id){
	$.ajax({
		type : "POST",
		url : "getUserIdInfo",
		contentType : "application/json",
		dataType : 'json',
		data: JSON.stringify({userId:id}),
		success : function(data) {
			 $("#responsive").modal('show');
			 $("#firstName").val(data.firstName);
			 $("#lastName").val(data.lastName);
			 $("#userName").val(data.userName);
			 $("#email").val(data.email);
			 $("#userRoleId").val(data.userRoleId);
			 $("#userId").val(data.userId);
			 $("#showUserName").html(data.firstName);
		},
		error:function(response){
			alert("Unable to load edit modal..");
		}		
	});
	}
	function deleteUser(id){
		$.ajax({
			type : "POST",
			url : "deleteUser",
			dataType :"json",
			data: JSON.stringify({userId:id}),
			contentType: "application/json",
			success : function(data) {
				displaySuccessMessage('DELETE');				
			},
			error:function(response){
				alert("Error occured to delete user..");
			}		
		});	
	}