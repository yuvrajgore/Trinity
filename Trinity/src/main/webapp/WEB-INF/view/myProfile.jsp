<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ include file="/WEB-INF/view/common/sidebar.jsp" %>

	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
		
			<!-- END STYLE CUSTOMIZER -->
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
					User Profile <small>user profile sample</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
					
						<li>
							<i class="fa fa-home"></i>
							<a href="index.html">
								Home
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								Extra
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								User Profile
							</a>
						</li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row profile">
				<div class="col-md-12">
					<!--BEGIN TABS-->
					<div class="tabbable tabbable-custom tabbable-full-width">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#tab_1_1" data-toggle="tab">
									 Overview
								</a>
							</li>
							<li>
								<a href="#tab_1_3" data-toggle="tab">
									 Account
								</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab_1_1">
								<div class="row">
									<div class="col-md-3">
										<ul class="list-unstyled profile-nav">
											<li> 
												<div id="showProfilePicture"></div>									
											</li>
										</ul>
									</div>
									<div class="col-md-9">
										<div class="row">
											<div class="col-md-8 profile-info">
												<h1><label id="showUserName" /></h1>
												<p>
													 User Information.
												</p>
											</div>
											<!--end col-md-8-->
								
											<!--end col-md-4-->
										</div>
										<!--end row-->
								
									</div>
								</div>
							</div>
							<!--tab_1_2-->
							<div class="tab-pane" id="tab_1_3">
								<div class="row profile-account">
									<div class="col-md-3">
										<ul class="ver-inline-menu tabbable margin-bottom-10">
											<li class="active">
												<a data-toggle="tab" href="#tab_1-1">
													<i class="fa fa-cog"></i> Personal info
												</a>
												<span class="after">
												</span>
											</li>
											<li>
												<a data-toggle="tab" href="#tab_2-2">
													<i class="fa fa-picture-o"></i> Change Profile Picture
												</a>
											</li>
											<li>
												<a data-toggle="tab" href="#tab_3-3">
													<i class="fa fa-lock"></i> Change Password
												</a>
											</li>
										</ul>
									</div>
									<div class="col-md-9">
										<div class="tab-content">
											<div id="tab_1-1" class="tab-pane active">
												<form role="form" action="#">
													<div class="form-group">
														<label class="control-label">First Name</label>
														<input type="text" placeholder="First Name" class="form-control"/>
													</div>
													<div class="form-group">
														<label class="control-label">Last Name</label>
														<input type="text" placeholder="Last Name" class="form-control"/>
													</div>
													<div class="form-group">
														<label class="control-label">Mobile Number</label>
														<input type="text" placeholder="+91..." class="form-control"/>
													</div>												
													<div class="form-group">
														<label class="control-label">About</label>
														<textarea class="form-control" rows="3" placeholder="I am.......!!!"></textarea>
													</div>
													
													<div class="margiv-top-10">
														<button type="button" id="submitForm" class="btn green">Save Changes</button>
													</div>
												</form>
											</div>
											<div id="tab_2-2" class="tab-pane">
												<p>
													Description.......................
												</p>
												<form id="uploadform">
													<div class="form-group">
														<div class="fileinput fileinput-new" data-provides="fileinput">
															<div  class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
															 <img id="uploadProfileImage" />
															</div>
															<div>
																<span class="btn default btn-file">
																	<span class="fileinput-new">
																		<input type="file" id="uploadProfileFiles" name="file" accept="*" />
																		<input type="text" name="fileName">
																	</span>
																</span>
																
															</div>
														</div>
														<div class="clearfix margin-top-10">
															<span class="label label-danger">
																 NOTE!
															</span>
															<span>
																 The image should be lesst than 3 mb.
															</span>
														</div>
													</div>
													</form>
													<div class="margin-top-10">
														<button type="button" id="submitprofileupload" class="btn green">Submit</button>
														<a href="#" class="btn default">
															 Cancel
														</a>
													</div>
											</div>
											<div id="tab_3-3" class="tab-pane">
												<form action="#">
													<div class="form-group">
														<label class="control-label">Current Password</label>
														<input type="password" class="form-control"/>
													</div>
													<div class="form-group">
														<label class="control-label">New Password</label>
														<input type="password" class="form-control"/>
													</div>
													<div class="form-group">
														<label class="control-label">Re-type New Password</label>
														<input type="password" class="form-control"/>
													</div>
													<div class="margin-top-10">
														<a href="#" class="btn green">
															 Change Password
														</a>
														<a href="#" class="btn default">
															 Cancel
														</a>
													</div>
												</form>
											</div>
											<div id="tab_4-4" class="tab-pane">
												<form action="#">
													<table class="table table-bordered table-striped">
													<tr>
														<td>
															 Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus..
														</td>
														<td>
															<label class="uniform-inline">
															<input type="radio" name="optionsRadios1" value="option1"/>
															Yes </label>
															<label class="uniform-inline">
															<input type="radio" name="optionsRadios1" value="option2" checked/>
															No </label>
														</td>
													</tr>
													<tr>
														<td>
															 Enim eiusmod high life accusamus terry richardson ad squid wolf moon
														</td>
														<td>
															<label class="uniform-inline">
															<input type="checkbox" value=""/> Yes </label>
														</td>
													</tr>
													<tr>
														<td>
															 Enim eiusmod high life accusamus terry richardson ad squid wolf moon
														</td>
														<td>
															<label class="uniform-inline">
															<input type="checkbox" value=""/> Yes </label>
														</td>
													</tr>
													<tr>
														<td>
															 Enim eiusmod high life accusamus terry richardson ad squid wolf moon
														</td>
														<td>
															<label class="uniform-inline">
															<input type="checkbox" value=""/> Yes </label>
														</td>
													</tr>
													</table>
													<!--end profile-settings-->
													<div class="margin-top-10">
														<a href="#" class="btn green">
															 Save Changes
														</a>
														<a href="#" class="btn default">
															 Cancel
														</a>
													</div>
												</form>
											</div>
										</div>
									</div>
									<!--end col-md-9-->
								</div>
							</div>
					
						
							<!--end tab-pane-->
						</div>
					</div>
					<!--END TABS-->
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<script type="text/javascript">
$(document).ready(function(){
		$.ajax({
		    url: "imageDisplay",
		    dataType:'json',
		    type: "POST",
			contentType: "application/json",
			success: function (response) {
				var base64_string=response.data;
				  $("<img>", {
					      "src": "data:image/png;base64," + base64_string,
					      "width": "250px", "height": "250px","class":"img-responsive" })
					    .appendTo("#showProfilePicture"); 
			
		    },
		    error: function () {
		     alert("Unable to load profile picture..");
		    }
		  });
		/*-------------Upload Profile----------------------------------*/
		document.getElementById("uploadProfileFiles").onchange = function () {
		    var reader = new FileReader();
		    reader.onload = function (e) {
		        // get loaded data and render thumbnail.
		       document.getElementById("uploadProfileImage").src = e.target.result;	
		       $("#uploadProfileImage").width(200).height(200);
		    };
		    // read the image file as a data URL.
		    reader.readAsDataURL(this.files[0]);
		};
	/*-----------Submit Profile--------------*/
 	$("#submitprofileupload").click(function(){
 		
 		var formData = new FormData($("#uploadform")[0]);
console.log(formData);
 	    $.ajax({
 	        url:'uploadFile',
 	        type: 'POST',
 	        data: formData,
 	       cache: false,
	        contentType: false,
	        processData: false,
	        enctype: 'multipart/form-data',
 	        success: function (data) {
 	            alert(data);
 	        },
 	        error:function(){
 	        alert("Error");
 	        }
 	        
 	    });

 	    return false;
	}); 
});
</script>
<%@ include file="/WEB-INF/view/common/footer.jsp" %>