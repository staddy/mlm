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
            . "accounted = 0 AND "
            . "TO_DAYS(CURTIME()) - TO_DAYS(createdtime) >=" //the correct time
            . "(SELECT nrpaydays "
            . "FROM timeouts) "
            . "ORDER BY createdtime;";

    echo($query);
    $result = mysqli_query($GLOBALS['con'], $query);
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

// user levels retrieval from db
/*
  function getLevelLimits($id) {
  /*
  SELECT *
  FROM levellimits ll join userlevels ul
  on ll.level = ul.level
  WHERE ul.userid = '85';
  /
  $query = "SELECT ll.level, ll.limit, ul.userid, ul.obtained "
  . "FROM levellimits ll left outer join userlevels ul "
  . "on ll.level = ul.level "
  . "WHERE ul.userid = '".$id."'; ";
  echo($query);
  $result = mysqli_query($GLOBALS['con'], $query);
  return mysqli_fetch_all($result, MYSQLI_ASSOC);
  }
 */

// чтоб найти самый низкий левел возможный для заполнения
function getLowestAvailableLevelsForLevel($userid, $currentLevel) {
    /*
      SELECT ul.level, ul.obtained
      FROM userlevels ul
      WHERE ul.obtained <
      (select ll.limits
      from levellimits ll
      where ll.level = ul.level)
      AND ul.userid = '86'
      AND ul.level <= '4'
      ORDER BY ul.level ASC;
     */
    $query = "SELECT ul.level, ul.obtained "
            . "FROM userlevels ul "
            . "WHERE ul.obtained < "
            . "(select ll.limits "
            . "from levellimits ll "
            . "where ll.level = ul.level) "
            . " AND ul.userid = '" . $userid . "' "
            . "AND ul.level <= '" . $currentLevel . "' "
            . "ORDER BY ul.level ASC;";

    $result = mysqli_query($GLOBALS['con'], $query);
    if ($result->num_rows != 0) {
        return mysqli_fetch_row($result);
    } else {
        return -1;
    }
}

// to get the highest occupied levels before the specified level
// если вдруг левелы не появились с заполнением
function getHIghestOccupiedLevelsForLevel($userid, $currentLevel) {
    /*
      SELECT ul.level, ul.obtained
      FROM userlevels ul
      WHERE ul.obtained <
      (select ll.limits
      from levellimits ll
      where ll.level = ul.level)
      AND ul.userid = '86'
      AND ul.level <= '4'
      ORDER BY ul.level ASC;
     */
    $query = "SELECT ul.level, ul.obtained "
            . "FROM userlevels ul "
            . "WHERE ul.obtained = "
            . "(select ll.limits "
            . "from levellimits ll "
            . "where ll.level = ul.level) "
            . " AND ul.userid = '" . $userid . "' "
            . "AND ul.level <= '" . $currentLevel . "' "
            . "ORDER BY ul.level DESC;";

    $result = mysqli_query($GLOBALS['con'], $query);
    if ($result->num_rows != 0) {
        return mysqli_fetch_row($result);
    } else {
        return "nofilledlowerlevels";
    }
}

function getObtainedAtLevel($id, $level) {
    $query = "SELECT * "
            . "FROM userlevels "
            . "WHERE userid = '" . $id . "' "
            . "AND level = " . $level . "; ";
    //echo($query);
    $result = mysqli_query($GLOBALS['con'], $query);
    if ($result->num_rows != 0) {
        return mysqli_fetch_row($result);
    } else {
        return -1;
    }
}

$user_levels = array();
$user_topups = array();
$userid = 0;


if (isset($_GET['id'])) {
    $userid = $_GET['id'];
    $user_topups = getBalanceArray($userid);
    //$user_levels = getLevelLimits($userid);
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
                echo("<br/>" . $balanceToRec);

                $userLimitsBeforeLevel = getLowestAvailableLevelsForLevel($userid, $pairlevel);
                echo("<br/>");
                print_r($userLimitsBeforeLevel);

                /*
                  $pairlimit = 0;
                  if ($pairlevel < 7) {
                  $pairlimit = pow(2, ($pairlevel - 1)) * 1000;
                  } else {
                  $pairlimit = 50000; //static stuff for levels 7 and above
                  }
                 */

                if ($userLimitsBeforeLevel != -1) {
                    
                    // для безопасности
                    mysqli_begin_transaction($GLOBALS['con']);
                    
                    // if found some available levels before the specified level
                    $levelToFill = $userLimitsBeforeLevel[0];
                    $balanceToSet = $userLimitsBeforeLevel[1] + $balanceToRec;
                    if ($levelToFill < 7) {
                        $levelLimit = pow(2, ($levelToFill - 1)) * 1000;
                    } else {
                        $levelLimit = 50000;
                    }
                    if ($balanceToSet > $levelLimit) {
                        // if balance to record exceeds the limit
                        $balanceToSet = $levelLimit;
                    }
                    // else everything is fine


                    
                    $stmnt = "SET SQL_SAFE_UPDATES = 0; UPDATE USERLEVELS SET OBTAINED = " . $balanceToSet . " "
                            . "WHERE LEVEL = '". $levelToFill."' "
                            . "AND USERID = '".$userid."'; SET SQL_SAFE_UPDATES = 1;";
                    echo("<br/>" . $stmnt . " limit:" . $levelLimit);

                    $stmntupdatebalancerecords = "UPDATE PAYMENTS_BALANCE "
                            . "SET ACCOUNTED = 1 "
                            . "WHERE id in (" . $user_topups[$oldestID]['Id'] . ","
                            . $user_topups[$i]['payment_amount'] . ");";

                    // writing to the db, uncomment when needed
                    $updatepb = mysqli_query($GLOBALS['con'], $stmntupdatebalancerecords);
                    $insertq = mysqli_query($GLOBALS['con'], $stmnt);
                    
                } else {
                    /* no available levels were found
                     
                    if ($balanceToRec > $pairlimit) {
                        $balanceToRec = $pairlimit;
                    }
                    $stmnt = "INSERT INTO USERLEVELS(userid, level, obtained) "
                            . "VALUES (" . $userid . "," . $pairlevel . "," . $balanceToRec . ");";
                    echo("<br/>" . $stmnt . " limit:" . $pairlimit);
                    $stmntupdatebalancerecords = "UPDATE PAYMENTS_BALANCE "
                            . "SET ACCOUNTED = 1 "
                            . "WHERE id in (" . $user_topups[$oldestID]['id'] . ","
                            . $user_topups[$i]['payment_amount'] . ");";
                    */
                    // but if there's at least b
                    if($user_topups[$i]['scoretype'] == 'b')
                    {
                        $theCurrentLEvelInfo = getObtainedAtLevel($userid, $pairlevel);
                        if($theCurrentLEvelInfo != -1)
                        {
                            $bAmountToSet = $balanceToRec + $theCurrentLEvelInfo[4]; //the extra B score is stored at 4th column
                            
                            $stmnt = "SET SQL_SAFE_UPDATES = 0; UPDATE USERLEVELS SET OBTAINEDEXTRAB = " . $bAmountToSet . " "
                            . "WHERE LEVEL = '". $pairlevel."' "
                            . "AND USERID = '".$userid."';";
                            echo("<br/>" . $stmnt);
                            $updatepb = mysqli_query($GLOBALS['con'], $stmnt);
                        }
                    }
                    
                    
                    $stmntupdatebalancerecords = "UPDATE PAYMENTS_BALANCE "
                            . "SET ACCOUNTED = 1 "
                            . "WHERE id in (" . $user_topups[$oldestID]['Id'] . ","
                            . $user_topups[$i]['payment_amount'] . ");";
                    // writing to the db, uncomment when needed
                    $updatepb = mysqli_query($GLOBALS['con'], $stmntupdatebalancerecords);
                    
                }
                $transactionResult = mysqli_commit($GLOBALS['con']);
                if($transactionResult == True)
                {
                    echo("<br/>SUCCESS!<br/>");
                }
                else
                {
                    echo("<br/>FUCKIT!<br/>");
                }
            }
        }
    }
}
?>
