<?php
include_once ("z_db.php");
		
$msg=" Thank you for choosing us. Your Request Has Been Received successfully. Click to go to index page.";
$msg2="Your account is still pending approval, once it is verified, your account will become active and signup bonus(if any) and money to sponsors/referrals will be credited.";
// Delete all session variables
session_start();
session_destroy();
?>

<!DOCTYPE html>
<html lang="en" class="app">
<head>
<style>html {
    overflow-y: scroll; 
}</style>
<meta charset="utf-8" />
<title>Thank You | Skyey's Multi Level Marketing Script</title>
<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="css/app.v1.css" type="text/css" />
<!--[if lt IE 9]> <script src="js/ie/html5shiv.js"></script> <script src="js/ie/respond.min.js"></script> <script src="js/ie/excanvas.js"></script> <![endif]-->
<div id="google_translate_element" align="right"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, multilanguagePage: true}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        
</head>
<body style="overflow: scroll;" class="">
<section id="content" class="m-t-lg wrapper-md animated fadeInDown">
  <div> <a class="navbar-brand block" href="index.php"><?php print $msg; ?> </a>
    <section class="m-b-lg">
      <header class="wrapper text-center"> <strong><?php print $msg2 ?> </strong> </header>
  
       
    </section>
  </div>
</section>
<!-- footer -->
<footer id="footer">
  <div class="text-center padder clearfix">
    <p> <small><?php $query="SELECT footer from settings where sno=0"; 
 
 
 $result = mysqli_query($con,$query);

while($row = mysqli_fetch_array($result))
{
	$footer="$row[footer]";
	print $footer;
	}
  ?></small> 
  </div>
</footer>
<!-- / footer -->
<!-- Bootstrap -->
<!-- App -->
<script src="js/app.v1.js"></script>
<script src="js/app.plugin.js"></script>
</body>
</html>