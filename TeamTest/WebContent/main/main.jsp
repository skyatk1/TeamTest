<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />

<title>Winku Social Network Toolkit</title>

<link rel="icon" href="./images/fav.png" type="image/png" sizes="16x16">
<link rel="stylesheet" href="./css/main.min.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/color.css">
<link rel="stylesheet" href="./css/responsive.css">

<script type="text/javascript">

</script>
</head>
<body>
<%
	String email = (String) session.getAttribute("email");
	int m_num = (int) session.getAttribute("m_num");
	
	System.out.println("main.jsp - email : " + email);
	System.out.println("main.jsp - m_num : " + m_num);

	if (email == null) {
		response.sendRedirect("././Login.me");
	}
%>
	<!--<div class="se-pre-con"></div>-->
	<div class="theme-layout">
		<div class="postoverlay"></div>
		<div class="menuoverlay"></div>

		<!-- 모바일 상단 -->
		<jsp:include page="../inc/responsiveTop.jsp" />
		<!-- /모바일 상단 -->

		<!-- 웹페이지 상단 -->
		<jsp:include page="../inc/webTop.jsp" />
		<!-- /웹페이지 상단 -->

		<!-- 웹페이지 오른쪽 채팅 바 -->
		<div class="fixed-sidebar right">
			<div class="chat-friendz">
				<ul class="chat-users">
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend1.jpg" alt="">
							<span class="status f-online"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend2.jpg" alt="">
							<span class="status f-away"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend3.jpg" alt="">
							<span class="status f-online"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend4.jpg" alt="">
							<span class="status f-offline"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend5.jpg" alt="">
							<span class="status f-online"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend6.jpg" alt="">
							<span class="status f-online"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend7.jpg" alt="">
							<span class="status f-offline"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend8.jpg" alt="">
							<span class="status f-online"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend9.jpg" alt="">
							<span class="status f-away"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend10.jpg" alt="">
							<span class="status f-away"></span>
						</div>
					</li>
					<li>
						<div class="author-thmb">
							<img src="./images/resources/side-friend8.jpg" alt="">
							<span class="status f-online"></span>
						</div>
					</li>
				</ul>
				<div class="chat-box">
					<div class="chat-head">
						<span class="status f-online"></span>
						<h6>Bucky Barnes</h6>
						<div class="more">
							<span class="more-optns"><i class="ti-more-alt"></i>
								<ul>
									<li>block chat</li>
									<li>unblock chat</li>
									<li>conversation</li>
								</ul>
							</span>
							<span class="close-mesage"><i class="ti-close"></i></span>
						</div>
					</div>
					<div class="chat-list">
						<ul>
							<li class="me">
								<div class="chat-thumb">
									<img src="./images/resources/chatlist1.jpg" alt="">
								</div>
								<div class="notification-event">
									<span class="chat-message-item">
										Hi James! Please
										remember to buy the food for tomorrow! I’m gonna be handling
										the gifts and Jake’s gonna get the drinks
									</span>
									<span class="notification-date">
										<time datetime="2004-07-24T18:18" class="entry-date updated">
											Yesterday at 8:10pm
										</time>
									</span>
								</div>
							</li>
							<li class="you">
								<div class="chat-thumb">
									<img src="./images/resources/chatlist2.jpg" alt="">
								</div>
								<div class="notification-event">
									<span class="chat-message-item">
										Hi James! Please
										remember to buy the food for tomorrow! I’m gonna be handling
										the gifts and Jake’s gonna get the drinks
									</span>
									<span class="notification-date">
										<time datetime="2004-07-24T18:18" class="entry-date updated">
											Yesterday at 8:10pm
										</time>
									</span>
								</div>
							</li>
							<li class="me">
								<div class="chat-thumb">
									<img src="./images/resources/chatlist1.jpg" alt="">
								</div>
								<div class="notification-event">
									<span class="chat-message-item">
										Hi James! Please
										remember to buy the food for tomorrow! I’m gonna be handling
										the gifts and Jake’s gonna get the drinks
									</span>
									<span class="notification-date">
										<time datetime="2004-07-24T18:18" class="entry-date updated">
										Yesterday at 8:10pm
										</time>
									</span>
								</div>
							</li>
						</ul>
						<form class="text-box">
							<textarea placeholder="Post enter to post..."></textarea>
							<div class="add-smiles">
								<span title="add icon" class="em em-expressionless"></span>
							</div>
							<div class="smiles-bunch">
								<i class="em em---1"></i>
								<i class="em em-smiley"></i>
								<i class="em em-anguished"></i>
								<i class="em em-laughing"></i>
								<i class="em em-angry"></i>
								<i class="em em-astonished"></i>
								<i class="em em-blush"></i>
								<i class="em em-disappointed"></i>
								<i class="em em-worried"></i>
								<i class="em em-kissing_heart"></i>
								<i class="em em-rage"></i>
								<i class="em em-stuck_out_tongue"></i>
							</div>
							<button type="submit"></button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<section>
		<div class="gap2 gray-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="row merged20" id="page-contents">
							<!-- 왼쪽 사이드 -->
							<div class="col-lg-3">
								<aside class="sidebar static left">
								
									<!-- Shortcuts -->
									<jsp:include page="../inc/shortcuts.jsp" />
									<!-- /Shortcuts -->
									
									<!-- Who's follownig -->
									<div class="widget stick-widget">
										<h4 class="widget-title">Who's follownig</h4>
										<ul class="followers">
											<li>
												<figure>
													<img src="./images/resources/friend-avatar2.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">Kelly Bill</a>
													</h4>
													<a href="#" title="" class="underline">Add Friend</a>
												</div>
											</li>
											<li>
												<figure>
													<img src="./images/resources/friend-avatar4.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">Issabel</a>
													</h4>
													<a href="#" title="" class="underline">Add Friend</a>
												</div>
											</li>
											<li>
												<figure>
													<img src="./images/resources/friend-avatar6.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">Andrew</a>
													</h4>
													<a href="#" title="" class="underline">Add Friend</a>
												</div>
											</li>
											<li>
												<figure>
													<img src="./images/resources/friend-avatar8.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">Sophia</a>
													</h4>
													<a href="#" title="" class="underline">Add Friend</a>
												</div>
											</li>
											<li>
												<figure>
													<img src="./images/resources/friend-avatar3.jpg" alt="">
												</figure>
												<div class="friend-meta">
													<h4>
														<a href="time-line.html" title="">Allen</a>
													</h4>
													<a href="#" title="" class="underline">Add Friend</a>
												</div>
											</li>
										</ul>
									</div>
									<!-- /who's following -->
								</aside>
							</div>
							<!-- /왼쪽 사이드 -->
							
							<!-- 중간 -->
							<div class="col-lg-6">
								<!-- 글 작성 -->
								<jsp:include page="../board/write3.jsp" />
								<!-- /글 작성 -->

								<!-- 뉴스피드 -->
								<div class="loadMore">
									<!-- 게시글1 -->
									<jsp:include page="../board/boardList2.jsp" />
									<!-- /게시글1 -->
								</div>
							</div>
							<!-- /중간 -->

							<!-- 오른쪽  -->
							<div class="col-lg-3">
								<aside class="sidebar static right">
									<div class="widget">
										<h4 class="widget-title">Your page</h4>
										<div class="your-page">
											<figure>
												<a href="#" title="">
													<img src="./images/resources/friend-avatar9.jpg" alt="">
												</a>
											</figure>
											<div class="page-meta">
												<a href="#" title="" class="underline">My page</a>
												<span>
													<i class="ti-comment"></i>
													<a href="insight.html" title="">Messages<em>9</em></a>
												</span>
												<span>
													<i class="ti-bell"></i>
													<a href="insight.html" title="">Notifications <em>2</em></a>
												</span>
											</div>
											<div class="page-likes">
												<ul class="nav nav-tabs likes-btn">
													<li class="nav-item">
														<a class="active" href="#link1"data-toggle="tab">likes</a>
													</li>
													<li class="nav-item">
														<a class="" href="#link2" data-toggle="tab">views</a>
													</li>
												</ul>
												<!-- Tab panes -->
												<div class="tab-content">
													<div class="tab-pane active fade show " id="link1">
														<span>
															<i class="ti-heart"></i>884
														</span>
														<a href="#" title="weekly-likes">35 new likes this week</a>
														<div class="users-thumb-list">
															<a href="#" title="Anderw" data-toggle="tooltip">
																<img src="./images/resources/userlist-1.jpg" alt="">
															</a>
															<a href="#" title="frank" data-toggle="tooltip">
																<img src="./images/resources/userlist-2.jpg" alt="">
															</a>
															<a href="#" title="Sara" data-toggle="tooltip">
																<img src="./images/resources/userlist-3.jpg" alt="">
															</a>
															<a href="#" title="Amy" data-toggle="tooltip">
																<img src="./images/resources/userlist-4.jpg" alt="">
															</a>
															<a href="#" title="Ema" data-toggle="tooltip">
																<img src="./images/resources/userlist-5.jpg" alt="">
															</a>
															<a href="#" title="Sophie" data-toggle="tooltip">
																<img src="./images/resources/userlist-6.jpg" alt="">
															</a>
															<a href="#" title="Maria" data-toggle="tooltip">
																<img src="./images/resources/userlist-7.jpg" alt="">
															</a>
														</div>
													</div>
													<div class="tab-pane fade" id="link2">
														<span>
															<i class="ti-eye"></i>440
														</span>
														<a href="#" title="weekly-likes">440 new views this week</a>
														<div class="users-thumb-list">
															<a href="#" title="Anderw" data-toggle="tooltip">
																<img src="./images/resources/userlist-1.jpg" alt="">
															</a> <a href="#" title="frank" data-toggle="tooltip">
																<img src="./images/resources/userlist-2.jpg" alt="">
															</a>
															<a href="#" title="Sara" data-toggle="tooltip">
																<img src="./images/resources/userlist-3.jpg" alt="">
															</a>
															<a href="#" title="Amy" data-toggle="tooltip">
																<img src="./images/resources/userlist-4.jpg" alt="">
															</a> <a href="#" title="Ema" data-toggle="tooltip">
																<img src="./images/resources/userlist-5.jpg" alt="">
															</a> <a href="#" title="Sophie" data-toggle="tooltip">
																<img src="./images/resources/userlist-6.jpg" alt="">
															</a> <a href="#" title="Maria" data-toggle="tooltip">
																<img src="./images/resources/userlist-7.jpg" alt="">
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- page like widget -->
									<div class="widget">
										<div class="banner medium-opacity bluesh">
											<div class="bg-image"
												style="background-image: url(./images/resources/baner-widgetbg.jpg)"></div>
											<div class="baner-top">
												<span><img alt="" src="./images/book-icon.png"></span>
												<i class="fa fa-ellipsis-h"></i>
											</div>
											<div class="banermeta">
												<p>create your own favourit page.</p>
												<span>like them all</span>
												<a data-ripple="" title="" href="#">start now!</a>
											</div>
										</div>
									</div>
									<div class="widget stick-widget">
										<h4 class="widget-title">Profile intro</h4>
										<ul class="short-profile">
											<li>
												<span>about</span>
												<p>Hi, i am jhon kates, i am 32 years old and worked as a web developer in microsoft</p>
											</li>
											<li>
												<span>fav tv show</span>
												<p>Sacred Games, Spartcus Blood, Games of Theron</p>
											</li>
											<li>
												<span>favourit music</span>
												<p>Justin Biber, Shakira, Nati Natasah</p>
											</li>
										</ul>
									</div>
								</aside>
							</div>
							<!-- /오른쪽 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		
		<!-- bottom -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- /bottom -->
	</div>
	
	<!-- 웹페이지 쇼핑백 메뉴 -->
	<div class="side-panel">
		<jsp:include page="../inc/webTopRightSidePanel.jsp" />
	</div>
	<!-- 웹페이지 쇼핑백 메뉴 -->

	<script src="./js/main.min.js"></script>
	<script src="./js/script.js"></script>
	<script src="./js/map-init.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8c55_YHLvDHGACkQscgbGLtLRdxBDCfI"></script>

</body>
</html>