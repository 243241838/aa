<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="${base}/resource/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resource/js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
      $(document).ready(function(){
      	
      	$(".delete").click(function(){
      		var href = $(this).attr("href");
      		$(".mf").attr("action",href).submit();
      		return false;
      	});
      });
      
    </script>
</head>
<body>
	成功跳转！！！<br>
	<form class="mf" action="" method="POST">
		<input type="hidden" name="_method" value="DELETE"/>
	</form>
	<#list list as item>
		id:${item.id}&nbsp;&nbsp;&nbsp;&nbsp;
		username:${item.username}&nbsp;&nbsp;&nbsp;&nbsp;
		password:${item.password}&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/zz/findbyid?id=${item.id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/zz/delete/${item.id}" class="delete">删除</a>
		<br>
	</#list>
	
	<form action="/zz/insert" method="POST">
		<center>
			<h2>添加</h2>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			id:<input type="text" name="id"/><br>
			username:<input type="text" name="username"/><br>
			password:s<input type="text" name="password"/><br>
			<input type="submit" value="添加"/>
		</center>
	</form>
</body>
</html>