<?php
session_start();
if (!isset($_SESSION['userID'])) {
	header('location:index.php');
	exit();
}else {
	$_SESSION = array(); // free the session
	session_destroy();
	header('location:index.php');
	exit();
}
?>