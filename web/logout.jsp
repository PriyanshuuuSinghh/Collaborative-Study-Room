<%-- 
    Document   : logout
    Created on : 31 Mar 2026, 6:02:21 pm
    Author     : singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
session.invalidate();
response.sendRedirect("login.jsp");
%>