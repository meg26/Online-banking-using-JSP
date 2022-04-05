<html>
    <body>
        <jsp:include page="header.html"/>
        <div style="padding-left:16px">
        Transaction Succesful. 
        <%
        String type = (String) request.getAttribute("type");
        if(type != null && type.equals("DEBIT")) {
        %>
            Debited Rs. <%= request.getAttribute("amt") %> from A/C number <b><%= request.getAttribute("accno") %></b>
        <%
        }
        else if(type != null && type.equals("CREDIT")) {
        %>
            Credited Rs. <%= request.getAttribute("amt") %> to A/C number <b><%= request.getAttribute("accno") %></b>
        <%    
        }
        else if(type != null && type.equals("TRANSFER")) {
        %>
            Transfered Rs. <%= request.getAttribute("amt") %> from A/C number <b><%= request.getAttribute("sender") %></b> to A/C number <b><%= request.getAttribute("receiver") %></b>
        <%    
        }
        %>
        </div>
    </body>
</html>