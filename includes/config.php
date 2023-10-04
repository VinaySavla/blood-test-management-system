<?php
//time zone
date_default_timezone_set('Asia/Kolkata');
//database connection
$con=mysqli_connect("mysql.menrvasolutions.com","se51","Sakec@1234","bloodtmsdb");
if(mysqli_connect_errno()){
echo "Connection Fail".mysqli_connect_error();
}

  ?>
