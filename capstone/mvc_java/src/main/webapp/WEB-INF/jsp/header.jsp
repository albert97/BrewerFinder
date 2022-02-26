<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="applicationPath" value="${pageContext.request.getContextPath()}"/>
<c:set var="baseUrl" value="${scheme}://${serverName}:${serverPort}/${applicationPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Team Capstone Columbus Tech Start">

	<title>Capstone Project - Dashboard</title>

	<!-- Custom fonts for this template-->
	<link href="${baseUrl}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="${baseUrl}/css/sb-admin-2.min.css" rel="stylesheet"/>
	<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet"/>

	<!-- Custom styles for this project-->
	<link href="${baseUrl}/css/site.css" rel="stylesheet"/>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

	<!-- Sidebar -->
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
			<div class="sidebar-brand-icon">
				<c:url var="logoImageUrl" value="/img/logo.png" />
				<img src="${logoImageUrl}" />
			</div>
			<div class="sidebar-brand-text mx-3">Tech Start <sup>2020</sup></div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Sidebar - Dashboard -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${baseUrl}//user/dashboard">
			<div class="sidebar-brand-icon rotate-n-15">
				<c:url var="dashboardImageUrl" value="/img/dashboard.png" />
				<img src="${dashboardImageUrl}" />
			</div>
			<div class="sidebar-brand-text mx-3">Dashboard</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">
			Site Access
		</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
				<i class="fas fa-fw fa-folder"></i>
				<span>Access Pages</span>
			</a>
			<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Login Screens:</h6>
					<c:if test="${LOGGED_USER == null}">
						<a class="collapse-item" href="${baseUrl}/login">Login</a>
					</c:if>
					<a class="collapse-item" href="${baseUrl}/register">Register</a>
					<div class="collapse-divider"></div>
					<h6 class="collapse-header">Other Pages:</h6>
					<a class="collapse-item" href="${baseUrl}/404">404 Page</a>
					<a class="collapse-item" href="${baseUrl}/error">Error Page</a>
					<a class="collapse-item" href="${baseUrl}/blank">Blank Page</a>
				</div>
			</div>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">
			Content Examples
		</div>

		<!-- Nav Item - Tables -->
		<li class="nav-item">
			<a class="nav-link" href="${baseUrl}/basic/table">
				<i class="fas fa-fw fa-table"></i>
				<span>Basic Table</span></a>
		</li>
		<c:if test="${LOGGED_USER.role == 'CUSTOMER'}">
        <li class="nav-item">
            <a class="nav-link" href="${baseUrl}/rest/table">
                <i class="fas fa-fw fa-table"></i>
                <span>REST Table</span></a>
        </li>
		</c:if>
		<li class="nav-item">
			<a class="nav-link" href="${baseUrl}/cards">
				<i class="fas fa-fw fa-sd-card"></i>
				<span>Cards</span></a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${baseUrl}/buttons">
				<i class="fas fa-fw fa-bullseye"></i>
				<span>Buttons</span></a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${baseUrl}/accordion">
				<i class="fas fa-fw fa-bullseye"></i>
				<span>Accordion</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">
			Addons
		</div>

		<!-- Nav Item - Charts -->
		<li class="nav-item">
			<a class="nav-link" href="${baseUrl}/charts">
				<i class="fas fa-fw fa-chart-area"></i>
				<span>Charts</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar -->

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Topbar Search -->
				<form  method="GET" action="${baseUrl}//user/search" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" name="searchText" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary"  type="submit">
								<c:url var="searchImageUrl" value="/img/searchIcon.png" />
								<img src="${searchImageUrl}" />
							</button>
						</div>
					</div>
				</form>

				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - Alerts -->
					<li class="nav-item dropdown no-arrow mx-1">
						<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<c:url var="alertImageUrl" value="/img/alert.png" />
							<img src="${alertImageUrl}" />
							<!-- Counter - Alerts -->
							<span class="badge badge-danger badge-counter">3+</span>
						</a>
						<!-- Dropdown - Alerts -->
						<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
							<h6 class="dropdown-header">
								Alerts Center
							</h6>
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-primary">
										<i class="fas fa-file-alt text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">December 12, 2019</div>
									<span class="font-weight-bold">A new monthly report is ready to download!</span>
								</div>
							</a>
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-success">
										<i class="fas fa-donate text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">December 7, 2019</div>
									$290.29 has been deposited into your account!
								</div>
							</a>
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-warning">
										<i class="fas fa-exclamation-triangle text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">December 2, 2019</div>
									Spending Alert: We've noticed unusually high spending for your account.
								</div>
							</a>
							<a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
						</div>
					</li>

					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="mr-2 d-none d-lg-inline text-gray-600 small">Carrie Capstone</span>
							<img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
						</a>
						<!-- Dropdown - User Information -->
						<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
							<a class="dropdown-item" href="#">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
								Profile
							</a>
							<a class="dropdown-item" href="#">
								<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
								Settings
							</a>
							<a class="dropdown-item" href="#">
								<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
								Activity Log
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								Logout
							</a>
						</div>
					</li>

				</ul>

			</nav>
			<!-- End of Topbar -->
