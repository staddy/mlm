<?php
    // регистрационная информация (пароль #2)
    // registration info (password #2)
    //$mrh_pass2 = "gS7JVSW42fO9cGniW8es";
    $mrh_pass2 = "zw573qKreUbU9cWP1cBq";

    //установка текущего времени
    //current date
    $tm=getdate(time()+9*3600);
    $date="$tm[year]-$tm[mon]-$tm[mday] $tm[hours]:$tm[minutes]:$tm[seconds]";

    // чтение параметров
    // read parameters
    $out_summ = $_REQUEST["OutSum"];
    $inv_id = $_REQUEST["InvId"];
    $shp_item = $_REQUEST["Shp_item"];
    $crc = $_REQUEST["SignatureValue"];

    $crc = strtoupper($crc);

    $my_crc = strtoupper(md5("$out_summ:$inv_id:$mrh_pass2"));

    // проверка корректности подписи
    // check signature
    if ($my_crc !=$crc)
    {
      echo "bad sign\n"."$out_summ:$inv_id:$mrh_pass2\n".$my_crc;
      exit();
    }

    // признак успешно проведенной операции
    // success
    echo "OK$inv_id\n";

    // TODO: запись в БД
    // запись в файл информации о проведенной операции
    // save order info to file
    /*$f=@fopen("order.txt","a+") or
	      die("error:".$php_errormsg);
    fputs($f,"order_num :$inv_id;Summ :$out_summ;Date :$date\n");
    fclose($f);*/
?>

