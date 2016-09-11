<?php    
$src = '<?xml version="1.0" encoding="UTF-8"?>    
<SMS> 
<operations>  
<operation>SEND</operation> 
</operations> 
<authentification>    
<username></username>   
<password></password>   
</authentification>   
<message> 
<sender>SMS</sender>    
<text>Test message [UTF-8]</text>   
</message>    
<numbers> 
<number>380972920000</number>   
</numbers>    
</SMS>';  
    
$Curl = curl_init();    
$CurlOptions = array(   
CURLOPT_URL=>'http://api.myatompark.com/members/sms/xml.php',    
CURLOPT_FOLLOWLOCATION=>false,   
CURLOPT_POST=>true,  
CURLOPT_HEADER=>false,   
CURLOPT_RETURNTRANSFER=>true,    
CURLOPT_CONNECTTIMEOUT=>15,  
CURLOPT_TIMEOUT=>100,    
CURLOPT_POSTFIELDS=>array('XML'=>$src),   
);  
curl_setopt_array($Curl, $CurlOptions); 
if(false === ($Result = curl_exec($Curl))) {    
throw new Exception('Http request failed'); 
}   
    
curl_close($Curl);  
    
echo $Result;   
?>

