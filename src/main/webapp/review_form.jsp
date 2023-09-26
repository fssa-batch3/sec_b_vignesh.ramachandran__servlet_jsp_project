<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&
    family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&family=Kurale&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/normalize.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/review.css">
<title>Review</title>
</head>
<body>

	<%@include file="/header.jsp" %>

	<div class="container">
		<div class="post">
			<div class="text">Thanks for rating us!</div>
			<div class="edit">EDIT</div>
		</div>
		<div class="star-widget">
		
			<input type="radio" name="rate" id="rate-5" value="5"> 
			<label for="rate-5" class="fa fa-star"></label> 
			
			<input type="radio" name="rate" id="rate-4" value="4"> 
			<label for="rate-4" class="fa fa-star"></label> 
			
			<input type="radio" name="rate" id="rate-3" value="3"> 
			<label for="rate-3" class="fa fa-star"></label> 
			
			<input type="radio" name="rate" id="rate-2" value="2"> 
			<label for="rate-2" class="fa fa-star"></label> 
			
			<input type="radio" name="rate" id="rate-1" value="1"> 
			<label for="rate-1" class="fa fa-star"></label>
			
			<form action="create" method="post" id="rev_form">
			
				<input type="hidden" name="orderId" id="orderId" value="<%=request.getAttribute("orderId")%>">
				<input type="hidden" name="menuId" id="menuId" value="<%=request.getAttribute("menuId")%>">
				<input type="hidden" name="categoryId" id="categoryId" value="<%=request.getAttribute("categoryId")%>">
				<input type="hidden" name="star" id="star" value="">
				<input type="hidden" name="feedback" id="feedback" value="">
			
				<h2 id="header"></h2>
				<div class="textarea">
					<textarea cols="30" placeholder="Describe your experience.."
						required="true"></textarea>
				</div>
				<div class="btn_post">
					<button type="submit">Post</button>
				</div>
				
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
	
	const revForm = document.getElementById("rev_form");
	const post = document.querySelector(".post");
	const widget = document.querySelector(".star-widget");
	const editBtn = document.querySelectorAll(".edit");
	
	revForm.addEventListener("submit", (event) => {
	
		const star_value = document.querySelector('input[name="rate"]:checked');
		const rev_message = document
	    .querySelector("textarea")
	    .value.trim()
	    .split(/\s+/g)
	    .join(" ");
		
		
		if(!star_value){
			alert("You should give atleast one start");
			event.preventDefault();
		}

		function validate() {
		    if (/^\s*$/g.test(rev_message)) {
		      alert("Feedback cannot be empty");
		      event.preventDefault();
		    }
		}
		validate();
		
		const star = document.getElementById("star");
		const feedback = document.getElementById("feedback");
		
		if(star_value){
			star.value = star_value.value;
			feedback.value = rev_message;
		}
	
	});
	
	</script>
	
	<%-- <script src="<%=request.getContextPath() %>/assets/JS/review.js"></script> --%>
	
	<%-- <%@include file="/footer2.jsp" %> --%>

</body>
</html>