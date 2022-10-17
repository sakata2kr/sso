<%@ page import="java.net.URLDecoder" %>
<%String osextension = "";if(System.getProperty("os.name").indexOf("Windows") > -1) osextension = ".exe";%>

<%
    // =================================================================
    // Change.asp - Sample form for requesting password change for FPS.
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
    // If the entered password is invalid, this page will be invoked
    // with a query string containing the error (URL-encoded).
    // =================================================================
%>

<%
    String Message;                            // Holds Input Data

    try{  
        Message = URLDecoder.decode(request.getQueryString());
    }
    catch (Exception ex){
        Message = "";
    }
%>

<HTML>
    <HEAD>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <TITLE>Forgotten Password Services (Change Password)</TITLE>
        <meta http-equiv="Expires" content="Tue, 31 Dec 1997 23:59:59 GMT">
    </HEAD>

    <BODY bgbroperties="fixed">
        <SCRIPT language="JavaScript">
            <!--
                function Validate(theForm)
                {
                    if (theForm.NewPassword.value == "")
                    {
                        alert('Please enter a new password.');
                        theForm.NewPassword.focus();
                        return (false);
                    }
                    if (theForm.VerifyPassword.value == "")
                    {
                        alert('Please confirm your new password.');
                        theForm.VerifyPassword.focus();
                        return (false);
                    }
                    if (theForm.NewPassword.value != theForm.VerifyPassword.value)
                    {
                        alert('The new and confirm passwords do not match. Please try again.');
                        theForm.NewPassword.focus();
                        return (false);
                    }
                }
            //-->
        </SCRIPT>

        <FORM method="POST" action="/FPS/Forgot<%=osextension%>" onsubmit="return Validate(this)">
            <TABLE width="100%" height="75%">
                <TR>
                    <TD align="center" valign="middle">
                        <TABLE border="3" bgcolor="#c0c0c0" cellpadding="2" cellspacing="2">
                            <TR>
                                <TD align="left" valign="middle" bgcolor="#000080">
                                    <STRONG>
                                        <FONT face="Arial" size="3" color="#FFFFFF">
                                            Change Password
                                        </FONT>
                                    </STRONG>
                                </TD>
                            </TR>
                            <TR>
                                <TD>
                                    <TABLE>
                                        <TR>
                                            <TD align="right">
                                                Enter a new password:
                                            </TD>
                                            <TD align="left">
                                                <INPUT type="password" size="25" maxlength="32" name="NewPassword">
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD align="right">
                                                Re-enter new password:
                                            </TD>
                                            <TD align="left">
                                                <INPUT type="password" size="25" maxlength="32" name="VerifyPassword">
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD align="center" valign="bottom" colspan="2">
                                                <INPUT type="submit" value="Submit">
                                                <INPUT type="reset" value="Reset">
                                            </TD>
                                        </TR>
                                    </TABLE>
                                </TD>
                            </TR>
                        </TABLE>
                    </TD>
                </TR>
            </TABLE>
        </FORM>

        <SCRIPT language="JavaScript">
            <!--
                document.forms[0].elements[0].focus();
                <%if(Message.length() > 0){ %>
                    alert("<%=Message%>");
                <%} %>
           //-->
        </SCRIPT>
    </BODY>
</HTML>

