<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Insert title here</title>
<link rel="icon" href="./images/fav.png" type="image/png" sizes="16x16">
<link rel="stylesheet" href="../css/main.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/color.css">
<link rel="stylesheet" href="../css/responsive.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

	//이미지 정보들을 담을 배열
	var sel_files = [];
	var vedio;
	
	$(document).ready(function() {
	    $("#imageFile").on("change", handleImgFileSelect);
	}); 
	
	function fileUploadAction() {
	    console.log("fileUploadAction");
	    $("#imageFile").trigger('click');
	}
	
	function handleImgFileSelect(e) {

        // 이미지 정보들을 초기화
        sel_files = [];
        $(".imgs_wrap").empty();
        
        // 파일 갯수 제한
        var x = document.getElementById("imageFile");
        var txt = "";
        if ('files' in x) {
            if (x.files.length > 5) {
                alert("파일 개수가 초과되었습니다. 5개까지 업로드가 가능 합니다.");
                document.getElementById("imageFile").value = "";
                return;
            }
        }

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var index = 0;
        filesArr.forEach(function(f) {

			var reader = new FileReader();
			reader.onload = function(e) {
				var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\">"
							+ "<img src=\"" + e.target.result + "\" data-file='"+f.name+"' width='80px' height='80px' class='selProductFile' title='Click to remove'>"
							+ "</a>";
				$(".imgs_wrap").append(html);
				
				//alert("fname: " + f.name);
				
				sel_files.push(f.name);
				index++;
				alert("select files: " + sel_files);
            }
			
            reader.readAsDataURL(f);
        });
    }
	
	function deleteImageAction(index) {
	    console.log("index : "+index);
	    console.log("sel length : "+sel_files.length);
	
	    sel_files.splice(index, 1);
	    alert("delete files: " + sel_files);
	    
	    var img_id = "#img_id_"+index;
	    $(img_id).remove(); 
	}
	
/*  	function submitAction() {
	    console.log("업로드 파일 갯수 : "+sel_files.length);
	    var data = new FormData();
	
	    for(var i=0, len=sel_files.length; i<len; i++) {
	        var name = "image_"+i;
	        data.append(name, sel_files[i]);
	    }
	    data.append("image_count", sel_files.length);
	    
	    var xhr = new XMLHttpRequest();
	    xhr.open("POST","./study01_af.php");
	    xhr.onload = function(e) {
	        if(this.status == 200) {
	            console.log("Result : "+e.currentTarget.responseText);
	        }
	    }
	    xhr.send(data);
	} */

	function insertBoard() {
		var content = $("#content").val();
		var data = new FormData();

		alert("content: " + content);
		alert("업로드 파일 갯수 : "+sel_files.length);
		alert("insert files: " + sel_files);
		 
		for(var i=0, len=sel_files.length; i<len; i++) {
	        var name = "image_"+i;
	        data.append(name, sel_files[i]);
	    }
		
	    data.append("image_count", sel_files.length);
	    
		$.ajax({
			url : "./BoardInsertSevlet",
			type : "POST",
			data : {
				content : content, 
				imgs :  sel_files.toString(),
				video : vedio
			},
			dataType : "text",
			success : function(data) {
				alert("success");
			},
			error : function(data) {
				alert("error");
			}
		});
		
	}
</script>
</head>
<body>
	<div class="central-meta new-pst">
		<div class="new-postbox">
			<figure>
				<img src="./images/resources/admin2.jpg" alt="">
			</figure>
			<div class="newpst-input">
				<!-- <form action="./Login.me" method="post"> -->
					
					<textarea rows="2" placeholder="무슨 일이 일어나고 있나요?" id="content"></textarea>
					<div>
						<div class="imgs_wrap">
							<img id="img" />
						</div>
					</div>
					
					<div class="attachments">
						<ul>
							<li>
								<i class="fa fa-music"></i>
								<label class="fileContainer">
									<input type="file">
								</label>
							</li>
							<li>
								<i class="fa fa-image" ></i>
								<label class="fileContainer">
									<input type="file" id="imageFile" name="imageFile" accept=".gif, .jpg, .png" onclick="fileUploadAction();" multiple />
								</label>
							</li>
							<li>
								<i class="fa fa-video-camera"></i>
								<label class="fileContainer">
									<input type="file">
								</label>
							</li>
							<li>
								<button type="button" onclick="javascript : insertBoard();">게시</button>
								<!-- <button type="button" onclick="write();">게시</button> -->
							</li>
						</ul>
					</div>
					
					
				<!-- </form> -->
			</div>
		</div>
	</div>
	
	<script src="../js/main.min.js"></script>
	<script src="../js/script.js"></script>
</body>
</html>