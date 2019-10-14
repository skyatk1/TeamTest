<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#image {
	display: none;
}

#image_preview {
	border: 1px solid;
}
</style>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">

	$(function() {
		$('#btn-upload').click(function(e) {
			e.preventDefault();
			$('#image').click();
		});
	});
	
	function preview_image() {
		var total_file = document.getElementById("image").files.length;
		
		for (var i = 0; i < total_file; i++) {
			$('#image_preview').append(
					"<img src='" + URL.createObjectURL(event.target.files[i])
							+ "'width='80px' height='80px'>");
		}
	}
	
</script>

</head>
<body>
		<div>
			<input type="file" id="image" name="image" onchange="preview_image();" accept=".gif, .jpg, .png"  />
			<button type="button" id="btn-upload">Image</button>
		</div>
		<div id="image_preview"></div>

</body>
</html>