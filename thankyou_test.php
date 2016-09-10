<?php
    include_once ("z_db.php");

    // Inialize session
    session_start();
    // Check, if username session is NOT set then this page will jump to login page
    if (!isset($_SESSION['paypalidsession'])) {
	print   "
		    <script language='javascript'>
			    window.location = '404.php';
		    </script>
		";
    }

    $userid=$_SESSION['paypalidsession'];
    /*if($_SERVER['REQUEST_METHOD'] == 'POST') 
    {
	$queryuser="SELECT id,pcktaken FROM  affiliateuser where username = '$userid'"; 
	$resultuser = mysqli_query($con,$queryuser);

	while($rowuser = mysqli_fetch_array($resultuser))
	{
	    $uaid="$rowuser[id]";
	    $pcktake="$rowuser[pcktaken]";
	 }
	$query="SELECT * FROM  packages where id = $pcktake"; 
	 
	$result = mysqli_query($con,$query);

	while($row = mysqli_fetch_array($result))
	{
	    $pckid="$row[id]";
	    $pname="$row[name]";
	    $pprice="$row[price]";
	    $pcur="$row[currency]";
	    $ptax="$row[tax]";
	    $gatewayid="$row[gateway]";
	    $total=$pprice+$ptax;
	}

	$query=mysqli_query($con,"insert into paypalpayments(orderid,transacid,price,currency,date,cod,pckid,gateway) values('$uaid','C.O.D','$total','$pcur',NOW(),1,'$pckid','C.O.D')");
				
	$sqlquery="SELECT wlink FROM settings where sno=0"; //fetching website from databse
	$rec2=mysqli_query($con,$sqlquery);
	$row2 = mysqli_fetch_row($rec2);
	$wlink=$row2[0]; //assigning website address

	$sqlquery222="SELECT email FROM settings where sno=0"; //fetching website from databse
	$rec3=mysqli_query($con,$sqlquery222);
	$row222 = mysqli_fetch_row($rec3);
	$email=$row222[0]; //assigning website address

	$sqlquery111="SELECT etext FROM emailtext where code='NEWMEMBER'"; //fetching website from databse
	$rec2111=mysqli_query($con,$sqlquery111);
	$row2111 = mysqli_fetch_row($rec2111);
	$emailtext=$row2111[0]; //assigning email text for email
			// More headers
	$headers = "MIME-Version: 1.0" . "\r\n";
	$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
	$headers .= 'From: <no-reply@'.$wlink.'>' . "\r\n";
	$to=$email;
	$subject="New COD Order SignUp | Bingo ";
	$message=$emailtext;
	mail($to,$subject,$message,$headers);
				
	print "
					<script language='javascript'>
						window.location = 'finalthankyoufree.php?username=$userid';
					</script>
				"; 			
				
				
				
    }*/

    $userid=mysqli_real_escape_string($con,$_SESSION['paypalidsession']);
    if ($userid=="")
    {
	print   "Oops!!! Something Went Wrong.... Contact your system administrator.";
	print   "
		    <script language='javascript'>
			    window.location = 'index.php';
		    </script>
		";
    }

    /*$q1234="SELECT paypalid,payzaid,solidtrustid,solidbutton from settings"; 
    $r1234 = mysqli_query($con,$q1234);

    while($row = mysqli_fetch_array($r1234))
    {
	$paypal_id="$row[paypalid]";
	$payza_id="$row[payzaid]";
	$solidtrust_id="$row[solidtrustid]";
	$solidbuttonname="$row[solidbutton]";
    }

    $paypal_url='https://www.paypal.com/cgi-bin/webscr'; // Test Paypal API URL*/

    $mrh_login = "testshop_staddy";
    $mrh_pass1 = "zw573qKreUbU9cWP1cBq";
    $inv_id = 678678;
    $inv_desc = "Товары для животных";
    $out_summ = "100.00";
    
    // нужно будет убрать
    $IsTest = 1;

    $crc = md5("$mrh_login:$out_summ:$inv_id:$mrh_pass1");
    print "<html><script language=JavaScript ".
      "src='https://auth.robokassa.ru/Merchant/PaymentForm/FormMS.js?".
      "MerchantLogin=$mrh_login&OutSum=$out_summ&InvoiceID=$inv_id".
      "&Description=$inv_desc&SignatureValue=$crc&IsTest=$IsTest'></script></html>";
?>