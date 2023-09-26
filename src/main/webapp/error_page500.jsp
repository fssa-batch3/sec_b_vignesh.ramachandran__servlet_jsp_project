<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
body {
	background-color: #333333;
	width: 100vw;
	height: 100vh;
	color: white;
	font-family: "Arial Black";
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
}

.error-num {
	font-size: 8em;
}

.eye {
	background: #fff;
	border-radius: 50%;
	display: inline-block;
	height: 100px;
	position: relative;
	width: 100px;
}

.eye::after {
	background: #000;
	border-radius: 50%;
	bottom: 56.1px;
	content: "";
	height: 33px;
	position: absolute;
	right: 33px;
	width: 33px;
}

p {
	margin-bottom: 4em;
}

a button {
	padding: .5rem .75rem;
	color: black;
	text-decoration: none;
	text-transform: uppercase;
}

a:hover {
	color: lightgray;
}
</style>

<title>500 Error page</title>
</head>
<body>

	<div>
		<span class='error-num'>5</span>
		<div class='eye'></div>
		<div class='eye'></div>
		<p class='sub-text'>
			OOPS ! Something went wrong. We're <i>looking</i> to see what
			happened.
		</p>
		
		<a href="index">
			<button>Home</button>
		</a>
	</div>


	<script>
	$(document).mousemove(function (event) {
		  var e = $(".eye");
		  var x = e.offset().left + e.width() / 2;
		  var y = e.offset().top + e.height() / 2;
		  var rad = Math.atan2(event.pageX - x, event.pageY - y);
		  var rot = rad * (180 / Math.PI) * -1 + 180;
		  e.css({
		    "-webkit-transform": "rotate(" + rot + "deg)",
		    transform: "rotate(" + rot + "deg)"
		  });
		});
	</script>

</body>
</html>