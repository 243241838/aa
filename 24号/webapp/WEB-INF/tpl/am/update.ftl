<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<form action="/zz/update" method="POST">
		<input type="text" name="id" value="${po.id}"/><br>
		<input type="text" name="username" value="${po.username}"/><br>
		<input type="text" name="password" value="${po.password}"/><br>
		
		<input type="submit" value="修改"/>
	</form>
</body>
</html>