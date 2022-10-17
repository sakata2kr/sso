
<%
    // =================================================================
    // Identify-TooRecentlyUsed.asp - Sample page for FPS.
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
    // This page is only invoked if the one qualifying user has 
    // successfully utilized FPS too recently.
    // =================================================================
%>

<HTML>
    <HEAD>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <TITLE>Forgotten Password Services (Too Recently Used)</TITLE>
        <meta http-equiv="Expires" content="Tue, 31 Dec 1997 23:59:59 GMT">
    </HEAD>

    <BODY bgbroperties="fixed">
        <table cellpadding="0" cellspacing="0" border="0" width="100%" height="60%">
            <tr>
                <td align="center" valign="middle">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <center>
                                    <h1>You have forgotten your password and/or user id too recently.</h1>
                                    <br>
                                    Please contact our Customer Service Desk for help.
                                </center>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </BODY>

</HTML>

