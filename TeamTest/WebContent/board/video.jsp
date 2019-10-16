<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//video preview
  function preview_video () {
      var video = $("video");
      var thumbnail = $("canvas");
      var input = $("#vidInput");
      var ctx = thumbnail.get(0).getContext("2d");
      var duration = 0;
      var img = $("#vid_preview");

      
          var file = event.target.files[0];
          if (["video/mp4"].indexOf(file.type) === -1) {
              alert("Only 'MP4' video format allowed.");
              return;
          }
          
          video.find("source").attr("src", URL.createObjectURL(file));
          
          video.get(0).load();
          // Load metadata of the video to get video duration and dimensions
          video.on("loadedmetadata", function(e) {
              duration = video.get(0).duration;
              // Set canvas dimensions same as video dimensions
              thumbnail[0].width = video[0].videoWidth;
              thumbnail[0].height = video[0].videoHeight;
              // Set video current time to get some random image
              video[0].currentTime = Math.ceil(duration / 2);
              // Draw the base-64 encoded image data when the time updates
              video.one("timeupdate", function() {
                  ctx.drawImage(video[0], 0, 0, video[0].videoWidth, video[0].videoHeight);
                  img.attr('width', 100).attr('height', 100).attr("src", thumbnail[0].toDataURL());
              });
          });
        
  }
//video preview
</script>

</head>
<body>

</body>
</html>