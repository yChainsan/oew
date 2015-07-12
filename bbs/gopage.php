<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<?php
require 'include/dbconnect.php';

$p=$_GET['gopage'];
$pageRows = 4;
// 以下5行代码用于计算总页数
$sql = "select count(subjectID) from subjectpost";
$result = mysqli_query($dbcon, $sql);
$row = mysqli_fetch_array($result,MYSQL_NUM);
$records = $row[0];
$totalPages = ceil($records/$pageRows);

if($p<=0 || $p > $totalPages){
	echo '输入页面超出范围！<br><br>请<a href="javascript:history.go(-1);">返回</a>重新输入';
} else{
	header('Location: index.php?p='.$p);
}
?>