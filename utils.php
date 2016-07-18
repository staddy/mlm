<?php

function get_h($ref) {
    $tmp = substr($ref, 0, 2);
    if($tmp == 'h1' || $tmp == 'h2' || $tmp == 'h3') {
        return $tmp;
    } else {
        return NULL;
    }
}

function get_id($ref) {
    $ref_id = substr($ref, 2);
    if(strlen($ref_id) == 7 && ctype_digit($ref_id)) {
        return intval($ref_id);
    } else {
        return NULL;
    }
}

?>