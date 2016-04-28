<%@ include file="/WEB-INF/view/common/header.jsp" %>
<%@ include file="/WEB-INF/view/common/sidebar.jsp" %>
<div class="page-content-wrapper">
		<div class="page-content">
		<!-- BEGIN BORDERED TABLE PORTLET-->		
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">users Information
								<i class="fa fa-coffee"></i>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
								<a href="#portlet-config" data-toggle="modal" class="config">	</a>
								<a href="javascript:;" class="reload"></a>
								<a href="javascript:;" class="remove">	</a>
							</div>
						</div>
						<div class="portlet-body"><a class="btn btn-success" data-toggle="modal" href="#responsive" style="margin:5px;float:right">Add User</a>
									<!-- /.modal -->
				<div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true"></button>
								<h4 class="modal-title">
									<b>User Registration Form</b>
								</h4>
							</div>
							<div class="modal-body">
								<div class="scroller" style="height: 400px" 	data-always-visible="1" data-rail-visible1="1">
									<!-- BEGIN FORM-->
									<div class="alert alert-danger" id="error-alert">
										<button type="button" class="close" data-dismiss="alert">x</button>
										<strong>Error! </strong><label id="errormessage" />.
									</div>
									<form action="#" id="userForm" class="form-horizontal">
										<div class="form-body">
										<input type="hidden" id="userId" name="userId">
											<div class="form-group">
												<label class="label-control col-md-3">First Name<span class="required"> * </span></label>
												<div class="col-md-9">
													<input type="text" name="firstName" id="firstName" data-required="1" class="form-control" required />
												</div>
											</div>
												<div class="form-group">
												<label class="label-control col-md-3">Last Name<span	class="required"> * </span></label>
												<div class="col-md-9">
													<input type="text" name="lastName" id="lastName" data-required="1" class="form-control" required/>
												</div>
											</div>
												<div class="form-group">
												<label class="label-control col-md-3">User Name<span	class="required"> * </span></label>
												<div class="col-md-9">
													<input type="text" name="userName" id="userName" data-required="1" class="form-control"  required/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 label-control">Email Address<span class="required"> *</span></label>
												<div class="col-md-9">
													<div class="input-group">
														<span class="input-group-addon"><i class="fa fa-envelope"></i></span><input type="email" id="email" 	name="email" class="form-control"	placeholder="Email Address">
													</div>
												</div>
											</div>
												<div class="form-group">
												<label class="label-control col-md-3">User Role<span	class="required"> * </span></label>
												<div class="col-md-9">
													<select name="userRoleId" class="form-control" id="userRoleId">
													<option value="">Select User Role</option>
													</select>
												</div>
											</div>
										</div>
										<div class="form-actions fluid">
											<div class="col-md-offset-3 col-md-9">
												<button type="button" id="submitForm" class="btn green">Submit</button>
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
				<div class="alert alert-success" id="success-alert">
										<button type="button" class="close" data-dismiss="alert">x</button>
										<strong>Success! </strong><label id="successmessage" />.
									</div>
							<table id="userList" class="table table-striped table-bordered table-advance table-hover">
								<thead>
								
								<tr>
									<th>
										 Sr.No.
									</th>
									<th>
										 First Name
									</th>
									<th>
										 Last Name
									</th>
									<th>
										 Username
									</th>
									<th>
										 Action
									</th>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END BORDERED TABLE PORTLET-->
		
			</div>
	</div>
	<!-- END CONTENT -->

<%@ include file="/WEB-INF/view/common/footer.jsp" %>