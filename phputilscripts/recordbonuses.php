<?php

include_once("../z_db.php");

$GLOBALS['con'] = $con;

// думаю, можно было бы переогранизовать все, чтобы сделать с классами
// returns an array of all the records in the payment balance, sorted by the created date
function getBalanceArray($id) {

    $query = "SELECT pb.*, "
            . "((select af.level "
            . "from affiliateuser af "
            . "where af.Id = pb.sourceid) "
            . "- "
            . "(select af.level from "
            . "affiliateuser af  "
            . "where af.Id = pb.userid)) as bonuslevel " //difference between the user levels
            . "FROM payments_balance pb "
            . "WHERE userid = '$id' AND "
            . "TO_DAYS(CURTIME()) - TO_DAYS(createdtime) >=" //the correct time
            . "(SELECT nrpaydays "
            . "FROM timeouts) "
            . "ORDER BY createdtime;";

    echo($query);
    $result = mysqli_query($GLOBALS['con'], $query);
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function getLevelLimits($id) {
    /*
      SELECT *
      FROM levellimits ll join userlevels ul
      on ll.level = ul.level
      WHERE ul.userid = '85';
     */
    $query = "SELECT ll.level, ll.limit, ul.userid, ul.obtained "
            . "FROM levellimits ll left outer join userlevels ul "
            . "on ll.level = ul.level "
            . "WHERE ul.userid = '".$id."'; ";
    echo($query);
    $result = mysqli_query($GLOBALS['con'], $query);
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

function getObtainedAtLevel($id,$level)
{
    $query = "SELECT id, userid, level, obtained "
            . "FROM userlevels "
            . "WHERE userid = '".$id."' "
            . "AND level = ".$level."; ";
    //echo($query);
    $result = mysqli_query($GLOBALS['con'], $query);
    if($result->num_rows != 0)
    {
        return mysqli_fetch_row($result);
    }
    else
    {
        return -1;
    }
}


$user_levels = array();
$user_topups = array();
$userid = 0;


if (isset($_GET['id'])) {
    $userid = $_GET['id'];
    $user_topups = getBalanceArray($userid);
    $user_levels = getLevelLimits($userid);
    echo("<br/>kekek<br/>");
    print_r($user_topups);
    echo("<br/>ekekek<br/>");
    print_r($user_levels);
}

echo('<br/>' . count($user_topups));
if (isset($user_topups)) {
    // I don't know if it's quicker to access the db or run php
    for ($j = 0; $j < count($user_topups) - 1; $j++) {
        $oldestID = $j;
        for ($i = $oldestID + 1; $i < count($user_topups); $i++) {
            if (
                    $user_topups[$i]['scoretype'] == $user_topups[$oldestID]['scoretype'] && $user_topups[$i]['side'] != $user_topups[$oldestID]['side'] && $user_topups[$i]['bonuslevel'] == $user_topups[$oldestID]['bonuslevel']
            ) {
                echo("<br/>!!!GOTCHA!<br/>");
                print_r($user_topups[$oldestID]);
                echo("<br/>");
                print_r($user_topups[$i]);
                $pairlevel = $user_topups[$oldestID]['bonuslevel'];
                $balanceToRec = $user_topups[$oldestID]['payment_amount'] + $user_topups[$i]['payment_amount'];
                echo("<br/>".$balanceToRec);
                
                $userLimitOnLevel = getObtainedAtLevel($userid, $pairlevel);
                echo("<br/>");
                print_r($userLimitOnLevel);
                
                $pairlimit = 0;
                if($pairlevel<7)
                {
                    $pairlimit = pow(2,($pairlevel-1))*1000;
                }else
                {
                    $pairlimit= 50000; //static stuff for levels 7 and above
                }
                
                
                if($userLimitOnLevel!=-1)
                {
                    $balanceToRec += $userLimitOnLevel[3]; //3rd element is the obtained number
                    if($balanceToRec>$pairlimit)
                    {
                        $balanceToRec = $pairlimit;
                    }
                    $stmnt = "UPDATE USERLEVELS SET OBTAINED = ".$balanceToRec." "
                            . "WHERE ID = ".$userLimitOnLevel[0];
                    echo("<br/>".$stmnt." limit:".$pairlimit);
                }else
                {
                    if($balanceToRec>$pairlimit)
                    {
                        $balanceToRec = $pairlimit;
                    }
                    $stmnt = "INSERT INTO USERLEVELS(userid, level, obtained) "
                            . "VALUES (".$userid.",".$pairlevel.",".$balanceToRec.");";
                    echo("<br/>".$stmnt." limit:".$pairlimit);
                }
            }
        }
    }
}
?>
