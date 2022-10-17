<%@ page import="java.util.*" %>
<%@ page import="java.net.URLDecoder" %>
<%String osextension = "";if(System.getProperty("os.name").indexOf("Windows") > -1) osextension = ".exe";%>

<%
    // =================================================================
    // Identify-Multiple.asp - Sample Multiple page for FPS.
    //
    // This is a sample only. Customers should feel free to modify
    // this page (or port to different languages) as needed. However,
    // this page is supplied 'as is', without warranty.
    //
    // This page is only invoked if more than one user qualifies. It
    // is essentially identical to Identify.asp. In fact, Identify.asp
    // can serve both duties by configuring the same URL in APS.cfg.
    //
    // If the names of fields are changed, if new fields are added or
    // fields are removed, you will have to change APS.cfg in your
    // SiteMinder Bin directory. Also keep in mind that the form MUST
    // post to the FPS client, wherever it is on your site. 
    //
    // This form MUST post the same fields as Identify.asp.
    //
    // For security purposes, no comments should be contained in this
    // file that would be sent to the client (in other words, no HTML
    // comments). Server side script comments do not get sent to clients.
    //
    // Expected Input:
    //
    //   The query string will contain a list of field names that 
    //    were a problem. The two types of problems which can occur 
    //    are 1) Missing value for required field and 2) Field 
    //    contains an asterisk ("*").
    //
    //    A cookie called NPSFPSFields may be supplied if we are 
    //   looping back. This cookie will contain the list of field
    //   values previously posted. The format will be identical to
    //   how they appear to a CGI when posted ("field1=value1&field2=...")
    // =================================================================
%>

<%
    // =================================================================
    // Declarations
    // =================================================================

    String myCookieHeader;
    String Problem;                            // Holds list of problem fields
    String Fields;                            // Holds persistent field values

    // =================================================================
    // Initialization
    // =================================================================
    try{  
        Problem = URLDecoder.decode(request.getQueryString());
    }
    catch (Exception ex){
        Problem = "";
    }
    if(Problem.length() != 0)
        Problem = "&" + Problem + "&";

    myCookieHeader = request.getHeader("Cookie");

    Fields = getTheCookieValue(myCookieHeader, "NPSFPSFields");
%>

<HTML>
    <HEAD>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <TITLE>Forgotten Password Services (Multiple Users)</TITLE>
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
                            <br>
                            <font color="red">
                                More than one user was found with that information. 
                                <br>
                                Try supplying addition information to help us find you.
                            </font>
                            <br>
                            <font color="red">
                                More than one user was found with that information.
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
                                        <input type="text" name="UserID" 
                                               value="<%=GetFieldValue(Fields, "UserID")%>" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>*First Name:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="FirstName" 
                                               value="<%=GetFieldValue(Fields, "FirstName")%>" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>*Last Name:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="LastName" 
                                               value="<%=GetFieldValue(Fields, "LastName")%>" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>Phone:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="Phone" 
                                               value="<%=GetFieldValue(Fields, "Phone")%>" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>Email Address:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="Mail" 
                                               value="<%=GetFieldValue(Fields, "Mail")%>" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>City:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="City" 
                                               value="<%=GetFieldValue(Fields, "City")%>" size="25">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>State:&nbsp;</b>
                                    </td>
                                    <td align="left">
                                        <input type="text" name="State" 
                                               value="<%=GetFieldValue(Fields, "State")%>" size="25">
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
                                        <input type="text" name="phonenow" 
                                               value="<%=GetFieldValue(Fields, "phonenow")%>" size="25">
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

<%!
    // =================================================================
    // Function to retrieve the persistent value of a field. If we are
    // the target of a redirection because of an error in the input
    // data, either because of bad data or missing input, the values
    // that WERE filled in should remain filled in. FPS will pass the
    // names/values of fields in the cookie NPSFPSFields, where they can
    // be pulled out as required.
    // This function pulls the value of a specific field (or blank) from
    // the cookie. Note that this function does not handle multiple
    // values for the same field (it could be souped up easily).
    // =================================================================

public static String GetFieldValue(String Source, String FieldName)
{
    String Value = "";  // default return value
    
    if ( (null != Source) && (null != FieldName) )
    {
        String[] NvPs = Source.split("&");
        
        for ( int iter = 0 ; iter < NvPs.length ; iter++ )
        {
            if ( NvPs[iter].length() > 0 )
            {
                String[] thisSet = NvPs[iter].split("=");
                if ( (thisSet.length > 0) && (thisSet[0].length() > 0) )
                {
                    String theName = "";
                    String theValue = "";
                    try
                    {
                        theName = URLDecoder.decode(thisSet[0], "UTF-8");
                        
                        if ( (thisSet.length > 1) && (thisSet[1].length() > 0) )
                        {
                            theValue = URLDecoder.decode(thisSet[1], "UTF-8");
                            // previous sample code decoded the value twice,
                            // so had the equivalent of the aditional line:
                            // theValue = URLDecoder.decode(theValue, "UTF-8");
                        }
                    }
                    catch(Exception ex)
                    {
                        // just keep trying
                    }
                    
                    if ( FieldName.equals(theName) )
                    {
                        if ( theValue != null )
                        {
                            Value = theValue;
                        }
                        break;
                    }
                }
            }
        }
    }

    return Value;
}

public static String getTheCookieValue(String theHeader, String cookieName)
{
    String returnValue ="";
    String[] cookies = theHeader.split(";");
    for(int i = 0; i < cookies.length; i++)
    {
        String[] thisCookie = cookies[i].split("=", 2);
        if ( (thisCookie.length > 0) && (thisCookie[0].length() > 0) )
        {
            String theName = thisCookie[0].trim();
            if ( cookieName.equals(theName) )
            {
                if ( (thisCookie.length > 1) && (thisCookie[1].length() > 0) )
                {
                    try
                    {
                        returnValue = URLDecoder.decode(thisCookie[1], "UTF-8");
                        returnValue = returnValue.trim();
                    }
                    catch(Exception ex)
                    {
                        // just return empty string on error
                        returnValue = "";
                    }
                }

                break;
            }
        }
    }

    return returnValue;
}

%>

