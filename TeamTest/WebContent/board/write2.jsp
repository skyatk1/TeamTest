 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
			sel_files.push(f);

			var reader = new FileReader();
			reader.onload = function(e) {
				var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\">"
							+ "<img src=\"" + e.target.result + "\" data-file='" + f.name + "' class='imgFiles' width='80px' height='80px' class='selProductFile' title='Click to remove'>"
							+ "</a>";
				$(".imgs_wrap").append(html);
				
				index++;
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

	function insertBoard() {
//		var formData = new FormData();
//		var formData = $("#writeBoard").serialize(); 
		
//		for(var i = 0, len = sel_files.length; i < len; i++) {
			//alert($("#imageFile").val());
//			alert(sel_files[i]);
//        }

	
//		alert("content: " + $("#content").val());
//		alert("업로드 파일 갯수 : "+sel_files.length);
//		alert("insert files: " + sel_files);
		
//		formData.append("content", $("#content").val());
//		formData.append("imgFiles", sel_files);

/* 		for(var i = 0, len = sel_files.length; i < len; i++) {
            var name = "img"+i;
            formData.append(name, sel_files[i]);
        } */
		
//		formData.append("imgCnt", sel_files.length);
		
		
/* 		for (var pair of formData.entries()) {
			console.log(pair[0] + ", " + pair[1]);
		}
	 */
	/*	
		$.ajax({
			url : "./BoardInsertServlet",
 			type : "POST", 
			data : formData,
			contentType : false,
			processData : false,
			enctype : "multipart/form-data",
			success : function(data) {
				alert("success");
			},
			error : function(data) {
				alert("error");
			}
		});
 	*/	
 	
 		alert("업로드 파일 갯수 : "+sel_files.length);
		var data = new FormData();

        for(var i=0, len=sel_files.length; i<len; i++) {
            var name = "image_"+i;
            data.append(name, sel_files[i]);
        }
        data.append("content", $("#content").val());
        data.append("imgCnt", sel_files.length);
        
        var xhr = new XMLHttpRequest();
        xhr.open("POST","./BoardInsertServlet");
        xhr.onload = function(e) {
            if(this.status == 200) {
                console.log("Result : "+e.currentTarget.responseText);
            }
        }
        xhr.send(data);
	}
</script>
	<div class="central-meta new-pst">
		<div class="new-postbox">
			<figure>
				<img src="./images/resources/admin2.jpg" alt="">
			</figure>
			<div class="newpst-input">
				<form id="writeBoard" enctype="multipart/form-data">
					
					<textarea rows="2" placeholder="무슨 일이 일어나고 있나요?" id="content" name="content"></textarea>
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
									<input type="file" id="imageFile" name="imageFile[]" accept=".gif, .jpg, .png" onclick="fileUploadAction();" multiple />
								</label>
							</li>
							<li>
								<i class="fa fa-video-camera"></i>
								<label class="fileContainer">
									<input type="file">
								</label>
							</li>
							<li>
								<button type="submit" onclick="javascript : insertBoard();">게시</button>
								<!-- <button type="button" onclick="write();">게시</button> -->
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="../js/main.min.js"></script>
	<script src="../js/script.js"></script>