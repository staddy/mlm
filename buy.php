<?php

include_once("z_db.php");

if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['username']) && isset($_POST['amount'])) {
    $username=mysqli_real_escape_string($con,$_POST['username']);
    $ammount=mysqli_real_escape_string($con,$_POST['amount']);
    $result = mysqli_query($con,"SELECT count(*) FROM  affiliateuser where username = '$ref'");
    $row = mysqli_fetch_row($result);
    $numrows = $row[0];
    if ($numrows==0)
    {
    $msg=$msg."Sponsor/Referral Username Not Found..<BR>";
    $status= "NOTOK";
    }
} else {
    die();
}

?>