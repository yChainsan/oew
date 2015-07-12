<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
<link href="styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function $(a){
		return document.getElementById(a);
	}
	function regvalidate(){
		if($("email").value.length==0){ //validate email
			alert("邮箱不能为空");
			$("email").focus();
			return false;
		}
		
		if($("username").value.length==0){
			alert("用户名不能为空");
			$("username").focus();
			return false;
		}

		if($("password1").value.length==0){ //验证密码非空
			alert("请输入密码");
			$("password1").focus();
			return false;
		}
		if($("password1").value.length<6){
			alert("密码长度至少需6位");
			$("password1").select();
			return false;
		}
		if($("password1").value!=$("password2").value){
			alert("两次输入的密码不一致");
			$("password2").focus();
			return false;
		}
	}

</script>

</head>
<body>
<?php 
include 'include/topnav.php';
// 获取用户ip
function getIP(){
	global $ip;
	if (getenv("HTTP_CLIENT_IP"))
		$ip = getenv("HTTP_CLIENT_IP");
	else if(getenv("HTTP_X_FORWARDED_FOR"))
		$ip = getenv("HTTP_X_FORWARDED_FOR");
	else if(getenv("REMOTE_ADDR"))
		$ip = getenv("REMOTE_ADDR");
	else $ip = "Unknow";
	return $ip;
}
// 判断注册内容是否无误
if($_SERVER['REQUEST_METHOD']=='POST'){
	$errors = array();
	require 'include/dbconnect.php';
	$trimemail = trim($_POST['email']);
	if (empty($trimemail)) {
		$errors[]='您没有输入邮箱，请重新输入！';
	}else {
		$email = mysqli_real_escape_string($dbcon, $trimemail) ;
	}
	$trimusername = trim($_POST['username']);
	if (empty($trimusername)) {
		$errors[]='您没有输入用户名，请重新输入！';
	}else {
		$username = mysqli_real_escape_string($dbcon, $trimusername);
	}
	// 检查密码是否为空
	if (empty($_POST['password1'])) {
		$errors[]='请输入有效密码！';
	}
	// 验证密码是否符合规范
	if (!preg_match('/^[\\~!@#$%^&*()-_=+|{}\[\],.?\/:;\'\"\d\w]{6,15}$/', $_POST['password1'])){
		$errors[] = '无效密码,密码长度不小于6位，不超过15位，不能有空格';
	}else {
		$psword1=$_POST['password1'];
	}
	if ($_POST['password1'] == $_POST['password2']) {
		$password=mysqli_real_escape_string($dbcon, trim($psword1));
	}else {
		$errors[]='两次输入的密码不一致，请重新输入！';
	}
	$ip = getIP();
	
	if (empty($errors)) { // 若提交内容无误将记录插入user表
		// 首先判断邮箱是否已被注册
		$q="select userID from user where email='$email'";
		$result = mysqli_query($dbcon, $q);
		if (mysqli_num_rows($result)==0) { // 如果查不到提交邮箱，则执行插入语句
			$q ="INSERT INTO user (userID,email,username,password,registration_ip,registration_time)
			VALUES('','$email','$username',SHA1('$password'),'$ip',NOW())";
			$result = mysqli_query($dbcon, $q);
			if ($result) { // 如果sql语句执行成功，提示注册成功
				echo '恭喜！注册成功';
			}else {
				echo '<h2>系统错误</h2>
				<p class="error">由于系统错误无法完成注册，请稍后再试。非常抱歉给您带来的不便！</p>';
				//Debug the message:
				echo '<p>'.mysqli_error($dbcon).'<br><br>Query: '.$q.'</p>';
			}
			mysqli_close($dbcon);
			exit();
		}else {
			echo '<p class="error">该邮箱已被注册，请选择其他邮箱注册！</p>';
		}
		
	}else{// 若提交内容有误，显示错误信息
		echo '<h2>注册信息有误！</h2>
			<p class="error">请检查以下错误：<br>';
		foreach ($errors as $msg){
			echo " - $msg<br>\n";
		}		
		echo '</p><h3>请重新提交注册信息</h3>';
		mysqli_close($dbcon);
		exit();
	} 
}
?>
<div class="regpage">
<form action="register.php" method="post" onsubmit="return regvalidate()">
<p>邮箱：<br><input id="email" name="email" type="text" style="height:20px; padding-left:5px; width:180px;" value="<?php if (isset($_POST['email'])) echo $_POST['email']; ?>"></p>
<p>用户名：<br><input id="username" name="username" type="text" style="height:20px; padding-left:5px; width:180px;" value="<?php if (isset($_POST['username'])) echo $_POST['username']; ?>"></p>
<p>密码：<br><input id="password1" name="password1" type="password" style="height:20px; padding-left:5px; width:180px;"></p>
<p>确认密码：<br><input id="password2" name="password2" type="password" style="height:20px; padding-left:5px; width:180px;"></p>
<input class="regsubmit" type="submit" value="注册">
</form>
</div>
</body>
</html>