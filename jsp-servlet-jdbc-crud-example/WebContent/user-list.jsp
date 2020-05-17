<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>

<body>


<%-- 
	 <header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> User
					Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header> --%>
	<br>


<%--For displaying Previous link except for the 1st page --%>
	<c:if test="${currentPage != 1}">
		<td><a href="users.do?page=${currentPage - 1}">Previous</a></td>
	</c:if>
	<c:if test="${currentPage == 1}">
		<td><a class="disabled">Previous</a></td>
	</c:if>

	<%--For displaying Page numbers. 
	The when condition does not display a link for the current page--%>
	<table border="1" cellpadding="2" cellspacing="2">
		<tr>
		
			 <c:forEach begin="1" end="${noOfPages}" var="i">
				<c:choose>
					<c:when test="${currentPage == i}">
						<td>${i}/ ${noOfPages}</td> 
					</c:when>
					<%-- <c:otherwise>
						<td><a href="users.do?page=${i}">${i}</a></td>
					</c:otherwise> --%>
				</c:choose>
			</c:forEach> 
		</tr>
	</table>
	
	<%--For displaying Next link --%>
	<c:if test="${currentPage lt noOfPages}">
		<td><a href="employee.do?page=${currentPage + 1}">Next</a></td>
	</c:if>
	<c:if test="${currentPage >= noOfPages}">
		<td><a class="disabled">Next</a></td>
	</c:if>
	<br>
	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">

			<!-- <h3 class="text-center">List of Users</h3> -->
			<hr>
			<%-- <div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New User</a>
			</div> --%>
			<br> <select id="year"></select> Year <select id="month"></select>
			Month <select id="day"></select> Day <span>&#160;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>
					<input type="button" value="XXX"> <input type="button"
					value="Truoc"> <span>4/20</span> <input type="button"
					value="Sau"> <input type="submit" value="Tim"> <input
					type="text"> <br> <br> <br> <br>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>Country</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<!--   for (Todo todo: todos) {  -->
							<c:forEach var="user" items="${employeeList}">

								<tr>
									<td><c:out value="${user.id}" /></td>
									<td><c:out value="${user.name}" /></td>
									<td><c:out value="${user.email}" /></td>
									<td><c:out value="${user.country}" /></td>
									<td><a href="edit?id=<c:out value='${user.id}' />">Edit</a>
										&nbsp;&nbsp;&nbsp;&nbsp; <a
										href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
								</tr>
							</c:forEach>
							<!-- } -->
						</tbody>

					</table>
		</div>
		<br>
	</div> 
</body>
<script type="text/javascript">
	/*  	var start = new Date().getFullYear()-10;
	 var end = new Date().getFullYear();
	 var options = "";
	 for (var year = end; year>= start; year--) {
	 options += "<option>" + year + "</option>";
	 }
	 document.getElementById("year").innerHTML = options;
	
	 var start = new Date().getFullYear()-10;
	 var end = new Date().getFullYear();
	 var options = "";
	 for (var year = end; year>= start; year--) {
	 options += "<option>" + year + "</option>";
	 }
	 document.getElementById("year").innerHTML = options; 
	 */$(document).ready(
			function() {
				const monthNames = [ "1", "2", "3", "4", "5", "6", "7", "8",
						"9", "10", "11", "12" ];
				var qntYears = 11;
				var selectYear = $("#year");
				var selectMonth = $("#month");
				var selectDay = $("#day");
				var currentYear = new Date().getFullYear();

				for (var y = 0; y < qntYears; y++) {
					let date = new Date(currentYear);
					var yearElem = document.createElement("option");
					yearElem.value = currentYear
					yearElem.textContent = currentYear;
					selectYear.append(yearElem);
					currentYear--;
				}

				for (var m = 0; m < 12; m++) {
					let monthNum = new Date(2018, m).getMonth()
					let month = monthNames[monthNum];
					var monthElem = document.createElement("option");
					monthElem.value = monthNum;
					monthElem.textContent = month;
					selectMonth.append(monthElem);
				}

				var d = new Date();
				var month = d.getMonth();
				var year = d.getFullYear();
				var day = d.getDate();

				selectYear.val(year);
				selectYear.on("change", AdjustDays);
				selectMonth.val(month);
				selectMonth.on("change", AdjustDays);

				AdjustDays();
				selectDay.val(day)

				function AdjustDays() {
					var year = selectYear.val();
					var month = parseInt(selectMonth.val()) + 1;
					selectDay.empty();

					//get the last day, so the number of days in that month
					var days = new Date(year, month, 0).getDate();

					//lets create the days of that month
					for (var d = 1; d <= days; d++) {
						var dayElem = document.createElement("option");
						dayElem.value = d;
						dayElem.textContent = d;
						selectDay.append(dayElem);
					}
				}
			});
</script>
</html>