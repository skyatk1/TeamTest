 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

  <script src="../jquery.modal.js" type="text/javascript" charset="utf-8"></script>
  <link rel="stylesheet" href="../jquery.modal.css" type="text/css" media="screen" />

  <script src="highlight/highlight.pack.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript" charset="utf-8"> hljs.initHighlightingOnLoad(); </script>
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <link rel="stylesheet" href="highlight/github.css" type="text/css" media="screen" />
  <link href="https://fonts.googleapis.com/css?family=Lato:400,400i,900,900i&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Fira+Mono:400" rel="stylesheet">
  <style type="text/css" media="screen">
    html {
      font-size: 18px;
    }

    body {
      font-weight: 400;
      font-family: "Lato", "Helvetica Neue", arial, sans-serif;
      line-height: 1.666;
      -webkit-font-smoothing: antialiased;
      color: #5e6c76;
      margin: 0;
      padding: 10px 0 0 0;
    }

    .band {
      background-image: linear-gradient(to right, #2a27a8 0%,#8c50bc 50%,#fc6e6c 100%);
      height: 10px;
      top: 0;
      right: 0;
      left: 0;
      position: fixed;
    }

    .wrapper {
      padding: 2em 20px;
      max-width: 900px;
      margin: 0 auto;
    }

    small { color: #aaa; }
    h1,h2,h3,h4 { color: #404a50; font-weight: 800; font-size: 1.75em; line-height: 1.1; margin: 0 0 1.5rem 0; }
    h2 a { color: #cad1d5; border: none; }
    h2 a:hover { color: #fa0065; }
    a { color: #fa0065; font-weight: 700; transition-duration: .2s; text-decoration: none; border-bottom: 2px solid transparent; }
    a:hover { color: #22272a; border-color: #22272a; }
    p, ul, ol, pre { margin: 0 auto 1.5rem auto; }
    p code, li code {color: #000080; font-size: .9em; }
    pre { font-size: 14px; line-height: 2; }
    pre code { overflow: scroll; padding: 1em; border-radius: 4px; background: #f9fafb; color: #475359; }
    hr { height: 3px; background: #f0f2f3; border: none; margin: 3rem 0; border-radius: 3px; }
    table {width:100%;border-collapse:collapse;}
    td { border: 1px solid #eee; padding: 15px; }
    td pre { margin: 0; }
    code { font-family: 'fira mono', monospace; }
    a.btn {
      color: #fff;
      background: #FF0066;
      padding: .5rem 1rem;
      display: inline-block;
      border-radius: 4px;
      transition-duration: .25s;
      border: none;
      font-size: 14px;
    }
    a.btn:hover {
      background: #22272a;
    }

    .header h1 {
      margin: 1rem 0 .5rem 0;
    }

    .header iframe {
      margin-bottom: 2rem;
    }

    .header p {
      margin: 0 0 .5rem 0;
      font-size: 1.25rem;
    }

    .header ul {
      list-style-type: none;
      margin-right: 0;
      padding: 0;
      line-height: 2;
    }

    .header ul li:before {
      content: '\2714';
      margin-right: .5em;
      color: #94be47;
      font-size: .75em;
    }

    /* Example 2 (login form) */
    .login_form.modal {
      border-radius: 0;
      line-height: 18px;
      padding: 0;
      font-family: "Lucida Grande", Verdana, sans-serif;
    }

    .login_form h3 {
      margin: 0;
      padding: 10px;
      color: #fff;
      font-size: 14px;
      background: -moz-linear-gradient(top, #2e5764, #1e3d47);
      background: -webkit-gradient(linear,left bottom,left top,color-stop(0, #1e3d47),color-stop(1, #2e5764));
    }

    .login_form.modal p { padding: 20px 30px; border-bottom: 1px solid #ddd; margin: 0;
      background: -webkit-gradient(linear,left bottom,left top,color-stop(0, #eee),color-stop(1, #fff));
      overflow: hidden;
    }
    .login_form.modal p:last-child { border: none; }
    .login_form.modal p label { float: left; font-weight: bold; color: #333; font-size: 13px; width: 110px; line-height: 22px; }
    .login_form.modal p input[type="text"],
    .login_form.modal p input[type="password"] {
      font: normal 12px/18px "Lucida Grande", Verdana;
      padding: 3px;
      border: 1px solid #ddd;
      width: 200px;
    }

    .part {
      display: none;
    }

    .modal p { margin: 1em 0; }
    .modal a.close-modal { border: none; }

    @media(max-width: 600px) {
      html {
        font-size: 14px;
      }
      h2 a { display: block; margin-bottom: 0.5em; }
      pre { font-size: 11px; line-height: 1.5; }
      pre code { padding: 5px; }
      a.btn { display: block; text-align: center; padding: 1rem; }
    }
  </style>
  <title>jQuery Modal</title>
  <meta name="description" content="jQuery Modal is the easiest way to display modal windows with jQuery. Built by Kyle Fox.">

  <link rel="apple-touch-icon" sizes="57x57" href="https://kylefox.ca/apple-touch-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="114x114" href="https://kylefox.ca/apple-touch-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="72x72" href="https://kylefox.ca/apple-touch-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="144x144" href="https://kylefox.ca/apple-touch-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="60x60" href="https://kylefox.ca/apple-touch-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="120x120" href="https://kylefox.ca/apple-touch-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="76x76" href="https://kylefox.ca/apple-touch-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="152x152" href="https://kylefox.ca/apple-touch-icon-152x152.png">
  <link rel="icon" type="image/png" href="https://kylefox.ca/favicon-196x196.png" sizes="196x196">
  <link rel="icon" type="image/png" href="https://kylefox.ca/favicon-160x160.png" sizes="160x160">
  <link rel="icon" type="image/png" href="https://kylefox.ca/favicon-96x96.png" sizes="96x96">
  <link rel="icon" type="image/png" href="https://kylefox.ca/favicon-16x16.png" sizes="16x16">
  <link rel="icon" type="image/png" href="https://kylefox.ca/favicon-32x32.png" sizes="32x32">
  <meta name="msapplication-TileColor" content="#f0f0f0">
  <meta name="msapplication-TileImage" content="https://kylefox.ca/mstile-144x144.png">

</head>
<body>
<p><a href="ex7">Open Modal</a></p>

<div id="ex7" class="modal">
  <p>
  	글 삭제???? <br>
  	<input type="button" value="확인">
  </p>
</div>


<script type="text/javascript" charset="utf-8">
  $(function() {

    function log_modal_event(event, modal) {
      if(typeof console != 'undefined' && console.log) console.log("[event] " + event.type);
    };

    $(document).on($.modal.BEFORE_BLOCK, log_modal_event);
    $(document).on($.modal.BLOCK, log_modal_event);
    $(document).on($.modal.BEFORE_OPEN, log_modal_event);
    $(document).on($.modal.OPEN, log_modal_event);
    $(document).on($.modal.BEFORE_CLOSE, log_modal_event);
    $(document).on($.modal.CLOSE, log_modal_event);
    $(document).on($.modal.AFTER_CLOSE, log_modal_event);
    $(document).on($.modal.AJAX_SEND, log_modal_event);
    $(document).on($.modal.AJAX_SUCCESS, log_modal_event);
    $(document).on($.modal.AJAX_COMPLETE, log_modal_event);

    $('#more').click(function() {
      $(this).parent().after($(this).parent().next().clone());
      return false;
    });

    $('#manual-ajax').click(function(event) {
      event.preventDefault();
      this.blur();
      $.get(this.href, function(html) {
        $(html).appendTo('body').modal();
      });
    });

    $('a[href="#ex7"]').click(function(event) {
      event.preventDefault();
      $(this).modal({
        fadeDuration: 250
      });
    });

  });
</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-1701128-22', 'auto');
  ga('send', 'pageview');

</script>
</body>
</html>