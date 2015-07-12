<?php
/* 该页面要实现列表显示主题帖标题，以及分页显示；
 * 提供注册/登录入口；
 * 提供发帖入口和首页入口；
 * 底部显示帖子类目列表信息；
 */
// 开启会话
session_start();

?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BBS | 首页</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
<?php 
// 判断用户是否登录
if (isset($_SESSION['userID'])) {
	include 'include/signintopnav.php';
}else {
	include 'include/topnav.php';
}
// 27行开始用于列表显示帖子标题和相关信息
require 'include/dbconnect.php';

// 计算页面数，分页显示帖子主题列表
$pageNumber = 1;
if (isset($_GET["p"])) {
	$pageNumber=$_GET["p"];
}
$pageRows = 10;
// 以下5行代码用于计算总页数
$sql = "select count(subjectID) from subjectpost";
$result = mysqli_query($dbcon, $sql);
$row = mysqli_fetch_array($result,MYSQL_NUM); // 查到的记录存为索引数组
$records = $row[0]; // 取出索引数组中的第一个元素
$totalPages = ceil($records/$pageRows);

// 查询帖子主题、点击数、回复数、喜欢数、作者、ip、发帖日期，如果是匿名用户则显示”某用户(ip)“
$sql = "SELECT `subjectID`, `post_title`,`view_number`,`reply_number`,`like_number`,`post_author`,`addip`,`addtime`
		FROM subjectpost 
		ORDER BY lastreply_time DESC LIMIT ".($pageNumber-1)*$pageRows.",$pageRows";
$result = mysqli_query($dbcon, $sql);
while ($sjct = mysqli_fetch_array($result)) {
	if ($sjct["post_author"]=="") {
		$sjct["post_author"] = '某网友('.$sjct["addip"].')';
	}
	echo '<div class="subjectlist"><div class="postlisthead">
		<div class="plhtitle">主题：</div><div class="posttitle"><a href="viewnum.php?sid='.$sjct["subjectID"].'" target="_blank">'.$sjct["post_title"].'</a></div>
			<div class="readinfo">'.$sjct["view_number"].'阅读</div>
			<div class="readinfo">'.$sjct["reply_number"].'回复</div></div>
		<div class="postlistfooter">'.$sjct["post_author"].'&nbsp;发表于 '.$sjct["addtime"].'</div>
		<hr size="1">
		</div>';
}
// 分页
if ($pageNumber<=1) {
	echo '<div class="changepage"><form action="gopage.php" method="get"><span class="currentPage">这是首页</span>&nbsp;&nbsp;';
}else {
	echo '<div class="changepage"><form action="gopage.php" method="get"><a href="?p='.($pageNumber-1).'">上一页</a>&nbsp;&nbsp;';
}

if ($pageNumber > 1 && $pageNumber < $totalPages){
	echo '<span class="currentPage">P'.$pageNumber.'</span>';
}else{
	echo '';
}

if ($pageNumber>=$totalPages) {
	echo '&nbsp;&nbsp;<span class="currentPage">已至尾页</span>';
} else{
	echo '&nbsp;&nbsp;<a href="?p='.($pageNumber+1).'">下一页</a>';
}
echo'&nbsp;&nbsp;&nbsp;&nbsp;<span class="currentPage">共'.$totalPages.'页&nbsp;到第
<input type="text" class="goPage" name="gopage">
页</span>
<button type="submit" style="cursor:pointer;">Go</button></form>
</div>';
?>

<div id="footer">
<?php include 'include/footer.php';?>
</div>
</body>
</html>