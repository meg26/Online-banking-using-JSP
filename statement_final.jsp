<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/wad_lab", "root", "rajagiri");	
PreparedStatement ps = conn.prepareStatement("select * from transactions where (saccno=? or raccno=?) and date between ? and ?");
ps.setString(1, request.getParameter("accno"));
ps.setString(2, request.getParameter("accno"));
ps.setString(3, request.getParameter("sdate"));
ps.setString(4, request.getParameter("edate"));
ResultSet rs = ps.executeQuery();
%>
<html>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid black;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
    <body>
        <jsp:include page="header.html"/>
        <%
        if(!rs.next()) {
        %>
        <div style="padding-left:16px">
            Invalid account
        </div>
        <%
        }
        else {
        %>
            <div style="padding-left:16px;padding-right: 16px;">
            <table>
                <tr>
                    <th>T.NO</th>
                    <th>Sender A/C</th>
                    <th>Receipient A/C</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Description</th>
                </tr>                
        <%
            do {
                String type = rs.getString("type");
        %>
                <tr>
                    <td><%= rs.getInt("tid") %></td>
                    <td>
                        <% 
                        if(type.equals("TRANSFER")) {
                        %>
                            <%= rs.getString("saccno") %>
                        <%
                        }
                        else {
                        %>
                        NIL
                        <%
                        } 
                        %>
                    </td>
                    <td><%= rs.getString("raccno") %></td>
                    <td><%= type %></td>
                    <td><%= rs.getInt("amount") %></td>
                    <td><%= rs.getDate("date") %></td>
                    <td><%= rs.getString("descr") %></td>
                </tr>

        <%        
            } while(rs.next());
        %>
            </table>
            </div>
        <%
        }
        %>
    </body>
</html>
