<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>Winku Social Network Toolkit</title>
    <link rel="icon" href="./images/fav.png" type="image/png" sizes="16x16"> 
    
    <link rel="stylesheet" href="./css/main.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/color.css">
    <link rel="stylesheet" href="./css/responsive.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	
	// 이메일 중복 체크
	function duplicateEmailCheck() {
		var email = $("#joinEmail").val();
		
		if (email.length > 10) {
            $.ajax({
                type : "post",
                url : "./EmailCheck.me",
                data : {email : email},
                dataType : "text",
                success : function(result) {
                	if (result == 1) {
                		$("#emailCheck").html("이미 가입된 이메일 입니다.");
                		$("#emailCheck").css("color", "red");
                	} else {
                		var check = checkEmail(email);
                		
                		if (check == 1) {
	                		$("#emailCheck").html("사용가능한 이메일 입니다.");
	                		$("#emailCheck").css("color", "blue");
                		} else {
                			$("#emailCheck").html("올바른 이메일 형식으로 입력해주세요.");
                    		$("#emailCheck").css("color", "red");
                		}
                	}
                },
                error : function(data){
                	alert("error");
                }
            });
        }
	}
	
	// 이메일 유효성 체크
	function checkEmail(str) {
	    var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	    if (regExp.test(str)) 
	    	return 1;

	    else {
	    	return -1;
	    }

	}
	
	// 회원가입 유효성 검사
 	function join() {
 		var f_name = $("#f_name").val();
    	var l_name = $("#l_name").val();
    	var pass = $("#joinPass").val();
    	var genderCk = $("input:radio[name='gender']").is(":checked");	// 성별(라디오버튼) 체크 여부
    	var gender =  $(":radio[name='gender']:checked").val();	// 성별(라디오버튼) 값
		var email = $("#joinEmail").val();
    	var tosCheck = $("input:checkbox[name='tosCheck']").is(":checked");	// 약관동의 체크 여부

		if (f_name == "") {
			$("#f_nameCheck").text("성을 입력해주세요.");
			$("#f_nameCheck").css("color", "red");
			
			$("#f_name").focus(function(){
				$(this).blur(function(){	// input box에서 포커스 아웃했을 때
					$("#f_nameCheck").empty();	// 경고문("성을 입력해주세요") 내용 지우기
				});
			});
			
			return false;
		}
		
		if (l_name == "") {
			$("#l_nameCheck").text("이름을 입력해주세요.");
			$("#l_nameCheck").css("color", "red");
			
			$("#l_name").focus(function(){
				$(this).blur(function(){
					$("#l_nameCheck").empty();
				});
			});
					
			return false;
		}
				
		if (pass == "") {
			$("#passCheck").text("비밀번호를 입력해주세요.");
			$("#passCheck").css("color", "red");
			
			$("#joinPass").focus(function(){
				$(this).blur(function(){
					$("#passCheck").empty();
				});
			});
			
			return false;
		}
		
 		if (genderCk == false) {
			$("#genderCheck").text("성별을 선택해주세요.");
			$("#genderCheck").css("color", "red");
			
			$(":radio[name='gender']").focus(function(){
				$(this).blur(function(){
					$("#genderCheck").empty();
				});
			});
			
			return false;
		} 
		
		if (email == "") {
			$("#emailCheck").text("이메일을 입력해주세요.");
			$("#emailCheck").css("color", "red");
			
		/* 	$("#joinEmail").focus(function(){
				$(this).blur(function(){
					$("#emailCheck").empty();
				});
			}); */
			
			return false;
		}
		
		if ($("#emailCheck").text() != "사용가능한 이메일 입니다.") {
			$("#joinEmail").focus();
			
			return false;
		}
		
		if (tosCheck == false) {
			$("#tosCheckDiv").text("약관에 동의해주세요");
			$("#tosCheckDiv").css("color", "red");
			
			$(":radio[name='tosCheck']").focus(function(){
				$(this).blur(function(){
					$("#tosCheckDiv").empty();
				});
			});
			
			return false;
		}
		
		$.ajax({
            type : "post",
            url : "./JoinMember.me",
            data : {f_name : f_name, l_name : l_name, pass : pass, gender : gender, email : email},
            dataType : "text",
            success : function(data) {
            	alert("회원가입이 완료 되었습니다.");
            	location.href="./Login.me";
            },
            error : function(data){
            	alert("회원가입에 실패 하였습니다.");
            }
        });
	} 

	
</script>
</head>
<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	<div class="container-fluid pdng0">
		<div class="row merged">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="land-featurearea">
					<div class="land-meta">
						<h1>Winku</h1>
						<p>
							Winku is free to use for as long as you want with two active projects.
						</p>
						<div class="friend-logo">
							<span><img src="./images/wink.png" alt=""></span>
						</div>
						<a href="#" title="" class="folow-me">Follow Us on</a>
					</div>	
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="login-reg-bg">
					<div class="log-reg-area sign">
						<h2 class="log-title">로그인</h2>
						<form action="Main.me" method="post">
							<div class="form-group">	
								<input type="text" id="loginEmail" id="input" required="required"/>
								<label class="control-label" for="input" name="email">이메일</label><i class="mtrl-select"></i>
							</div>
							
							<div class="form-group">	
								<input type="password" id="loginPass" required="required"/>
								<label class="control-label" for="input" name="pass">비밀번호</label><i class="mtrl-select"></i>
							</div>
							
							<div class="checkbox">
								<label>
									<input type="checkbox" checked="checked"/><i class="check-box"></i>로그인 상태 유지
								</label>
							</div>
							
							<a href="#" title="" class="forgot-pwd">비밀번호를 잊으셨나요?</a>
							
							<div class="submit-btns">
								<button class="mtr-btn signin" type="button" onclick="location.href='./Main.ma'"><span>로그인</span></button>
								<button class="mtr-btn signup" type="button"><span>회원가입</span></button>
							</div>
						</form>
					</div>

					<!--Register 폼-->
					<div class="log-reg-area reg">
						<h2 class="log-title">회원가입</h2>
						<form action="./Join.me" method="post" id="joinFr" name="joinFr" onsubmit="return check();">
							<div class="form-group">	
								<input type="text" id="f_name" required="required"/>
								<label class="control-label" for="input" name="f_name">성(First Name)</label><i class="mtrl-select"></i>
								<div id="f_nameCheck" class="joinCheck"></div>
							</div>
							
							<div class="form-group">	
								<input type="text" id="l_name" required="required"/>
								<label class="control-label" for="input" name="l_name">이름(Last Name)</label><i class="mtrl-select"></i>
								<div id="l_nameCheck" class="joinCheck"></div>
							</div>
							
							<div class="form-group">	
								<input type="password" id="joinPass" required="required"/>
								<label class="control-label" for="input" name="pass">비밀번호</label><i class="mtrl-select"></i>
								<div id="passCheck" class="joinCheck"></div>
							</div>
							
							<div class="form-radio">
								<div class="radio">
									<label>
										<input type="radio" id="gender" name="gender" value="남자" /><i class="check-box"></i>남자
									</label>
								</div>
								<div class="radio">
									<label>
										<input type="radio" id="gender" name="gender" value="여자"/><i class="check-box"></i>여자
									</label>
								</div>
								<div id="genderCheck" class="joinCheck"></div>
							</div>
							
							<div class="form-group">	
								<input type="text" id="joinEmail" onkeyup="duplicateEmailCheck();" required="required"/>
								<label class="control-label" for="input" name="email">이메일</label><i class="mtrl-select"></i>
								<div id="emailCheck"></div>
							</div>
							
							<div class="checkbox">
								<label>
									<input type="checkbox" id="tosCheck" name="tosCheck" checked="checked"/><i class="check-box"></i>약관에 동의하십니까?
									<div id="tosCheckDiv"></div>
								</label>
							</div>
							
							<a href="#" title="" class="already-have">로그인 화면으로</a>
							
							<div class="submit-btns">
								<!-- <input class="mtr-btn signup" type="submit" onclick="join();"><span>회원가입</span> -->
								<button class="mtr-btn signup" type="button" onclick="join();"><span>회원가입</span></button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<script src="./js/main.min.js"></script>
	<script src="./js/script.js"></script>

</body>	
</html>