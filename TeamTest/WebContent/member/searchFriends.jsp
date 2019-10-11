<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />

<title>Winku Social Network Toolkit</title>

<link rel="icon" href="../images/fav.png" type="image/png" sizes="16x16">
<link rel="stylesheet" href="../css/main.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/color.css">
<link rel="stylesheet" href="../css/responsive.css">
</head>
<body>

	<!--<div class="se-pre-con"></div>-->
	<div class="theme-layout">

		<%-- <jsp:include page="../inc/responsiveTop.jsp" /> --%>
		<jsp:include page="../inc/webTop.jsp" />

		<!-- <section>
			<div class="page-header">
				<div class="header-inner">
					<h2>your Searched Groups</h2>
					<nav class="breadcrumb">
						<a href="index.html" class="breadcrumb-item"><i
							class="fa fa-home"></i></a> <span class="breadcrumb-item active">Groups</span>
					</nav>
				</div>
			</div>
		</section> -->

		<section>
			<div class="gap gray-bg">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="row merged20" id="page-contents">
								<div class="col-lg-3">
									<aside class="sidebar static">
										<!-- shortcuts -->
										<jsp:include page="../inc/shortcuts.jsp" />
										<!-- /shortcuts -->
									</aside>
								</div>
								<!-- sidebar -->
								<div class="col-lg-6">
									<div class="central-meta">
										<div class="groups">
											<span><i class="fa fa-users"></i> Groups</span>
										</div>
										<ul class="nearby-contct">
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img
															src="../images/resources/group1.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4>
															<a href="time-line.html" title="">funparty</a>
														</h4>
														<span>public group</span> <em>32k Members</em> <a href="#"
															title="" class="add-butn" data-ripple="">join now</a>
													</div>
												</div>
											</li>
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img
															src="../images/resources/group2.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4>
															<a href="time-line.html" title="">ABC News</a>
														</h4>
														<span>Private group</span> <em>5M Members</em> <a href="#"
															title="" class="add-butn" data-ripple="">join now</a>
													</div>
												</div>
											</li>
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img
															src="../images/resources/group3.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4>
															<a href="time-line.html" title="">SEO Zone</a>
														</h4>
														<span>Public group</span> <em>32k Members</em> <a href="#"
															title="" class="add-butn" data-ripple="">join now</a>
													</div>
												</div>
											</li>
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img
															src="../images/resources/group4.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4>
															<a href="time-line.html" title="">Max Us</a>
														</h4>
														<span>Public group</span> <em> 756 Members</em> <a
															href="#" title="" class="add-butn" data-ripple="">join
															now</a>
													</div>
												</div>
											</li>
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img
															src="../images/resources/group5.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4>
															<a href="time-line.html" title="">Banana Group</a>
														</h4>
														<span>Friends Group</span> <em>32k Members</em> <a
															href="#" title="" class="add-butn" data-ripple="">join
															now</a>
													</div>
												</div>
											</li>
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img
															src="../images/resources/group6.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4>
															<a href="time-line.html" title="">Bad boys n Girls</a>
														</h4>
														<span>Public group</span> <em>32k Members</em> <a href="#"
															title="" class="add-butn" data-ripple="">join now</a>
													</div>
												</div>
											</li>
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img
															src="../images/resources/group7.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4>
															<a href="time-line.html" title="">bachelor's fun</a>
														</h4>
														<span>Public Group</span> <em>500 Members</em> <a href="#"
															title="" class="add-butn" data-ripple="">join now</a>
													</div>
												</div>
											</li>
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img
															src="../images/resources/group4.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4>
															<a href="time-line.html" title="">Max Us</a>
														</h4>
														<span>Public group</span> <em> 756 Members</em> <a
															href="#" title="" class="add-butn" data-ripple="">join
															now</a>
													</div>
												</div>
											</li>
											<li>
												<div class="nearly-pepls">
													<figure>
														<a href="time-line.html" title=""><img
															src="../images/resources/group3.jpg" alt=""></a>
													</figure>
													<div class="pepl-info">
														<h4>
															<a href="time-line.html" title="">SEO Zone</a>
														</h4>
														<span>Public group</span> <em>32k Members</em> <a href="#"
															title="" class="add-butn" data-ripple="">join now</a>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<!-- photos -->
								</div>
								<!-- centerl meta -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<jsp:include page="../inc/bottom.jsp" />
	</div>
	<div class="side-panel">
		<jsp:include page="../inc/webTopRightSidePanel.jsp" />
	</div>
	<!-- side panel -->

	<script src="../js/main.min.js"></script>
	<script src="../js/script.js"></script>
	<script src="../js/map-init.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8c55_YHLvDHGACkQscgbGLtLRdxBDCfI"></script>

</body>
</html>