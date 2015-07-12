<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录BBS</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
<?php 
include 'include/topnav.php';
?>
<div class="loginpage">
<form action="login.php" method="post">
<p>邮　箱：<input name="email" type="text" style="height:20px; padding-left:5px;"></p>
<p>密　码：<input name="password" type="password" style="height:20px; padding-left:5px;"></p>
<input class="loginsubmit" type="submit" value="登入">
</form>
</div>
<?php
// 判断用户提交信息是否正确，若正确开始session，进入用户中心页，否则返回

if ($_SERVER['REQUEST_METHOD']=='POST') {
	require 'include/dbconnect.php';
	$email = $_POST['email'];
	$pass = $_POST['password'];
	$sql = "select userID, username, email, user_level from user
	where email='$email' and password=SHA1('$pass')";
	$result = mysqli_query($dbcon,$sql);
	if (@mysqli_num_rows($result)==1) { // 若查询到一条记录则开始session
		session_start();
		$_SESSION=mysqli_fetch_array($result, MYSQLI_ASSOC);
		$_SESSION['user_level'] = (int)$_SESSION['user_level'];
		$url = ($_SESSION['user_level']===1)?'admin.php':'index.php';
		header('location: '.$url);
		exit();
		mysqli_free_result($result);
		mysqli_close($dbcon);
	}else {
		echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
			<script type="text/javascript">alert("用户名或密码错误");
			location.href="login.php"</script>';
	}
	mysqli_close($dbcon);
}

?>

</body>
</html>