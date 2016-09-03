<?php

include_once("z_db.php");

function pay_and_go_up($con_, $userid, $sourceid, $side, $h, $amount) {
    if(($amount > 0) && ($side!="none")) {
        echo("userid: ".$userid." source: ".$sourceid." side: ".$side." h: ".$h." amont: ".$amount);
        $query2 = "SELECT active,".$h."_active,referedby,ref_h,ref_side FROM affiliateuser where Id = '$userid'"; 
        $result2 = mysqli_query($con_,$query2);
        $row2 = mysqli_fetch_row($result2);
        
        $active="$row2[0]";
        $h_active="$row2[1]";
        $referedby="$row2[2]";
        $ref_h="$row2[3]";
        $ref_side="$row2[4]";
        
        if($active && $h_active) {
            $cur=date("Y-m-d");
            $query=mysqli_query($con_,"insert into payments_balance(userid,sourceid,h_number,side,payment_amount,createdtime) values('$userid','$sourceid','$h','$side','$amount','$cur')");
        }
        
        if($referedby != "none") {
            $query3 = "SELECT COUNT(*),Id FROM affiliateuser where username = '$referedby'";
            $result3 = mysqli_query($con_, $query3);
            $row3 = mysqli_fetch_row($result3);
            $isref = $row3[0];
            $refid = $row3[1];
            if($isref == 1) {
                pay_and_go_up($con_, $refid, $sourceid, $ref_side, $ref_h, $amount);
            }
        }
    }
}

if(isset($_GET['id']) && isset($_GET['amount']) && is_numeric($_GET['amount'])) {
    $id=mysqli_real_escape_string($con,$_GET['id']);
    $amount=$_GET['amount'];
    $result = mysqli_query($con,"SELECT referedby,ref_h,ref_side FROM affiliateuser where Id = '$id'");
    $row = mysqli_fetch_row($result);
    $referedby = $row[0];
    $ref_h = $row[1];
    $ref_side = $row[2];
    if($referedby != "none") {
        $query3 = "SELECT COUNT(*),Id FROM affiliateuser where username = '$referedby'";
        $result3 = mysqli_query($con, $query3);
        $row3 = mysqli_fetch_row($result3);
        $isref = $row3[0];
        $refid = $row3[1];
        if($isref == 1) {
            pay_and_go_up($con, $refid, $id, $ref_side, $ref_h, $amount);
        }
    }
} else {
    die();
}

?>