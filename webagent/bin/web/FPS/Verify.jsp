<%@ page import="java.util.*" %>
<%@ page import="java.net.URLDecoder" %>
<%String osextension = "";if(System.getProperty("os.name").indexOf("Windows") > -1) osextension = ".exe";%>

<%
    // =================================================================
    // Verify.jsp - Sample page for FPS.
    //
    // This is a sample only. Customers should feel free to modify
    // this page (or port to different languages) as needed. However,
    // this page is supplied 'as is', without warranty.
    //
    // If the names of fields are changed, if new fields are added or
    // fields are removed, you will have to change APS.cfg in your
    // SiteMinder Bin directory. Also keep in mind that the form MUST
    // post to the FPS client, wherever it is on your site.
    //
    // For security purposes, no comments should be contained in this
    // file that would be sent to the client (in other words, no HTML
    // comments). Server side script comments do not get sent to clients.
    //
    // Expected Input:
    //   Initial data comes in a cookie called NPSFPSData.
    // =================================================================
%>

<%
    // =================================================================
    // Declarations
    // =================================================================

    String myCookieHeader;
    String Data;                            // Holds Input Data
    String Answer;
    String Question;
    String ThisQuestion;

    // =================================================================
    // Initialization
    // =================================================================

    myCookieHeader = request.getHeader("Cookie");
    Data = getTheCookieValue(myCookieHeader, "NPSFPSData");
    Question = GetFieldValue(Data, "SecretQuestion");
    Question = Question.trim();

    Answer = "";
%>

<HTML>
    <HEAD>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <TITLE>Forgotten Password Services (Verify)</TITLE>
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
                                    <b>Please Verify</b>
                                </font>
                                <br>
                                <font size="-1">
                                    Please verify that we have found the correct user. 
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
<%
                    while(!Question.equals(""))
                    {
                        if(Question.indexOf("|") > -1)
                        {
                           ThisQuestion = Question.substring(0, Question.indexOf("|"));
                           Question = Question.substring(Question.indexOf("|") + 1);
                        }
                        else
                        {
                            ThisQuestion = Question;
                            Question = "";
                        }
%>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                    <tr>
                                        <td align="center">
                                            <br>
                                            <b>
                                                *<%=GetQuestion(ThisQuestion)%>
                                            </b>
                                            <br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <textArea name="SecretAnswer" rows="3", cols="47"><%if(Answer.length() < 1) out.print(Answer); %></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
<%
                    }
%>
                    <tr>
                        <td align="center" bgcolor="silver">
                            <input type="submit" value="Submit">
                            <input type="reset">
                        </td>
                    </tr>
                </table>
            </form>
        </center>

    <% // Force focus to first input element on the page %>

    <script language="JavaScript"><!--
        document.forms[0].elements[0].focus();
    //--></script>

    </BODY>

    <% // Field validation routines to prevent round trip just to edit %>
    <% // Note that these edits are still performed server-side, in    %>
    <% // case JavaScript is disabled or not supported on the browser. %>

    <script language="JavaScript"><!--
        function Validation(theForm)
        {
            // Check for required fields that are blank

            if (theForm.elements["SecretAnswer"].value == "")
            {
                alert("Please answer the question.");
                theForm.elements["SecretAnswer"].focus();
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
public static String GetQuestion(String QID)
{
    String GetQuestion;
return(QID);

/**
        if(QID.equals("100"))
            GetQuestion = "What is your dog's name?";
        else if(QID.equals("101"))
            GetQuestion = "What color is the sky?";
        else if(QID.equals("102"))
            GetQuestion = "What color is grass?";
        else if(QID.equals("103"))
            GetQuestion = "What color is a fire engine?";
        else
            GetQuestion = "I do not know this question (" + QID + ")";
    return(GetQuestion);
*/
}
    
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

