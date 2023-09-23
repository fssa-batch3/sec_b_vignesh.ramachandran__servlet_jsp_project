<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isErrorPage="true"%>
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

<title>Error Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>


<style>
* {
	padding: 0;
	margin: 0;
	text-decoration: none;
}

:root {
	--bg-color: #ffffff;
	--second-color: #f54300;
	--thickgreen-color: #4b814b;
	--text-color: #130849;
	--other-color: #ebeef7;
	--normal-font: 1rem;
	--p-font: 1.2rem;
	--h2-font: 1.5rem;
	--big-font: 2rem;
	--name-font: 3rem;
	--heading-fontfamily: 'Kurale', serif;
	--parah-fontfamily: 'Josefin Sans', sans-serif;
}

span {
	color: var(--second-color);
}

section {
	height: 100vh;
	display: flex;
	justify-content: center;
}

.error_page {
	margin: auto;
	display: grid;
	gap: 1rem;
	justify-items: center;
}

.error_code {
	font-family: var(--heading-fontfamily);
	font-size: var(--name-font);
}

.btn {
	padding: 0.7rem 1rem;
	background-color: var(--other-color);
	border: 2px solid var(--text-color);
	color: var(--second-color);
	font-size: var(--p-font);
	font-weight: bold;
	font-family: var(--parah-fontfamily);
	border-radius: 2rem;
	border: none;
	text-align: center;
}

/*  for 500 error */
</style>
</head>
<body>
	<%-- <jsp:include page="header.jsp"></jsp:include>  --%>

	<main>

		<section>
			<!-- class="d-flex flex-column align-items-center"> -->

			<div class="error_page">

				<%
				int errorCode = (int) request.getAttribute("javax.servlet.error.status_code");
				%>




				<h1 class="error_code"><%=errorCode%>
					: OOPS ! The page you requested could not be found.
				</h1>

				<a href="index">
					<button class="btn home">Home</button>
				</a>

				<div>
					<img
						src="<%=request.getContextPath()%>/assets/img/Homepage/walking chef.gif"
						class="gif" alt="walking chef">
				</div>




			</div>

		</section>


	</main>


</body>
</html>