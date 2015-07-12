<?php 
session_start();

?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发表帖子</title>
<link href="styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function $(a){
		return document.getElementById(a);
	}
	
	function validate(){
		if($("posttitle").value.length==0){ //validate message title
			alert("请输入帖子标题");
			$("posttitle").focus();
			return false;
		}
		
		if($("postcontent").value.length==0){
			alert("发帖内容不能为空");
			$("postcontent").focus();
			return false;
		}
	}
</script>
</head>
<body>
<?php 
// 判断用户是否登录
if (isset($_SESSION['userID'])) {
	include 'include/signintopnav.php';
}else {
	include 'include/topnav.php';
}
?>
<form action="addpost.php" name="addpost" method="post" onSubmit="return validate()">
标题：<input name="posttitle"  id="posttitle" type="text" class="title" 
value="<?php if(isset($_POST['posttitle']))echo $_POST['posttitle'];?>"><br>
<span class="content_title">内容：</span>
<textarea name="postcontent" id="postcontent" class="inputpostcontent" cols="69" rows="20"></textarea><br>
<input type="submit" class="submit" value="发表"> 

<?php 
// 根据用户登录状态提交作者信息
if (isset($_SESSION['username'])) {
	echo '<input name="postauthor" type="hidden" value="'.$_SESSION['username'].'">';
}else {
	echo '<span class="username">作者：</span><input name="postauthor" type="text" size="10">';
}
?>

</form>
</body>
</html>