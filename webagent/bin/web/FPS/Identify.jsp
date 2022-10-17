<%String osextension = "";if(System.getProperty("os.name").indexOf("Windows") > -1) osextension = ".exe";%>
<%
    // =================================================================
    // Identify.jsp - Sample identification page for FPS.
    //
    // This is a sample only. Customers should feel free to modify
    // this page (or port to different languages) as needed. However,
    // this page is supplied 'as is', without warranty.
    //
    // If the names of fields are changed, if new fields are added or
    // fields are removed, you *must* change APS.cfg on your
    // SiteMinder Bin directory. Also keep in mind that the form MUST
    // post to the FPS client, wherever it is on your site.
    //
    // For security purposes, no comments should be contained in this
    // file that would be sent to the client (in other words, no HTML
    // comments). Server side script comments do not get sent to clients.
    //
    // Expected Input:
    //   Since this is the entrypoint for forgotten passwords, there
    //   is no input.
    // =================================================================
%>

<HTML>
    <HEAD>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <TITLE>Forgotten Password Services (Identify)</TITLE>
        <meta http-equiv="Expires" content="Tue, 31 Dec 1997 23:59:59 GMT">
    </HEAD>

    <BODY bgbroperties="fixed">
        <center>
            <form method="post" action="/FPS/Forgot<%=osextension%>" onsubmit="return Validation(this)">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td align="left" valign="top">
                            <font face="arial,helvetica">
                                <font size="+1">
                                    <b>Please Identify Yourself</b>
                                </font>
                                <br>
                                <font size="-1">
                                    Please enter enough information so that we can identify you. 
                                </font>
                                <br>
                                <br>
                                <font size="1">
                                    Items marked with an asterisk ("*") are required.
                                </font>
                            </font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                <tr>
                                    <td align="right">
                                        <b>User ID (if known):&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="UserID" value="" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>*First Name:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="FirstName" value="" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>*Last Name:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="LastName" value="" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>Phone:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="Phone" value="" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>Email Address:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="Mail" value="" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>City:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="City" value="" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>State:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="State" value="" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <hr>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <b>Phone where you can be reached right now</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="text" name="phonenow" value="" size="25">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="silver">
                            <input type="submit" value="Submit">
                            <input type="reset">
                        </td>
                    </tr>
                </table>
            </form>
        </center>

    </BODY>

    <% // Force focus to first input element on the page %>

    <script language="JavaScript"><!--
        document.forms[0].elements[0].focus();
    //--></script>

    <% // Field validation routines to prevent round trip just to edit %>
    <% // Note that these edits are still performed server-side, in    %>
    <% // case JavaScript is disabled or not supported on the browser. %>

    <script language="JavaScript"><!--
        function Validation(theForm)
        {
            // Check for required fields that are blank

            if (theForm.elements["FirstName"].value == "")
            {
                alert("Please enter your first name.");
                theForm.elements["FirstName"].focus();
                return (false);
            }
            if (theForm.elements["LastName"].value == "")
            {
                alert("Please enter your last name.");
                theForm.elements["LastName"].focus();
                return (false);
            }

            // Asterisks are not allowed in ANY field

            for (i = 0;i < theForm.elements.length;i++)
                if (theForm.elements[i].type == "text")
                    if (theForm.elements[i].value.indexOf("*") != -1)
                    {
                        alert('This field may not contain an asterisk ("*").');
                        theForm.elements[i].focus();
                        return (false);
                    }
             return (true);
        }
    //--></script>

</HTML>
