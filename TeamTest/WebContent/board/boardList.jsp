<%@page import="java.util.ArrayList"%>
<%@page import="sns.member.db.MemberDTO"%>
<%@page import="sns.member.db.MemberDAO"%>
<%@page import="sns.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="sns.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/style.css">  
<script type="text/javascript">



</script>
<%
	String email = (String) session.getAttribute("email");

	// 글정보 가져오기
	BoardDAO bdao = new BoardDAO();
	List<BoardDTO> boardList = bdao.selectBoard(email);
	
	// 회원 정보 가져오기
	MemberDAO mdao = new MemberDAO();
	MemberDTO mdto = mdao.getProfile(email);

	if (boardList.size() == 0) {
		out.print("게시물 없음");
	} else {
		for (int i = 0; i < boardList.size(); i++) {
			BoardDTO bdto = boardList.get(i);
			
			// 이미지 리스트
			String[] imgs = null;
			
			// 넘어온 이미지, 동영상 수
			int imgCnt = 0;
			int videoCnt = 0;
			
			if (bdto.getImg() != null) {
				imgs = new String[5];
				imgs = bdto.getImg().split(",");
				imgCnt = imgs.length;
			}
%>
<div class="central-meta item">
	<div class="user-post">
		<div class="friend-info">
			<!-- 게시글의 작성자 사진 -->
			<figure>
				<img class="boardImg" src="./upload/member/<%=mdto.getProfile() %>" alt="">
			</figure>
			<!-- /게시글의 작성자 사진 -->

			<!-- 게시글의 작성자 이름/날짜정보 -->
			<div class="friend-name">
				<ins>
					<a href="time-line.html" title=""><%=mdto.getF_name() %> <%=mdto.getL_name() %></a>
				</ins>
				<span><%=bdto.getB_date() %>!!</span>
			</div>
			<!-- /게시글의 작성자 이름/날짜정보 -->

			<!-- 게시글 내용 -->
			<!-- 게시글 content -->
			<div class="description">
				<pre><%=bdto.getB_content().replace("\r\n", "<br>")%></pre>
			</div>
			<!-- /게시글 content -->
			<!-- 사진, vedio -->
			<div class="post-meta boardImg<%=imgCnt %> boardVideo">
		<%
			if (imgs != null) {
				for (int j = 0; j < imgCnt; j++) {
		%>
				<img src="./upload/board_img/<%=imgs[j] %>" alt="">
		<%				
				}
			} else {
				
			}
		
			if (bdto.getVideo() != null) {
		%>
				<iframe width="" height="285"
					src="./upload/board_video/<%=bdto.getVideo() %>"
					frameborder="0" allowfullscreen>
				</iframe>
		<%
			}
		%>
				<!-- 조회수, 답글수, 좋아요, 싫어요, 공유 -->
				<div class="we-video-info">
					<ul>
						<li>
							<span class="comment" data-toggle="tooltip" title="Comments">
								<i class="fa fa-comments-o"></i> <ins><%=bdto.getCommCount() %></ins>
							</span>
						</li>
						<li>
							<span class="like" data-toggle="tooltip" title="like">
								<i class="ti-heart"></i> <ins><%=bdto.getB_like() %></ins>
							</span>
						</li>
							<li class="social-media">
								<div class="menu">
									<div class="btn trigger">
										<i class="fa fa-share-alt"></i>
									</div>
									<div class="rotater">
										<div class="btn btn-icon">
											<a href="#" title=""><i class="fa fa-html5"></i></a>
										</div>
									</div>
									<div class="rotater">
										<div class="btn btn-icon">
											<a href="#" title=""><i class="fa fa-facebook"></i></a>
										</div>
									</div>
									<div class="rotater">
										<div class="btn btn-icon">
											<a href="#" title=""><i class="fa fa-google-plus"></i></a>
										</div>
									</div>
									<div class="rotater">
										<div class="btn btn-icon">
											<a href="#" title=""><i class="fa fa-twitter"></i></a>
										</div>
									</div>
									<div class="rotater">
										<div class="btn btn-icon">
											<a href="#" title=""><i class="fa fa-css3"></i></a>
										</div>
									</div>
									<div class="rotater">
										<div class="btn btn-icon">
											<a href="#" title=""><i class="fa fa-instagram"></i></a>
										</div>
									</div>
									<div class="rotater">
										<div class="btn btn-icon">
											<a href="#" title=""><i class="fa fa-dribbble"></i></a>
										</div>
									</div>
									<div class="rotater">
										<div class="btn btn-icon">
											<a href="#" title=""><i class="fa fa-pinterest"></i></a>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- /조회수, 답글수, 좋아요, 싫어요, 공유 -->
				</div>
				<!-- /게시글 내용 -->
			</div>
			<!-- 댓글 -->
			<div class="coment-area">
				<ul class="we-comet">
					<li>
						<div class="comet-avatar">
							<img src="./images/resources/comet-1.jpg" alt="">
						</div>
						<div class="we-comment">
							<div class="coment-head">
								<h5>
									<a href="time-line.html" title="">Jason borne</a>
								</h5>
								<span>1 year ago</span>
								<a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
							</div>
							<p>
								we are working for the dance and sing songs.
								this car is very awesome for the youngster.
								please vote this car and like our post
							</p>
						</div>
						<ul>
							<li>
								<div class="comet-avatar">
									<img src="./images/resources/comet-2.jpg" alt="">
								</div>
								<div class="we-comment">
									<div class="coment-head">
										<h5>
											<a href="time-line.html" title="">alexendra dadrio</a>
										</h5>
										<span>1 month ago</span>
										<a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
									</div>
									<p>
										yes, really very awesome car i see the features of
										this car in the official website of
										<a href="#" title="">#Mercedes-Benz</a> and really impressed :-)
									</p>
								</div>
							</li>
							<li>
								<div class="comet-avatar">
									<img src="./images/resources/comet-3.jpg" alt="">
								</div>
								<div class="we-comment">
									<div class="coment-head">
										<h5>
											<a href="time-line.html" title="">Olivia</a>
										</h5>
										<span>16 days ago</span>
										<a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
									</div>
									<p>
										i like lexus cars, lexus cars are most beautiful
										with the awesome features, but this car is really
										outstanding than lexus
									</p>
								</div>
							</li>
						</ul>
					</li>
					<li>
						<div class="comet-avatar">
							<img src="./images/resources/comet-4.jpg" alt="">
						</div>
						<div class="we-comment">
							<div class="coment-head">
								<h5>
									<a href="time-line.html" title="">Donald Trump</a>
								</h5>
								<span>1 week ago</span>
								<a class="we-reply" href="#" title="Reply"><i class="fa fa-reply"></i></a>
							</div>
							<p>
								we are working for the dance and sing songs. this video
								is very awesome for the youngster. please vote this
								video and like our channel <i class="em em-smiley"></i>
							</p>
						</div>
					</li>
					<li>
						<a href="#" title="" class="showmore underline">more comments</a>
					</li>
					<li class="post-comment">
						<div class="comet-avatar">
							<img src="./images/resources/comet-1.jpg" alt="">
						</div>
														
						<!-- 답글 작성란 -->
						<div class="post-comt-box">
							<form method="post">
								<textarea placeholder="Post your comment"></textarea>
								<button type="submit"></button>
							</form>
						</div>
						<!-- /답글 작성란 -->
					</li>
				</ul>
			</div>
		</div>
	</div>
<%
		}
	}
%>