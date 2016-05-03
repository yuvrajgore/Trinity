
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<!-- BEGIN HEADER -->
<div class="header navbar navbar-fixed-top">
	<!-- BEGIN TOP NAVIGATION BAR -->
	<div class="header-inner">
		<!-- BEGIN LOGO -->
		<a class="navbar-brand" href="index.html">
			<img src="assets/img/logo.png" alt="logo" class="img-responsive"/>
		</a>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<img src="assets/img/menu-toggler.png" alt=""/>
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<ul class="nav navbar-nav pull-right">
			
			<!-- BEGIN USER LOGIN DROPDOWN -->
			<li class="dropdown user">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" src="assets/img/avatar1_small.jpg"/>
					<span class="username">
						 Yuvraj
					</span>
					<i class="fa fa-angle-down"></i>
				</a>
				<ul class="dropdown-menu">
					<li>
						<a href="myProfile">
							<i class="fa fa-user"></i> My Profile
						</a>
					</li>					
					<li class="divider">
					</li>					
					<li>
						<a href="#">
							<i class="fa fa-key"></i> Log Out
						</a>
					</li>
				</ul>
			</li>
			<!-- END USER LOGIN DROPDOWN -->
		</ul>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
			<!-- add "navbar-no-scroll" class to disable the scrolling of the sidebar menu -->
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
				<li class="sidebar-toggler-wrapper">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone">
					</div>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="sidebar-search-wrapper">
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search" action="extra_search.html" method="POST">
						<div class="form-container">
							<div class="input-box">
								<a href="javascript:;" class="remove">
								</a>
								<input type="text" placeholder="Search..."/>
								<input type="button" class="submit" value=" "/>
							</div>
						</div>
					</form>
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class="start">
					<a href="/trinity/home">
						<i class="fa fa-home"></i>
						<span class="title">
							Dashboard
						</span>
						<span class="selected">
						</span>
					</a>
				</li>
			<li>
					<a href="javascript:;">
						<i class="fa fa-cogs"></i>
						<span class="title">
							Settings
						</span>
						<span class="arrow ">
						</span>
					</a>
					<ul class="sub-menu">
						<li>
							<a href="/trinity/registration">
								<i class="fa fa-user"></i> Users
							</a>
						</li>
					</ul>
				</li>
					<li>
					<a href="javascript:;">
						<i class="fa fa-table"></i>
						<span class="title">
							Trinity
						</span>
						<span class="arrow ">
						</span>
					</a>
					<ul class="sub-menu">
						<li>
							<a href="/trinity/createProject">
								<i class="fa fa-th"></i> Project
							</a>
						</li>
							<li>
							<a href="/trinity/uploadFile">
								<i class="fa fa-folder-open"></i> Upload Files
							</a>
						</li>
						<li>
							<a href="/trinity/regularExpression">
							<i class="fa fa-globe"></i>	Generate RegEx
							</a>
						</li>
					</ul>
				</li>
		<!-- 	<li id="upload">
					<a href="javascript:;">
						<i class="fa fa-folder-open"></i>
						<span class="title">
							Upload file
						</span>
						
					</a>
				
				</li> -->	
				
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->
	
	
	<div id="fileUpload" class="modal fade" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title">
						<b>Upload file</b>
					</h4>
				</div>
				<div class="modal-body">
					<div class="scroller" style="height: 400px" 	data-always-visible="1" data-rail-visible1="1">
						<!-- BEGIN FORM-->
						<div class="alert alert-danger" id="error-alert">
							<button type="button" class="close" data-dismiss="alert">x</button>
							<strong>Error! </strong>
							<label id="errormessage" ></label>
						</div>
						<form action="#" id="userForm" class="form-horizontal">
							<div class="form-body">
								<input type="hidden" id="userId" name="userId">
								<div class="form-group" id="get-files1">
									<label class="label-control col-md-3">Upload File<span class="required"> * </span></label>
									<div class="col-md-9">
										<input type="file" class="file-upload" id="files1" name="file" required/>
										<div class="file_range" id="byte_range1"></div>
  										<div class="file_content" id="byte_content1"></div>
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
	
