<!DOCTYPE html>
<html>
<head>
    <title>Result</title>
</head>
<body>
    <h2>Result</h2>
    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null && !message.isEmpty()) { %>
        <p><%= message %></p>
    <% } else { %>
        <p>No message to display.</p>
    <% } %>
    
</body>
</html>
