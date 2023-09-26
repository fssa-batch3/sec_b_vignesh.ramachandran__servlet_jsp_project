
<%@page import="in.fssa.srcatering.util.Logger"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
<%String errorMsg = (String) request.getAttribute("errorMessage");
String successMsg = (String) request.getAttribute("successMsg");
String path = (String) request.getAttribute("path");

Logger.debug(successMsg + " Succesmsg ----  errormsg " + errorMsg + "path :" + path);

if (errorMsg != null) {%>
		
		<%Logger.debug(errorMsg + "inside");%>
		swal("Failed!","<%=errorMsg%>", "error");
		setTimeout(() => {
			window.location.href="<%=path%>";
		}, 4000);
		
	<%}%>
		
		<%if (successMsg != null) {%>
		console.log("<%=successMsg%>");
		<%Logger.debug(successMsg + "inside");%>
		swal("Success!"," <%=successMsg%>", "success");
		setTimeout(() => {
			window.location.href="<%=path%>";
		}, 4000);
		<%}%>
		
</script>