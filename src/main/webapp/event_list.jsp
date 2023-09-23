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

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/events/events.css">
<title>Events</title>
</head>
<body>
	<%@include file="/header.jsp" %>
	<!-- main starts -->

	<main>
		<section>
			<div class="ingredient-image">
				<h2>Best Catering service for Events,Functions and Parties @
					Kumbakonam</h2>
			</div>
		</section>
		<!-- event lists starts -->

		<section class="events">
			<h2>Experienced cateres for Events & Functions in Kumbakonam</h2>
			<div class="events_lists">
				
			</div>
		</section>
		<!-- event lists ends -->
	</main>
	<!-- main ends -->
	
	<%@include file="/footer.jsp" %>
	
	<script>
        const events = [
          {
            name: "Birthday Party",
            image: {
              source: "<%=request.getContextPath()%>/assets/img/Events/birthday-1.jpg",
              text: "birthday party",
            },
            link: "<%=request.getContextPath()%>/event/details?eventName=birthday",
          },
          {
            name: "Puberty Function",
            image: {
              source: "<%=request.getContextPath()%>/assets/img/Events/puberty-1.jpg",
              text: "puberty function",
            },
            link: "<%=request.getContextPath()%>/event/details?eventName=puberty",
          },
          {
            name: "Engagement",
            image: {
              source: "<%=request.getContextPath()%>/assets/img/Events/engagement-1.jpg",
              text: "engagement",
            },
            link: "<%=request.getContextPath()%>/event/details?eventName=engagement",
          },
          {
            name: "Marriage",
            image: {
              source: "<%=request.getContextPath()%>/assets/img/Events/marriage-1.jpg",
              text: "marriage",
            },
            link: "<%=request.getContextPath()%>/event/details?eventName=marriage",
          },
          {
            name: "House Warming Function",
            image: {
              source: "<%=request.getContextPath()%>/assets/img/Events/house warming-1.jpg",
              text: "house warming function",
            },
            link: "<%=request.getContextPath()%>/event/details?eventName=housewarming",
          },
          {
            name: "Valaikappu Function",
            image: {
              source: "<%=request.getContextPath()%>/assets/img/Events/valaikappu-1.jpg",
              text: "valaikappu function",
            },
            link: "<%=request.getContextPath()%>/event/details?eventName=valaikappu",
          },
          {
            name: "Private Party",
            image: {
              source: "<%=request.getContextPath()%>/assets/img/Events/private_party-1.jpg",
              text: "private party",
            },
            link: "<%=request.getContextPath()%>/event/details?eventName=privateparty",
          },
        ];
        for (let i = 0; i < events.length; i++) {
          const div_event = document.createElement("div");
          div_event.setAttribute("class", "event-1");
          // console.log(div_event);

          const img = document.createElement("img");
          img.setAttribute("src", events[i].image.source);
          img.setAttribute("alt", events[i].image.text);
          div_event.append(img);

          const h3 = document.createElement("h3");
          h3.innerText = events[i].name;
          div_event.append(h3);

          const a = document.createElement("a");
          a.setAttribute("href", events[i].link);
          div_event.append(a);

          const button = document.createElement("button");
          button.innerText = "View";
          button.type = "submit";
          a.append(button);

          document.querySelector("div.events_lists").append(div_event);
        }
    </script>


</body>
</html>