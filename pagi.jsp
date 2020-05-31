<%@page import="xc.ds.User"%>
<%@page import="xc.ds.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
@media only screen and (max-width: 240px) , ( min-device-width : 768px)
	and (max-device-width: 1024px) {
	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr {
		display: block;
	}

	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr {
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	tr {
		margin: 0 0 1rem 0;
	}
	tr:nth-child(odd) {
		background: #ccc;
	}
	td {
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
		padding-left: 50%;
	}
	td:before {
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 0;
		left: 6px;
		width: 45%;
		padding-right: 10px;
		white-space: nowrap;
	}
}

#customers {
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}

.flex-container {
	display: flex;
	flex-wrap: nowrap;
}

@media screen and (max-width:980px) {
	.flex-container {
		flex-wrap: wrap;
	}
	.flex-container>div {
		justify-content: center;
	}
	.flex-container>button {
		justify-content: center;
	}
}

.flex-container>div {
	width: 300px;
	text-align: center;
	margin-bottom: 10px
}

@media screen and (min-width: 30em) {
	.single-nav ul {
		display: flex;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<p>Training</p>
			<hr>
		</div>
		<div class="content">
			<div class="search" style="margin-bottom: 50px;">

				<form action="">
					<div class="flex-container">
						<div>
							<span>Name</span> <span><input type="text"></span>
						</div>
						<div>
							<span>Age</span> <span><input type="text"></span>
						</div>
						<div>
							<span>sex</span> <span><input type="text"></span>
						</div>
						<div>
							<span>day</span> <span><input type="text"></span>
						</div>
						<div>
							<button>Search</button>
						</div>
					</div>
				</form>
			</div>
			<div class="table">

				<% if(Integer.parseInt(request.getAttribute("currentPage").toString())!=1 ) {%>
				<%-- <td><a href="users.do?page=<%=Integer.parseInt(request.getAttribute("currentPage").toString())%>">Previous</a></td>
				 --%>
				<%} %>
				<%-- <c:if test="${currentPage != 1}">
					<td><a href="users.do?page=${currentPage - 1}">Previous</a></td>
				</c:if> --%>
				<%-- <c:if test="${currentPage == 1}">
					<td><a class="disabled">Previous</a></td>
				</c:if>
 --%>












				<div class="pagination" style="margin-bottom: 10px">
					<button style="width: 60px">Next</button>
					<button style="width: 60px">pre</button>
				</div>

				<table id="customers">
					<tr>
						<th>id</th>
						<th>username</th>
						<th>password</th>
						<th>name</th>
						<th>age</th>
					</tr>

					<%
						List<User> list = new ArrayList<User>();
						list = (ArrayList) request.getSession().getAttribute("list");
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getId()%></td>
						<td><%=list.get(i).getUsername()%></td>
						<td><%=list.get(i).getPassword()%></td>
						<td><%=list.get(i).getName()%></td>
						<td><%=list.get(i).getAge()%></td>

					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		<div class="footer"></div>
	</div>
</body>
</html>
