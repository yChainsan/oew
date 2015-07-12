<?php
require 'include/dbconnect.php';
$sid=$_GET["sid"];
$q = "UPDATE subjectpost 
		SET view_number=view_number+1
		WHERE subjectID=$sid";
$result = mysqli_query($dbcon, $q);
$url = 'topic.php?sid='.$sid.'&p=1';
header('location:'.$url);
?>