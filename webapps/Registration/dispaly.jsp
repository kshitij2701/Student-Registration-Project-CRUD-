

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Member List</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Username</th>
				<th>Password</th>
				<th>Email</th>
				<th>Phone</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${memberList}">
				<tr>
					<td>${member.uname}</td>
					<td>${member.password}</td>
					<td>${member.email}</td>
					<td>${member.phone}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>