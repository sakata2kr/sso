<%
    // =================================================================
    // Identify-NotFound.asp - Sample unknown user page for FPS.
    //
    // This is a sample only. Customers should feel free to modify
    // this page (or port to different languages) as needed. However,
    // this page is supplied 'as is', without warranty.
    //
    // For security purposes, no comments should be contained in this
    // file that would be sent to the client (in other words, no HTML
    // comments). Server side script comments do not get sent to clients.
    //
    // This page is invoked when we cannot determine who the user is.
    // =================================================================
%>

<HTML>
    <HEAD>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <TITLE>Forgotten Password Services (Not Found)</TITLE>
        <meta http-equiv="Expires" content="Tue, 31 Dec 1997 23:59:59 GMT">
    </HEAD>

    <BODY bgbroperties="fixed">
        <table border="0" width="100%" height="70%">
            <tr>
                <td align="center" valign="middle">
                    <font face="arial,helvetica" size="+1">
                        We are unable to identify you as a current user of the system.
                        <br>
                        This may be because you are not allowed to use this facility.
                        <br>
                        Please call our service desk at 1-800-Help-Me.
                        <br>
                        Thank You.
                    </font>
                </td>
            </tr>
        </table>

    </BODY>
</HTML>

