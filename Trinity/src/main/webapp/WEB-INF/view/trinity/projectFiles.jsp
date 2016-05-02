<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ include file="/WEB-INF/view/common/sidebar.jsp" %>
<div class="page-content-wrapper">
		<div class="page-content">
		<!-- BEGIN BORDERED TABLE PORTLET-->		
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">${projectInfo.projectName} Project Information
								<i class="fa fa-folder-open"></i>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="#portlet-config" data-toggle="modal" class="config">	</a>
								<a href="javascript:;" class="reload"></a>
								<a href="javascript:;" class="remove">	</a>
							</div>
						</div>
						<div class="portlet-body"><a class="btn btn-success" data-toggle="modal" href="#responsive" style="margin:5px;float:right">Add File</a>
									<!-- /.modal -->
				<div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true"></button>
								<h4 class="modal-title">
									<b>Files upload Form</b>
								</h4>
							</div>
							<div class="modal-body">
								<div class="scroller" style="height: 400px" 	data-always-visible="1" data-rail-visible1="1">
									<!-- BEGIN FORM-->
									<div class="alert alert-danger" id="fileError-alert">
										<button type="button" class="close" data-dismiss="alert">x</button>
										<strong>Error! </strong><label id="fileErrormessage" />.
									</div>
									<form action="#" id="fileForm" class="form-horizontal">
										<div class="form-body">	
										<input type="hidde" id="fileId" name="fileId">									
										<input type="hidde" id="projectId" name="projectId" value="0">
											<div class="form-group">
												<label class="label-control col-md-3">File Name<span class="required"> * </span></label>
												<div class="col-md-9">
													<input type="text" name="fileName" id="fileName" data-required="1" class="form-control" required />
												</div>
											</div>
												<div class="form-group">
												<label class="label-control col-md-3">File Description<span	class="required"> * </span></label>
												<div class="col-md-9">
													<input type="text" name="fileDescription" id="fileDescription" data-required="1" class="form-control" required/>
												</div>
											</div>
											<div class="form-group">
												<label class="label-control col-md-3">Upload File<span	class="required"> * </span></label>
												<div class="col-md-9">
													<input type="file" name="fileData" id="fileData" data-required="1" class="form-control" required/>
												</div>
											</div>
										</div>
										<div class="form-actions fluid">
											<div class="col-md-offset-3 col-md-9">
												<button type="button" onclick="submitFileForm()" class="btn green">Submit</button>
												<button type="button" data-dismiss="modal" class="btn btn-danger">Close</button>
											</div>
										</div>
									</form>
									<!-- END FORM-->
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="table-responsive">
				<div class="alert alert-success" id="fileSuccess-alert">
										<button type="button" class="close" data-dismiss="alert">x</button>
										<strong>Success! </strong><label id="fileSuccessmessage" />.
									</div>
							<table  class="table table-striped table-bordered table-advance table-hover">
								<thead>
								
								<tr>
									<th>
										 Sr.No.
									</th>
									<th>
										 File Name
									</th>
									<th>
										 File Description
									</th>
									<th>
										 Action
									</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="value" items="${filesList}" varStatus="status">
								  <tr>
								   <td>${status.count}</td>
								   <td>${value.fileName}</td>
								   <td>${value.fileDescription}</td>
								   <td><a class="btn btn-primary" data-toggle="modal" href="#" onclick="editFile(${value.fileId})">Edit</a>
								   		<a	 class="btn btn-info"  href="#" style="margin-left:5px" onclick="viewFile(${value.fileId})">View	</a>
								   		<a	 class="btn btn-danger"  href="#" style="margin-left:5px" onclick="deleteFile(${value.fileId})">Delete</a>
								   </td>
								 </tr>
								</c:forEach>
								</tbody>
								</table>
							</div>
					<div id="fileModal" class="modal fade" tabindex="-1" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true"></button>
								<h4 class="modal-title">
									<b>View File Data</b>
								</h4>
							</div>
							<div class="modal-body">
								<div class="scroller" style="height: 400px" 	data-always-visible="1" data-rail-visible1="1">
									<div id="ShowFileData"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
						</div>
					</div>
					<!-- END BORDERED TABLE PORTLET-->
			</div>
	</div>
	<!-- END CONTENT -->

<%@ include file="/WEB-INF/view/common/footer.jsp" %>
<script>
$("#fileSuccess-alert").hide();
$("#fileError-alert").hide();
function showFileError(message){
	 $("#fileError-alert").alert();
	 $("#fileErrormessage").html(message);
    $("#fileError-alert").fadeTo(8000, 500).slideUp(1000);
}
function showFileSuccess(message){
	 $("#fileSuccess-alert").alert();
	 $("#fileSuccessmessage").html(message);
   $("#fileSuccess-alert").fadeTo(8000, 500).slideUp(1000);
}
function editFile(id){
	$.ajax({
		type : "POST",
		url : "getFileIdInfo",
		contentType : "application/json",
		dataType : 'json',
		data: JSON.stringify({fileId:id}),
		success : function(data) {
			 $("#responsive").modal('show');
			 $("#projectId").val(data.projectId);
			 $("#fileId").val(data.fileId);
			 $("#fileName").val(data.fileName);
			 $("#fileDescription").val(data.fileDescription);
		},
		error:function(response){
			showFileError("Unable to load edit modal..");
		}		
	});
	}
function viewFile(id){
	$.ajax({
		type : "POST",
		url : "getFileIData",
		contentType : "application/json",
		dataType : 'text',
		data: JSON.stringify({fileId:id}),
		success : function(response) {
			$("#fileModal").modal('show');
			$("#ShowFileData").text(response);
		},
		error:function(response){
			showFileError("Unable to load file.");
		}		
	});
	}
	function deleteFile(id){
		$.ajax({
			type : "POST",
			url : "deleteFile",
			dataType :"json",
			data: JSON.stringify({fileId:id}),
			contentType: "application/json",
			success : function(data) {
				displayFileSuccessMessage('DELETE');				
			},
			error:function(response){
				showFileError("Error occured to delete File..");
			}		
		});	
	}
	function displayFileSuccessMessage(mode){
	var message=new Array();
	switch(mode){
	case 'EDIT':
		showFileSuccess('Your changes have been successfully saved.');
		 break;
	case 'ADD':
		showFileSuccess('The File has been added successfully.');
		break;
	case 'DELETE':
		showFileSuccess('The File has been deleted successfully.');
		}
	window.location.reload();
	}

	function submitFileForm(){
		var formData = new FormData($("#fileForm")[0]);
		 	    $.ajax({
		 	        url:'submitFile',
		 	        type: 'POST',
		 	        data: formData,
		 	       cache: false,
			        contentType: false,
			        processData: false,
			        enctype: 'multipart/form-data',
		 	        success: function (data) {
		 	        	$("#responsive").modal('hide');
		 	        	displayFileSuccessMessage("ADD");
		 	        },
		 	        error:function(){
		 	        	showFileError("Error occured to save File..");
		 	        }
		 	        
		 	    });

		 	    return false;
	/* 	var fileInformation=$("#fileForm").serializeArray();
		var fileObject = '{';
		$(fileInformation).each(function(index, obj) {
			fileObject += '"' + obj.name + '" : "' + obj.value + '",';
		});
		fileObject += ' "" : "" ';
		fileObject += '}';
		$.ajax({
			type:"POST",
			contentType : "application/json",
			dataType : 'json',
			url:"submitFile",
			data:fileObject,
			success:function(response){
				$('#responsive').modal('hide');
				displayFileSuccessMessage('ADD');
				window.location.reload();
			},
			error:function(response){
				showFileError("Error has been occured while submitting the data.");
				}
		});	 */
	}
</script>