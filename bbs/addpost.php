<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<?php
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

require 'include/dbconnect.php';

if ($_SERVER['REQUEST_METHOD']=='POST') { // post小写不可以，必须POST
	$errors=array();
	$trimtitle = trim($_POST['posttitle']);
	if (empty($trimtitle)) {
		$errors[]='您没有输入帖子标题，请重新输入！';
	}else {
		$post_title = mysqli_real_escape_string($dbcon, $trimtitle) ;
	}
	$trimcontent = trim($_POST['postcontent']);
	if (empty($trimcontent)) {
		$errors[]='您没有输入帖子内容，请重新输入！';
	}else {
		$post_content = mysqli_real_escape_string($dbcon, $trimcontent);
	}
	$post_author = $_POST['postauthor'];
	$user_ip = getIP();
	if (empty($errors)) {
		$sql="insert into subjectpost(subjectID, post_title,post_content,post_author, addtime, addip, lastreply_time)
		values('', '$post_title','$post_content','$post_author',NOW(),'$user_ip', NOW())";
		$result = mysqli_query($dbcon, $sql);
		if ($result) {
			echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><script type="text/javascript">alert("帖子发布成功"); location.href="index.php";</script>';
		}else {
			echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><script type="text/javascript">alert("帖子发布失败！"); location.href="compose.php";</script>';
		}
	
	} else {
		echo '<h2>出错了！</h2>
		<p>出现了以下错误，请<a href="javascript:history.go(-1)">返回</a>发帖页面修改！<br>';
		foreach ($errors as $msg){
			echo " - $msg<br>\n";
		}
		echo '</p>	';
	
	}	
	
	
}

?>