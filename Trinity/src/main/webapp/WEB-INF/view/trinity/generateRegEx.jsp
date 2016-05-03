<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ include file="/WEB-INF/view/common/sidebar.jsp" %>
<div class="page-content-wrapper">
		<div class="page-content">
		<!-- BEGIN BORDERED TABLE PORTLET-->		
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">Upload files in Project
								<i class="fa fa-coffee"></i>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="#portlet-config" data-toggle="modal" class="config">	</a>
								<a href="javascript:;" class="reload"></a>
								<a href="javascript:;" class="remove">	</a>
							</div>
						</div>
						<div class="portlet-body">
									<!-- /.modal -->
				<div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true"></button>
								<h4 class="modal-title">
									<b>Project Design Form</b>
								</h4>
							</div>
							<div class="modal-body">
								<div class="scroller" style="height: 400px" 	data-always-visible="1" data-rail-visible1="1">
									<!-- BEGIN FORM-->
									<div class="alert alert-danger" id="projectError-alert">
										<button type="button" class="close" data-dismiss="alert">x</button>
										<strong>Error! </strong><label id="projectErrormessage" />.
									</div>
									<form action="#" id="projectForm" class="form-horizontal">
										<div class="form-body">										
										<input type="hidden" id="projectId" name="projectId">
											<div class="form-group">
												<label class="label-control col-md-3">Project Name<span class="required"> * </span></label>
												<div class="col-md-9">
													<input type="text" name="projectName" id="projectName" data-required="1" class="form-control" required />
												</div>
											</div>
												<div class="form-group">
												<label class="label-control col-md-3">Project Description<span	class="required"> * </span></label>
												<div class="col-md-9">
													<input type="text" name="projectDescription" id="projectDescription" data-required="1" class="form-control" required/>
												</div>
											</div>
										</div>
										<div class="form-actions fluid">
											<div class="col-md-offset-3 col-md-9">
												<button type="button" id="submitProjectForm" class="btn green">Submit</button>
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
				<div class="alert alert-success" id="projectSuccess-alert">
										<button type="button" class="close" data-dismiss="alert">x</button>
										<strong>Success! </strong><label id="projectSuccessmessage" />.
									</div>
							<table  class="table table-striped table-bordered table-advance table-hover">
								<thead>
								
								<tr>
									<th>
										 Sr.No.
									</th>
									<th>
										 Project Name
									</th>
									<th>
										 Project Description
									</th>
									<th>
										 Action
									</th>
								</tr>
								</thead>
								<tbody id="projectList">
								
								</tbody>
								</table>
							</div>
								<div id="extractModel" class="modal fade" tabindex="-1" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true"></button>
								<h4 class="modal-title">
									<b>View Extracted Data</b>
								</h4>
							</div>
							<div class="modal-body">
								<div class="scroller" style="height: 400px" 	data-always-visible="1" data-rail-visible1="1">
									<div id="ShowExtractedData"></div>
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
$(document).ready(function(){
	getRegExProjectInfo();
});
function getRegExProjectInfo(){
	$.ajax({
	type : "POST",
	url : "getTrinityProjectInfo",
	dataType : 'json',
	contentType: "application/json",
	success : function(data) {
		console.log(data);
		 var projectList = '';
		 var count=1;
		 
	        $.each(data, function (i, item) {
	        	var view;
	        	 if(item.regexstatus==1){
	        		 view='  <a class="btn btn-info" href="#" onclick="viewResult('+item.projectId+')" >View Result</a>';
	        	 }else{
	        		 view='  <a class="btn btn-info" href="#" onclick="viewResult('+item.projectId+')" style="visibility: hidden">View Result</a>';
	        	 }
	        	 
	        	projectList += '<tr><td>' +count++ + '</td><td>' + item.projectName + 
	        	'</td><td>' + item.projectDescription + '</td>'+'<td><a class="btn btn-primary" href="#" onclick="generateRegEx('+item.projectId+')">Generate Regular Expression</a>'
	        	+view+'</td></tr>';
	        });
	        $('#projectList').html(projectList);
	},
	error:function(response){
		alert("No projects found...");
	}		
});
}
function generateRegEx(id){
	$.ajax({
		type : "POST",
		url : "generateRegEx",
		contentType : "application/json",
		dataType : 'text',
		data: JSON.stringify({projectId:id}),
		success : function(response) {
			$("#extractModel").modal('show');
			$("#ShowExtractedData").text(response);
		},
		error:function(response){
			showFileError("Unable to load data.");
		}		
	});
	}
function viewResult(id){
	$.ajax({
		type : "POST",
		url : "getExtractedData",
		contentType : "application/json",
		dataType : 'text',
		data: JSON.stringify({projectId:id}),
		success : function(response) {
			$("#extractModel").modal('show');
			$("#ShowExtractedData").text(response);
		},
		error:function(response){
			showFileError("Unable to load data.");
		}		
	});
	}
</script>