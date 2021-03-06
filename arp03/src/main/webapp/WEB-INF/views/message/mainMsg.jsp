<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/bhead.jsp"%>
<meta charset="UTF-8">
<title>쪽지함</title>

</head>
<body>
<!-- Topbar header - style you can find in pages.scss -->
	<header class="topbar">
		<%@ include file="../include/btopbarheader.jsp"%>
	</header>
	<!-- End Topbar header -->

	<!-- Left-sidebar -->
	<aside class="left-sidebar">
		<%@ include file="../include/bsidebar.jsp"%>
	</aside>
	<!-- End of Left-sidebar -->

<%-- 	<header class="topbar">
		<%@ include file="../include/btopbarheader.jsp"%>
	</header>
	<!-- End Topbar header -->

	<!-- Left-sidebar -->
	<aside class="left-sidebar">
		<%@ include file="../include/bsidebar.jsp"%>
	</aside>
	<!-- End of Left-sidebar -->
	 --%>
	 <div class="page-wrapper">
	    <div class="container-fluid">
	        <div class="row page-titles">
                    <div class="col-md-5 col-12 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">Dashboard</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-12 align-self-center d-none d-md-block">
                        <div class="d-flex mt-2 justify-content-end">
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>THIS MONTH</small></h6>
                                    <h4 class="mt-0 text-info">$58,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="monthchart"></div>
                                </div>
                            </div>
                            <div class="d-flex mr-3 ml-2">
                                <div class="chart-text mr-2">
                                    <h6 class="mb-0"><small>LAST MONTH</small></h6>
                                    <h4 class="mt-0 text-primary">$48,356</h4>
                                </div>
                                <div class="spark-chart">
                                    <div id="lastmonthchart"></div>
                                </div>
                            </div>
                            <div class="">
                                <button
                                    class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right ml-2"><i
                                        class="ti-settings text-white"></i></button>
                            </div>
                        </div>
                    </div>
                </div>

	     
	             <!-- Row -->
                <div class="row">
                

                    <!-- Column -->
                    <div class="col-lg-8 col-md-12">
                        <div class="card">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs profile-tab" role="tablist">
                                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home"
                                        role="tab">Timeline</a>
                                </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile"
                                        role="tab">Profile</a>
                                </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#settings"
                                        role="tab">Settings</a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="home" role="tabpanel">
                                    <div class="card-body">
                                        <!-- <div class="profiletimeline position-relative">
                                            <div class="sl-item mt-2 mb-3">
                                                <div class="sl-left float-left mr-3"> <img
                                                        src="../assets/images/users/1.jpg" alt="user"
                                                        class="rounded-circle"> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link">John Doe</a> <span
                                                            class="sl-date text-muted">5
                                                            minutes ago</span>
                                                        <p>assign a new task <a href="#"> Design weblayout</a></p>
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img1.jpg" alt="user"
                                                                    class="img-fluid rounded"></div>
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img2.jpg" alt="user"
                                                                    class="img-fluid rounded"></div>
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img3.jpg" alt="user"
                                                                    class="img-fluid rounded"></div>
                                                            <div class="col-lg-3 col-md-6 mb-3"><img
                                                                    src="../assets/images/big/img4.jpg" alt="user"
                                                                    class="img-fluid rounded"></div>
                                                        </div>
                                                        <div class="like-comm"> <a href="javascript:void(0)"
                                                                class="link mr-2">2
                                                                comment</a> <a href="javascript:void(0)"
                                                                class="link mr-2"><i
                                                                    class="fa fa-heart text-danger"></i> 5 Love</a>
                                                        </div>
                                                    </div> -->
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="sl-item mt-2 mb-3">
                                                <div class="sl-left float-left mr-3"> 
                                                <img src="../assets/images/users/2.jpg" alt="user" class="rounded-circle">
                                                </div>
                                                <div class="sl-right">
                                                    <div> <a href="#" class="link">John Doe</a> <span
                                                            class="sl-date text-muted">5
                                                            minutes ago</span>
                                                        <div class="mt-3 row">
                                                            <div class="col-md-3 col-xs-12"><img
                                                                    src="../assets/images/big/img1.jpg" alt="user"
                                                                    class="img-fluid rounded"></div>
                                                            <div class="col-md-9 col-xs-12">
                                                                <p> Lorem ipsum dolor sit amet, consectetur adipiscing
                                                                    elit. Integer nec odio. Praesent libero. Sed cursus
                                                                    ante dapibus diam. </p> <a href="#"
                                                                    class="btn btn-success">
                                                                    Design weblayout</a>
                                                            </div>
                                                        </div>
                                                        <div class="like-comm mt-3"> <a href="javascript:void(0)"
                                                                class="link mr-2">2
                                                                comment</a> <a href="javascript:void(0)"
                                                                class="link mr-2"><i
                                                                    class="fa fa-heart text-danger"></i>
                                                                5 Love</a> </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="sl-item mt-2 mb-3">
                                                <div class="sl-left float-left mr-3"> <img
                                                        src="../assets/images/users/3.jpg" alt="user"
                                                        class="rounded-circle"> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link">John Doe</a> <span
                                                            class="sl-date text-muted">5
                                                            minutes ago</span>
                                                        <p class="mt-2"> Lorem ipsum dolor sit amet, consectetur
                                                            adipiscing elit. Integer nec odio. Praesent libero. Sed
                                                            cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh
                                                            elementum imperdiet. Duis sagittis ipsum. Praesent mauris.
                                                            Fusce nec tellus sed augue semper </p>
                                                    </div>
                                                    <div class="like-comm mt-3"> <a href="javascript:void(0)"
                                                            class="link mr-2">2
                                                            comment</a> <a href="javascript:void(0)"
                                                            class="link mr-2"><i class="fa fa-heart text-danger"></i>
                                                            5 Love</a> </div>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="sl-item mt-2 mb-3">
                                                <div class="sl-left float-left mr-3"> <img
                                                        src="../assets/images/users/4.jpg" alt="user"
                                                        class="rounded-circle"> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link">John Doe</a> <span
                                                            class="sl-date text-muted">5
                                                            minutes ago</span>
                                                        <blockquote class="mt-2">
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                            sed do eiusmod tempor incididunt
                                                        </blockquote>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--second tab-->
                                <div class="tab-pane" id="profile" role="tabpanel">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-3 col-xs-6 border-right"> <strong>Full Name</strong>
                                                <br>
                                                <p class="text-muted">Johnathan Deo</p>
                                            </div>
                                            <div class="col-md-3 col-xs-6 border-right"> <strong>Mobile</strong>
                                                <br>
                                                <p class="text-muted">(123) 456 7890</p>
                                            </div>
                                            <div class="col-md-3 col-xs-6 border-right"> <strong>Email</strong>
                                                <br>
                                                <p class="text-muted"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="d9b3b6b1b7b8adb1b8b799b8bdb4b0b7f7bab6b4">[email&#160;protected]</a></p>
                                            </div>
                                            <div class="col-md-3 col-xs-6"> <strong>Location</strong>
                                                <br>
                                                <p class="text-muted">London</p>
                                            </div>
                                        </div>
                                        <hr>
                                        <p class="mt-4">Donec pede justo, fringilla vel, aliquet nec, vulputate eget,
                                            arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.
                                            Nullam dictum felis eu pede mollis pretium. Integer tincidunt.Cras dapibus.
                                            Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo
                                            ligula, porttitor eu, consequat vitae, eleifend ac, enim.</p>
                                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                            Lorem Ipsum has been the industry's standard dummy text ever since the
                                            1500s, when an unknown printer took a galley of type and scrambled it to
                                            make a type specimen book. It has survived not only five centuries </p>
                                        <p>It was popularised in the 1960s with the release of Letraset sheets
                                            containing Lorem Ipsum passages, and more recently with desktop publishing
                                            software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                        <h4 class="font-medium mt-4">Skill Set</h4>
                                        <hr>
                                        <h5 class="mt-4">Wordpress <span class="pull-right">80%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="80"
                                                aria-valuemin="0" aria-valuemax="100" style="width:80%; height:6px;">
                                                <span class="sr-only">50% Complete</span> </div>
                                        </div>
                                        <h5 class="mt-4">HTML 5 <span class="pull-right">90%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-info" role="progressbar" aria-valuenow="90"
                                                aria-valuemin="0" aria-valuemax="100" style="width:90%; height:6px;">
                                                <span class="sr-only">50% Complete</span> </div>
                                        </div>
                                        <h5 class="mt-4">jQuery <span class="pull-right">50%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="50"
                                                aria-valuemin="0" aria-valuemax="100" style="width:50%; height:6px;">
                                                <span class="sr-only">50% Complete</span> </div>
                                        </div>
                                        <h5 class="mt-4">Photoshop <span class="pull-right">70%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="70"
                                                aria-valuemin="0" aria-valuemax="100" style="width:70%; height:6px;">
                                                <span class="sr-only">50% Complete</span> </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="settings" role="tabpanel">
                                    <div class="card-body">
                                        <form class="form-horizontal form-material">
                                            <div class="form-group">
                                                <label class="col-md-12">Full Name</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder="Johnathan Doe"
                                                        class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="example-email" class="col-md-12">Email</label>
                                                <div class="col-md-12">
                                                    <input type="email" placeholder="johnathan@admin.com"
                                                        class="form-control form-control-line" name="example-email"
                                                        id="example-email">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Password</label>
                                                <div class="col-md-12">
                                                    <input type="password" value="password"
                                                        class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Phone No</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder="123 456 7890"
                                                        class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Message</label>
                                                <div class="col-md-12">
                                                    <textarea rows="5"
                                                        class="form-control form-control-line"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-12">Select Country</label>
                                                <div class="col-sm-12">
                                                    <select class="form-control form-control-line">
                                                        <option>London</option>
                                                        <option>India</option>
                                                        <option>Usa</option>
                                                        <option>Canada</option>
                                                        <option>Thailand</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button class="btn btn-success">Update Profile</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
                <!-- Row -->
	     
	 </div>
	 </div>  
<!-- .right-sidebar -->
                <div class="right-sidebar">
                    <div class="slimscrollright">
                        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span>
                        </div>
                        <div class="r-panel-body">
                            <ul id="themecolors" class="mt-3">
                                <li><b>With Light sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default" class="default-theme">1</a></li>
                                <li><a href="javascript:void(0)" data-theme="green" class="green-theme">2</a></li>
                                <li><a href="javascript:void(0)" data-theme="red" class="red-theme">3</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue" class="blue-theme working">4</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple" class="purple-theme">5</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna" class="megna-theme">6</a></li>
                                <li class="d-block mt-4"><b>With Dark sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default-dark"
                                        class="default-dark-theme">7</a></li>
                                <li><a href="javascript:void(0)" data-theme="green-dark" class="green-dark-theme">8</a>
                                </li>
                                <li><a href="javascript:void(0)" data-theme="red-dark" class="red-dark-theme">9</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue-dark" class="blue-dark-theme">10</a>
                                </li>
                                <li><a href="javascript:void(0)" data-theme="purple-dark"
                                        class="purple-dark-theme">11</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna-dark"
                                        class="megna-dark-theme ">12</a></li>
                            </ul>
                            <ul class="mt-3 chatonline">
                                <li><b>Chat option</b></li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/1.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Varun Dhavan <small
                                                class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/2.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Genelia Deshmukh <small
                                                class="text-warning">Away</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/3.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Ritesh Deshmukh <small
                                                class="text-danger">Busy</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/4.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Arijit Sinh <small
                                                class="text-muted">Offline</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/5.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Govinda Star <small
                                                class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/6.jpg" alt="user-img"
                                            class="rounded-circle"> <span>John Abraham<small
                                                class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/7.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Hritik Roshan<small
                                                class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/8.jpg" alt="user-img"
                                            class="rounded-circle"> <span>Pwandeep rajan <small
                                                class="text-success">online</small></span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
</body>



    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="../assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../assets/plugins/popper/popper.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="../assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="../assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</html>