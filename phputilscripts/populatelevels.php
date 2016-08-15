<?php

include_once("../z_db.php");

// that's the format
echo("{id-0;level-1;referedby-2}-0<br>{id-0;level-1;referedby-2}-1<br><br>");

// kinda like enums
        const id = 0;
        const level = 1;
        const referedbyname = 2;
        const referedbyid = 3;
// id = 92, array index = 7, delta = 85
        const idtoindexratio = 85;

// selects the complete tree of the users having referals
$sql = 'Select af.Id, af.Level, af.referedby, ruser.id as referedbyid '
        . 'from affiliateuser af'
        . ' left outer join affiliateuser ruser'
        . ' on af.referedby = ruser.username;';

$fetchedres = mysqli_query($con, $sql);
$userinfo = mysqli_fetch_all($fetchedres);

print_r($userinfo);
echo("<br><br>");
$processednodes = array();
// to keep track of the processed users
foreach ($userinfo as $usernode)
{
    $nodestate = array($usernode[id],0);
    array_push($processednodes,$nodestate);
    // will result in a multidimensional array with 0-id and 1-processed state, the id-index delta stays
}
// to record which levels to input
$levels = array();

//// starting from the last
//for ($i = count($userinfo) - 1; $i > 0; $i--) {
//    // if encountered a guy who was referred
//    if ($userinfo[$i][referedbyid] != null && $processednodes[$i][1]==0) {
//        array_push($levels, array($userinfo[$i][referedbyid], 1));
//        echo("<br>" . $i . ": ");
//        print_r($levels);
//    }
//}
?>
