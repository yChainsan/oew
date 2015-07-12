<?php
session_start();
header("Content-Type: text/html; charset=utf-8");
require 'include/dbconnect.php';
// 是否有主题ID
if (isset($_GET["sid"])) {
	$sid = $_GET["sid"];
	// 查询主题帖表中的帖子信息
	$sql = "SELECT `post_title`, `post_content`, `post_author`, `addtime`, `addip`,`view_number`,`reply_number` 
	FROM subjectpost WHERE subjectID = '$sid'";	
	$result = mysqli_query($dbcon, $sql);
	if ($sjct = mysqli_fetch_array($result)) {
		$sjcttitle = $sjct["post_title"];
	}else {
		exit('该页面不存在');
	}
	
	if ($sjct["post_author"]=='') {
		$postauthor = '某网友('.$sjct["addip"].')';
	}else {
		$postauthor = $sjct["post_author"];
	}
}else {
	exit('该页面不存在');
}

?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>
<?php 
if (isset($sjcttitle)) {
	echo $sjcttitle;
}else {
	echo 'Topic Title';
}
?> | BBS</title>
<link rel="stylesheet" href="styles.css" type="text/css">
<script type="text/javascript">
	function $(a){
		return document.getElementById(a);
	}
	function validate(){
		if($("replycontent").value.length==0){
			alert("回复内容不能为空，请输入内容！");
			$("replycontent").focus();
			return false;
		}
	}
	function replyThisFloor(f){
		var obcontent = $("replycontent");
		var par = "replyauthor"+f;
		var replyauthor = $(par).innerText;
		//alert(replyauthor);
		obcontent.innerHTML="回"+f+"楼 "+replyauthor+"：<br><br>";
		obcontent.focus();
	}
	
</script>
</head>
<body>
<div class="container">
<?php
// 判断用户是否登录
if (isset($_SESSION['userID'])) {
	include 'include/signintopnav.php';
}else {
	include 'include/topnav.php';
}


// 计算回复页面数，分页显示帖子主题列表
$pageNumber = 1;
if (isset($_GET["p"])) {
	$pageNumber=$_GET["p"];
}
$pageRows = 15; // 每页显示的回复贴数
// 以下5行代码用于计算总页数
$sql = "SELECT COUNT(*) from replypost WHERE reply_SID=$sid";
$result = mysqli_query($dbcon, $sql);
$row = mysqli_fetch_array($result,MYSQL_NUM); // 查到的记录存为索引数组
$records = $row[0]; // 取出索引数组中的第一个元素
$totalPages = ceil($records/$pageRows);
///*
// ================= 顶部分页区开始 ================
if ($pageNumber<=1) {
	echo '<div class="topChangeReplyPage"><div class="currentReplyPage">本主题有'.$records.'个回复帖&nbsp;共'.$totalPages.'页</div>';
	echo '<ul class="replyPageList"><li><button class="noLinkReplyPage">1</button></li>';
	for ($i = 2; $i <= $totalPages; $i++) {
		echo '<li><a href="?sid='.$sid.'&p='.$i.'"><button class="linkReplyPage">'.$i.'</button></a></li>';
	}
	echo '</ul>';
}else {
	echo '<div class="topChangeReplyPage"><div class="currentReplyPage">本主题有'.$records.'个回复帖&nbsp;共'.$totalPages.'页</div><a href="?sid='.$sid.'&p='.($pageNumber-1).'" class="nextReplyPage"><button class="linkReplyPage">上一页</button></a><ul class="replyPageList">';
	for ($i = 1; $i < $pageNumber; $i++) {
		echo '<li><a href="?sid='.$sid.'&p='.$i.'"><button class="linkReplyPage">'.$i.'</button></a></li>';
	}
	echo '<li><button class="noLinkReplyPage">'.$pageNumber.'</button></li>'; // print current page
	for ($i = $pageNumber; $i < $totalPages; $i++) {
		echo '<li><a href="?sid='.$sid.'&p='.($i+1).'"><button class="linkReplyPage">'.($i+1).'</button></a></li>';
	}
	echo '</ul>';
}

if ($pageNumber>=$totalPages) {
	echo '';
} else{
	echo '<a href="?sid='.$sid.'&p='.($pageNumber+1).'" class="nextReplyPage"><button class="linkReplyPage">下一页</button></a>';
}
echo'</div><br><br>';
// ================= 顶部分页区结束 ================
//*/

// 输出主题帖标题、内容、作者（若匿名输入ip地址）、发帖日期
if ($_GET["p"]==1) { //若当前为第一页则显示主题帖
	echo '<div class="subjectpost">
		<div class="posthead"><div class="topictitle">'.$sjct["post_title"].'</div>
		<div class="postheadinfo">阅读:'.$sjct["view_number"].'</div>
		<div class="postheadinfo">回复:'.$sjct["reply_number"].'</div>
		<a href="#reply" title="回复此主题"><button class="titlereplybtn">回复</button></a></div>
		<div class="postcontent">'.$sjct["post_content"].'</div>
		<div class="postfooter">作者：'.$postauthor.'<div class="pfooterright"> 1楼  &nbsp;'.$sjct["addtime"].' &nbsp;<a href="#reply" title="回复此主题">回复</a></div></div></div>';
}else { //若当前页不是第一页则只显示主题帖标题
	echo '<div class="subjectpost">
		<div class="posthead"><div class="topictitle">回复：'.$sjct["post_title"].'</div>
		<div class="postheadinfo">阅读:'.$sjct["view_number"].'</div>
		<div class="postheadinfo">回复:'.$sjct["reply_number"].'</div>
		<a href="#reply" title="回复此主题"><button class="titlereplybtn">回复</button></a></div></div>';

}

// 查询并输出全部回复贴信息：
$qreply = "SELECT `replyID`, `reply_content`,`reply_author`,`reply_addtime`,`reply_addip` 
		FROM replypost
		WHERE reply_SID=$sid
		ORDER BY reply_addtime ASC
		LIMIT ".($pageNumber-1)*$pageRows.",$pageRows";
$rplres = mysqli_query($dbcon, $qreply);
$f=($pageNumber-1)*$pageRows+1;
while ($reply = mysqli_fetch_array($rplres,MYSQLI_ASSOC)) {
	$f++;
	if ($reply["reply_author"]=="") {
		$reply["reply_author"] = '某网友('.$reply["reply_addip"].')';
	}
	echo '<div class="replypost"><div class="postcontent">'.$reply["reply_content"].'</div>
		<div class="postfooter">作者：<span id="replyauthor'.$f.'">'.$reply["reply_author"].'</span><div class="pfooterright"> '.$f.'楼  &nbsp;'.$reply["reply_addtime"].' &nbsp;<a href="#reply" title="回复此楼层" onclick="replyThisFloor('.$f.')">回复</a></div></div>
		</div>';
}

?>
<!-- 底部分页区开始 -->
<?php 
if ($pageNumber<=1) {
	echo '<div class="changeReplyPage"><div class="currentReplyPage">本主题有'.$records.'个回复帖&nbsp;共'.$totalPages.'页</div>';
	echo '<ul class="replyPageList"><li><button class="noLinkReplyPage">1</button></li>'; 
	for ($i = 2; $i <= $totalPages; $i++) {
		echo '<li><a href="?sid='.$sid.'&p='.$i.'"><button class="linkReplyPage">'.$i.'</button></a></li>';
	}
	echo '</ul>';
}else {
	echo '<div class="changeReplyPage"><div class="currentReplyPage">本主题有'.$records.'个回复帖&nbsp;共'.$totalPages.'页</div><a href="?sid='.$sid.'&p='.($pageNumber-1).'" class="nextReplyPage"><button class="linkReplyPage">上一页</button></a><ul class="replyPageList">';
	for ($i = 1; $i < $pageNumber; $i++) {
		echo '<li><a href="?sid='.$sid.'&p='.$i.'"><button class="linkReplyPage">'.$i.'</button></a></li>';
	} 
	echo '<li><button class="noLinkReplyPage">'.$pageNumber.'</button></li>'; // print current page
	for ($i = $pageNumber; $i < $totalPages; $i++) {
		echo '<li><a href="?sid='.$sid.'&p='.($i+1).'"><button class="linkReplyPage">'.($i+1).'</button></a></li>';
	}
	echo '</ul>';
}

if ($pageNumber>=$totalPages) {
	echo '';
} else{
	echo '<a href="?sid='.$sid.'&p='.($pageNumber+1).'" class="nextReplyPage"><button class="linkReplyPage">下一页</button></a>';
}
echo'</div>';
?>
<!-- 底部分页区结束 -->
<br><br>
<div class="replydiv" id="reply">
&nbsp;发表回复<br>
<form action="addreply.php" name="addreply" method="post" onSubmit="return validate()">
<div class="inputreplytitle">内容：</div>
<textarea name="replycontent" id="replycontent" class="inputreplycontent" cols="81" rows="12"></textarea><br>
<input type="submit" class="submitreply" value="发表"> 

<?php 
// 根据用户登录状态提交作者信息
if (isset($_SESSION['username'])) {
	echo '<input name="replyauthor" type="hidden" value="'.$_SESSION['username'].'">';
}else {
	echo '<span class="username">作者：</span><input name="replyauthor" type="text" size="10">';
}
?>
<input type="hidden" name="reply_SID" value="<?php echo $sid; ?>" >
</form>
</div>
</div>
<div id="footer">
<?php include 'include/footer.php';?>
</div>
</body>