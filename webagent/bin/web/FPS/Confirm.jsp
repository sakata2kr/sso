<%@ page import="java.util.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="javax.servlet.http.HttpUtils" %>
<%
    // =================================================================
    // Confirm.asp - Sample Confirmation page for FPS.
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
    // Expected Input comes from query string, based on the fields
    // requested in the APS config file.
    // =================================================================
%>

<HTML>
    <HEAD>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <TITLE>Forgotten Password Services (Confirmation)</TITLE>
    </HEAD>

    <BODY bgbroperties="fixed">

        <script language="Javascript">
            <!--
                alert("Your user id is <%=GetFieldValue(request.getQueryString(), "uid")%>.");
                window.location = "http://www.successURL.com"
            //-->
        </script>
    </BODY>
</HTML>

<%!
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
%>