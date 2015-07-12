<?php
$dbcon = @mysqli_connect("localhost","cabbage","in4aPin4aL","bbs")
OR die('Could not connect to MySQL: '.mysqli_connect_error());
mysqli_set_charset($dbcon, 'utf8');
?>