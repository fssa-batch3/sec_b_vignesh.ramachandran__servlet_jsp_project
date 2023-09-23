
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .error-message {
            font-size: 24px;
            color: #FF0000;
        }
    </style>
</head>
<body>
	
    <div class="error-message">
        <h1>Error Occurred</h1>
        <p>We're sorry, but an error has occurred.</p>
        <p>Error Code: <%= request.getAttribute("javax.servlet.error.status_code") %></p>
        <p>Error Message: <%= request.getAttribute("errorMessage") %></p>
    </div>
</body>
</html>
