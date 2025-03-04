<%-- 
    Document   : cart.jsp
    Created on : Jan 20, 2024, 3:16:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="dal.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%    
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth!=null) {
        request.setAttribute("auth", auth);
    }
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
            ProductDAO pDao = new ProductDAO();
            cartProduct = pDao.getCartProducts(cart_list);
            double total = pDao.getTotalCartPrice(cart_list);
            request.setAttribute("total", total);
            request.setAttribute("cart_list", cart_list);
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/head.jsp" %>
        <title>Cart Page</title>
        <style type="text/css">
            .table tbody td {
                vertical-align: middle;
            }

            .btn-incre, .btn-decre {
                box-shadow: none;
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>

        <div class="container my-3">
            <div class="d-flex py-3">
                <h3>Total Price: $ <fmt:formatNumber pattern="##.##" value="${(total>0)?total:0}"/></h3>
                <a class="mx-3 btn btn-primary" href="check-out">Check Out</a></div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Image</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    if (cart_list != null) {
                        for (Cart c : cartProduct) {
                    %>
                    <tr>
                        <td><%=c.getName()%></td>
                        <td><%=c.getCategory()%></td>
                        <td><fmt:formatNumber pattern="##.##" value="<%= c.getPrice() %>"/></td>
                        <td><img src="images/<%= c.getImage() %>" alt="<%= c.getImage() %>" style="height: 180px; width: 300px;"/></td>
                        <td><a href="order-now?id=<%=c.getId() %>" class="btn btn-sm btn-primary">Buy now</a></td>
                        <td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
                    </tr>

                    <%
				}}%>
                </tbody>
            </table>
        </div>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
