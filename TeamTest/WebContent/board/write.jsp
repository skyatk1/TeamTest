<script type="text/javascript">
	function insertBoard() {
		var content = $("#content").val();
		
		alert("content: " + content);
		
		$.ajax({
			url : "./BoardInsertSevlet",
			type : "POST",
			data : {
				"content" : content
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

	<div class="central-meta new-pst">
		<div class="new-postbox">
			<figure>
				<img src="./images/resources/admin2.jpg" alt="">
			</figure>
			<div class="newpst-input">
				<form action="./Login.me" method="post">
					
					<textarea rows="2" placeholder="무슨 일이 일어나고 있나요?" id="content"></textarea>
					<div class="attachments">
						<ul>
							<li>
								<i class="fa fa-music"></i>
								<label class="fileContainer">
									<input type="file">
								</label>
							</li>
							<li>
								<i class="fa fa-image"></i>
								<label class="fileContainer">
									<input type="file">
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
					
					
				</form>
			</div>
		</div>
	</div>
