<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<?php
// define the get reply author ip function
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

// ==向replypost表插入数据
// --收集reply_SID、reply_content、reply_author、reply_addtime、reply_addip 共5列数据
if ($_SERVER['REQUEST_METHOD']=='POST') {
	$errors=array();
	$trimcontent = trim($_POST['replycontent']);
	if (empty($trimcontent)) {
		$errors[]='回复内容不能为空！';
	}else {
		$reply_content = mysqli_real_escape_string($dbcon, $trimcontent);
	}
	$reply_SID = $_POST['reply_SID'];
	$reply_author = $_POST['replyauthor'];
	$reply_addip = getIP();
	
	/*  echo 'subjectID：'.$reply_SID.'<br>
	  	reply author：'.$reply_author.'<br>
	   reply content：'.$reply_content.'<br>
	   reply ip：'.$reply_addip;
	   exit('测试结束');
	*/
	if (empty($errors)) {
		$q = "INSERT INTO replypost(`replyID`, `reply_SID`,`reply_content`,`reply_author`,`reply_addtime`,`reply_addip`) 
	 		VALUES('', $reply_SID, '$reply_content', '$reply_author', NOW(), '$reply_addip')";
		// make the query
		$result = mysqli_query($dbcon, $q);

		// == 更新subjectpost表中数据
		// --首先收集lastreply_time、lastreply_author、reply_number 共3列数据
		// 查询replypost表获取reply_addtime、reply_author两列数据，取得最后添加的一条记录
		$qselect = "SELECT `reply_addtime`,`reply_author`
				FROM replypost WHERE reply_SID=$reply_SID 
				ORDER BY reply_addtime DESC";
		$selectres = mysqli_query($dbcon, $qselect);
		if ($selectres) {
			$lreply = mysqli_fetch_row($selectres);
			$lastreply_time = $lreply[0];
			$lastreply_author = $lreply[1];						
		}
		// echo gettype($lastreply_time); //结果显示$lastreply_time为string类型，无需转换为日期类型
		// exit('测试类型结束');
		$qupdate = "UPDATE subjectpost
				SET lastreply_time='$lastreply_time', lastreply_author='$lastreply_author', reply_number=reply_number+1
				WHERE subjectID=$reply_SID";
		// make the query
		mysqli_query($dbcon, $qupdate);
		
		// 结束数据库访问提示回复发表结果
		if ($result) {
			echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><script type="text/javascript">alert("回复成功"); location.href="topic.php?sid='.$reply_SID.'&p=1";</script>';
		}else {
			echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><script type="text/javascript">alert("回复失败！"); location.href="topic.php?sid='.$reply_SID.'&p=1";</script>';
		}
		
	}else {
		echo '<h2> &nbsp;出错了！</h2><p><br>';
		foreach ($errors as $msg){
			echo " - $msg<br>\n";
		}
		echo '<br> &nbsp;&nbsp;请<a href="javascript:history.go(-1)">返回</a>修改。</p>	';
	}
	
}

?>