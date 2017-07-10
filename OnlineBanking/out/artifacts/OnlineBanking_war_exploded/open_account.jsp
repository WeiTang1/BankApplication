<%--
  Created by IntelliJ IDEA.
  User: Kristian Lucero
  Date: 6/28/2017
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>Bank | Open Account</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css" href="assets/global/plugins/select2/select2.css"/>
	<!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css">
    <link href="assets/global/css/plugins-md.css" rel="stylesheet" type="text/css">
    <link href="assets/admin/layout3/css/layout.css" rel="stylesheet" type="text/css">
    <link href="assets/admin/layout3/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color">
    <link href="assets/admin/layout3/css/custom.css" rel="stylesheet" type="text/css">
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

	<script src ="assets/angular.js" type="text/javascript"></script>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body class="page-md">
<jsp:include page="header.jsp" />
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container">
    <!-- BEGIN PAGE HEAD -->
    <div class="page-head">
        <div class="container">
            <!-- BEGIN PAGE TITLE -->
            <div class="page-title">
                <h1>Open a New Account</h1>
            </div>
            <!-- END PAGE TITLE -->
        </div>
    </div>
    <!-- END PAGE HEAD -->
    <!-- BEGIN PAGE CONTENT -->
    <div class="page-content">
        <div class="container">
            <!-- BEGIN PAGE CONTENT INNER -->
            <div class="row">
                <div class="col-md-5">
					<!-- BEGIN Portlet PORTLET-->
					<div class="portlet light">
						<div class="portlet-title">
							<h4><b>We pre-filled some of the information for you!</b></h4>
						</div>
						<div class="portlet-body" ng-app = "myApp" ng-controller="myController" ng-cloak="">
							 <table>
							 	<thead>
							 		<tr>
							 			<th></th>
							 			<th></th>
							 			<th></th>
							 		</tr>
							 	</thead>
							 	<tbody >
							 		<tr>
							 			<td>
							 				<b>Name</b>
							 			</td>
							 			<td>&emsp;&emsp;</td>
							 			<td id="name" >
											{{usr.firstName+" "+usr.lastName}}
							 			</td>
							 		</tr>
							 		<tr>
							 			<td>
							 				<b>Email Address</b>
							 			</td>
							 			<td>&emsp;&emsp;</td>
							 			<td id="email" ng-cloak>
											{{usr.email}}
							 			</td>
							 		</tr>
							 		<tr>
							 			<td>
							 				<b>Phone Number</b>
							 			</td>
							 			<td>&emsp;&emsp;</td>
							 			<td id="phoneNumber" ng-cloak>
											{{usr.phoneNumber}}
							 			</td>
							 		</tr>
							 		<tr>
							 			<td>
							 				<b>Date of Birth</b>
							 			</td>
							 			<td>&emsp;&emsp;</td>
							 			<td id="dob" ng-cloak>
											{{usr.dateOfBirth}}
							 			</td>
							 		</tr>
							 		<tr>
							 			<td>
							 				<b>Address</b>
							 			</td>
							 			<td>&emsp;&emsp;</td>
							 			<td id="address" ng-cloak>
											{{address.street+", "+address.city+", "+address.state+", "+address.zipCode}}
							 			</td>
							 		</tr>
							 	</tbody>
							 </table>
							 <br>
							 <i>Change this information in your profile settings.</i>
						</div>
					</div>
					<!-- END Portlet PORTLET-->
                </div>
                <div class="col-md-7">
                	<div class="portlet light">
	                		<div class="portlet-body">
		                	<!-- BEGIN FORM-->

							<form action="/OnlineBanking/openaccount/openaccount" method="post" class="form-horizontal">
								<div class="form-body">
									<div class="form-group">
										<label class="col-md-3 control-label">Account Type: </label>
										<div class="col-md-4">
											<div class="input-icon">
												<i class="fa fa-bank"></i>
												<select id = "select" class="form-control input-circle" name="accountType">
													<option selected value="">-- Select Type --</option>

													<span class="help-block"> Select from which account
													</span>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Initial Balance: </label>
										<div class="col-md-4">
											<div class="input-icon">
												<i class="fa fa-dollar"></i>
												<input type="text" class="form-control input-circle" name="initialBalance">
											</div>
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button type="submit" class="btn btn-circle blue">Submit</button>
										</div>
									</div>
								</div>
							</form>
							<!-- END FORM-->
						</div>
					</div>
                </div>
            </div>
            <!-- END PAGE CONTENT INNER -->
        </div>
    </div>
    <!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->
<jsp:include page="footer.jsp" />
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/global/plugins/respond.min.js"></script>
<script src="assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="assets/global/plugins/select2/select2.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/layout.js" type="text/javascript"></script>
<script src="assets/admin/layout3/scripts/demo.js" type="text/javascript"></script>

<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
    });
    $( document ).ready(function() {
        console.log("before ajax");
//        $.ajax({
//			type:'get',
//			accept:'application/json',
//			url:"openaccount/getuserinfo",
//			success:function(data){
//				var user_info = data.entity.entity;
//				var name = user_info.firstName +" "+user_info.lastName;
//				var dob = user_info.dateOfBirth;
//				var email = user_info.email;
//				var phoneNumber = user_info.phoneNumber;
//				var address = user_info.address.street+", "+user_info.address.city+", "+user_info.address.state+", "+user_info.address.zipCode;
//				console.log(name);
//				console.log(dob);
//				console.log(email);
//				console.log(phoneNumber);
//				console.log(address);
//				$("#name").html(name);
//				$("#dob").html(dob);
//				$("#email").html(email);
//				$("#phoneNumber").html(phoneNumber);
//				$("#address").html(address);
//
//			}
//		}).then(function(data){
//
//		})
        $.ajax({
            type:"get",
            url:"openaccount/getAccountType",
            accept:"application/json",
            success:function(data){
                console.log("data");
                console.log(data);
                var types = data.entity.entity;
                $.each(types,function(key,val){
                    var type = val;
                    console.log(type);
                    var id = type.id;
                    var type_description=type.accountType;
            		$("#select").append($('<option>',{
            		    value : id,
						text :type_description
					}));
				})
            }
        })
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>