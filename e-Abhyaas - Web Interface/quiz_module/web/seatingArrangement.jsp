<%--
This page shows the seating arrangement of all the students under the invigilator who is currently logged in.

--%>

<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"  />
<title>e-Abhyaas : Invigilator</title>

<link href="main_style.css" rel="stylesheet" type="text/css" />

</head>

    <%
    if((session.getAttribute("name"))!=null&&(session.getAttribute("password")!=null))
    {
    %>


<body>
<div id="main_container">

    <div id="main_header">
    	<div id="logosection">
	        <div class="sitelogo"><img src="images/people.gif" width="215" height="75"></img></div>
        	<div class="sitename">&nbsp;e-<font style="font-family: Samarkan">&nbsp;Abhyaas</font></div>
      </div>
        <div id="header">
        	<div class="title">
        	  <p>Education through<br />
       	      <span class="bigtext">The Aakash Tablet</span></p>
        	  <p><br />
      	    </p>
            </div>

        </div>
	</div>

	<div id="main_menu">
    	<div id="search">
	</div>
        <div id="menu">
            <ul>


                <li><a href="invigilatorIndex.jsp" >Home</a></li>
                
                <li><a href="centreallotment.jsp" >Centre Allotment</a></li>
               <li><a href="seatingArrangement.jsp" class="current">Seating Arrangement</a></li>
                <li><a href="download.jsp">Downloads</a></li>
                <li><a href="uploadResults.jsp">Result</a></li>
            </ul>
        </div>
	</div>



	<div id="main_content">



    	<div id="main_left_column">

            <div id="leftcolumn_box01">
                <div class="leftcolumn_box01_top">
                    <h2>Welcome <%= session.getAttribute("firstName")%>!!</h2>
                </div>
                <div class="leftcolumn_box01_bottom">
                    <form method="post" action="#">
                      <div class="form_row"><a href="logout.jsp"/></div>
                        <div class="form_row"><label></label>
                        </div>
                  </form>
                </div>
            </div>

          <div id="leftcolumn_box02">
       	    <h2>Log Out</h2>
              <ul>

                  <li> </li>
                  <li></li>
              </ul>
            </div>

			<div id="imagebutton"><a href="#"><img src="images/SM111378.gif" alt="" width="220" height="138" /></a></div>

        </div>


   	  <div id="main_middle_column">

        	<h1>Seating Arrangement</h1>
            <p>&nbsp;</p>
            <%
            try
    {
    String fname=null;
    fname=(String)session.getAttribute("name");
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_moduledatabase","root","123");
    Statement st=con.createStatement();
    String qry="select MacID,StudentName from student where InvigilatorAllotted='"+fname+"'";
    ResultSet rs=st.executeQuery(qry);
   //System.out.println(qry);
     %>
     <table border="1" style="font-family: Calibri;font-size: medium;"align="left" size="10" class="form_row" cellspacing="0" >
                <tr>
                    <th>Mac ID</th>
                    <th>Student Name</th>
                    
                </tr>
                 <%
                while(rs.next()){
                      
%>
<tr >

    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(2)%></td>
    
</tr>
    <% } %>
<%

con.close();
}
    catch (Exception ex) {}
%>
</table>
   
   
    
       </div>

       <div id="main_right_column">
       <div class="rightbig_button"><img src="images/edu.gif" width="196" height="123"></img></div>
       <div class="sitename" align="left">
         <p><font size="+2">Let us sacrifice</font></p>
         <p><font size="+2"> our today</font></p>
         <p><font size="+2">so that </font></p>
         <p><font size="+2">our children </font></p>
         <p><font size="+2">can have </font>         </p>
         <p><font size="+2">a better</font></p>
         <p><font size="+2">tomorrow.</font></p>
         <p>&nbsp;</p>
         <p>&nbsp;</p>
       </div>

         <p>&nbsp;</p>
         <p>&nbsp;</p>
         <p><br />
         </p>
</div>

  </div>

    <!-- end of content -->


	<div id="main_footer">
             Copyright Â© Quiz Module| Designed by Quiz Module Team</div>
    <div id="main_footer_bottom"></div>

</div>
</body>

    <%
    }
    else
    {
    %>
    <jsp:forward page="index.jsp"/>
    <%
     }
    %>

</html>