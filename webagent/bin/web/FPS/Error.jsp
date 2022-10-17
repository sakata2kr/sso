<%@ page import="java.net.URLDecoder" %>

<%
    // =================================================================
    // Error.asp - Sample error reporting page for FPS.
    //
    // This is a sample only. Customers should feel free to modify
    // this page (or port to different languages) as needed. However,
    // this page is supplied 'as is', without warranty.
    //
    // For security purposes, no comments should be contained in this
    // file that would be sent to the client (in other words, no HTML
    // comments). Server side script comments do not get sent to 
    // clients.
    //
    // The text (in the user//s language) of the error message will be 
    // passed in the query string. There is a small number of possible
    // errors.
    // =================================================================
%>
<%
    String ErrorMessage;                            // Holds Input Data

    try{  
        ErrorMessage = URLDecoder.decode(request.getQueryString());
    }
    catch (Exception ex){
        ErrorMessage = "No Error Message Provided";
    }
    if(ErrorMessage.length() == 0)
        ErrorMessage = "No Error Message Provided";
%>

<HTML>
    <HEAD>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <TITLE>Forgotten Password Services (Error)</TITLE>
        <meta http-equiv="Expires" content="Tue, 31 Dec 1997 23:59:59 GMT">
    </HEAD>

    <BODY bgbroperties="fixed">
        <table border="0" width=100% height="70%">
            <tr>
                <td valign="middle">
                    <center>
                        <h1>An error has occurred.</h1>
                        <h2><%=ErrorMessage%></h2>
                        <h3>Please contact Customer Service for help.</h3>
                    </center>
                </td>
            </tr>
        </table>
    </BODY>
</HTML>
