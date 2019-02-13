<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a href="#" class="navbar-brand">Dashboard</a>
			<button type="button" aria-controls="navigation-index"
				aria-expanded="false" aria-label="Toggle navigation"
				class="navbar-toggler navbar-toggler-right">
				<span class="navbar-toggler-bar burger-lines"></span> <span
					class="navbar-toggler-bar burger-lines"></span> <span
					class="navbar-toggler-bar burger-lines"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end">
				<ul class="nav navbar-nav mr-auto">
					<li class="nav-item"><a href="#" data-toggle="dropdown"
						class="nav-link"><i class="nc-icon nc-palette"></i></a></li>
					<li data-v-04d9fc75="" aria-haspopup="true"
						class="dropdown nav-item"><a data-v-04d9fc75=""
						data-toggle="dropdown" class="nav-link dropdown-toggle"><i
							data-v-04d9fc75="" class="nc-icon nc-planet"></i> <b
							data-v-04d9fc75="" class="caret"></b> <span data-v-04d9fc75=""
							class="notification">5</span></a>
						<div data-v-04d9fc75="" class="dropdown-menu"
							style="display: none;">
							<a data-v-04d9fc75="" href="#" class="dropdown-item">Notification
								1</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Notification
								2</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Notification
								3</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Notification
								4</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Another
								notification</a>
						</div></li>
					<li class="nav-item"><a href="#" class="nav-link"><i
							class="nc-icon nc-zoom-split"></i> <span class="d-lg-block">&nbsp;Search</span></a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="#" class="nav-link"> Account
					</a></li>
					<li data-v-04d9fc75="" aria-haspopup="true"
						class="dropdown nav-item"><a data-v-04d9fc75=""
						data-toggle="dropdown" class="nav-link dropdown-toggle"><i
							data-v-04d9fc75=""></i> <span data-v-04d9fc75="" class="no-icon">Dropdown</span>
							<b data-v-04d9fc75="" class="caret"></b></a>
						<div data-v-04d9fc75="" class="dropdown-menu"
							style="display: none;">
							<a data-v-04d9fc75="" href="#" class="dropdown-item">Action</a> <a
								data-v-04d9fc75="" href="#" class="dropdown-item">Another
								action</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Something</a>
							<a data-v-04d9fc75="" href="#" class="dropdown-item">Another
								action</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Something</a>
							<div data-v-04d9fc75="" class="divider"></div>
							<a data-v-04d9fc75="" href="#" class="dropdown-item">Separated
								link</a>
						</div></li>
					<li class="nav-item"><a href="#" class="nav-link"> Log out
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div data-color="black" data-image="static/img/sidebar-5.jpg"
		class="sidebar"
		style="background-image: url(&quot;static/img/sidebar-5.jpg&quot;);">
		<div class="sidebar-wrapper">
			<div class="logo">
				<a href="#" class="simple-text"><div class="logo-img">
						<img src="static/img/vue-logo.png" alt="">
					</div> Vue LBD </a>
			</div>
			<ul class="nav nav-mobile-menu">
				<li data-v-04d9fc75="" aria-haspopup="true"
					class="dropdown nav-item"><a data-v-04d9fc75=""
					data-toggle="dropdown" class="nav-link dropdown-toggle"><i
						data-v-04d9fc75="" class="fa fa-globe"></i> <b data-v-04d9fc75=""
						class="caret"></b> <span data-v-04d9fc75="" class="notification">5
							Notifications</span></a>
					<div data-v-04d9fc75="" class="dropdown-menu"
						style="display: none;">
						<a data-v-04d9fc75="" href="#" class="dropdown-item">Notification
							1</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Notification
							2</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Notification
							3</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Notification
							4</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Another
							notification</a>
					</div></li>
				<li class="nav-item"><a href="#" class="nav-link"><i
						class="nc-icon nc-zoom-split hidden-lg-up"></i> <span
						class="d-lg-none">Search</span></a></li>
				<li data-v-04d9fc75="" aria-haspopup="true"
					class="dropdown nav-item"><a data-v-04d9fc75=""
					data-toggle="dropdown" class="nav-link dropdown-toggle"><i
						data-v-04d9fc75=""></i> <span data-v-04d9fc75="" class="no-icon">Dropdown</span>
						<b data-v-04d9fc75="" class="caret"></b></a>
					<div data-v-04d9fc75="" class="dropdown-menu"
						style="display: none;">
						<a data-v-04d9fc75="" href="#" class="dropdown-item">Action</a> <a
							data-v-04d9fc75="" href="#" class="dropdown-item">Another
							action</a> <a data-v-04d9fc75="" href="#" class="dropdown-item">Something</a>
						<a data-v-04d9fc75="" href="#" class="dropdown-item">Something
							else here</a>
						<div data-v-04d9fc75="" class="divider"></div>
						<a data-v-04d9fc75="" href="#" class="dropdown-item">Separated
							link</a>
					</div></li>
				<li class="nav-item"><a href="#pablo" class="nav-link"><span
						class="no-icon">Log out</span></a></li>
			</ul>
			<ul class="nav">
				<li class="router-link-exact-active nav-item active"><a
					href="#/admin/overview" class="nav-link"><i
						class="nc-icon nc-chart-pie-35"></i>
						<p>Dashboard</p></a></li>
				<li class=""><a href="#/admin/user" class="nav-link"><i
						class="nc-icon nc-circle-09"></i>
						<p>User Profile</p></a></li>
				<li class=""><a href="#/admin/table-list" class="nav-link"><i
						class="nc-icon nc-notes"></i>
						<p>Table list</p></a></li>
				<li class=""><a href="#/admin/typography" class="nav-link"><i
						class="nc-icon nc-paper-2"></i>
						<p>Typography</p></a></li>
				<li class=""><a href="#/admin/icons" class="nav-link"><i
						class="nc-icon nc-atom"></i>
						<p>Icons</p></a></li>
				<li class=""><a href="#/admin/maps" class="nav-link"><i
						class="nc-icon nc-pin-3"></i>
						<p>Maps</p></a></li>
				<li class=""><a href="#/admin/notifications" class="nav-link"><i
						class="nc-icon nc-bell-55"></i>
						<p>Notifications</p></a></li>
			</ul>
		</div>
	</div>
</body>
</html>