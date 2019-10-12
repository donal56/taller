<?php
//session_start();
namespace app\web\ws;

class APICl {
	public function API($app, $user, $pass, $role){
		// Dirección del recurso
	   
		$url = "http://192.168.4.25/intertecws/server/index.php";
		
		// Lista de variables para enviar
		$cero  =md5($app);
		$uno   =$this->encrypt($user,"513w521yfp51301");
		$dos   =$this->encrypt($pass,"513w521yfp51303");
		$tres  =$this->encrypt($role,"513w521yfp51305");
		$cuatro=$this->encrypt($_SERVER['REMOTE_ADDR'],"513w521yfp51307");
		
		$data = array('cero' => $cero, 'uno' => $uno, 'dos' => $dos, 'tres' => $tres, 'cuatro' => $cuatro);
		$result="NO";
		if(!isset($_SESSION['INTENTOSWS'])){$_SESSION['INTENTOSWS']=0;}
		$result.=$_SESSION['INTENTOSWS'];
		
		if($_SESSION['INTENTOSWS']<3) {
			$ch = curl_init();
			curl_setopt($ch,CURLOPT_URL, $url);
			curl_setopt($ch,CURLOPT_POST, true);
			curl_setopt($ch,CURLOPT_POSTFIELDS, $data);
			curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
			$result = curl_exec($ch);
			$result = $this->decrypt($result,"513w521yfp51309");
			if(!$result || $result=="" || $result=="NO") {
				$_SESSION['INTENTOSWS']++;
			}
		}
		return $result;
	}
	
	function encrypt($desencriptado, $contrasena='zs13yfpW53ncd', $adicional='!WkDUn*fAF3p34FhjBm%1-')
	{   $key = hash('SHA256', $contrasena.$adicional.$contrasena, true);
		srand(); 
		
		//$iv = mcrypt_create_iv(mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC), MCRYPT_RAND);
		$ivSize = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC);
		$iv = mb_substr ($key, 0, $ivSize);
		
		if (strlen($iv_base64 = rtrim(base64_encode($iv), '=')) != 22) return false;
		$encrypted = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $desencriptado . md5($desencriptado), MCRYPT_MODE_CBC, $iv));
		return $iv_base64 . $encrypted;
	}
	
	function decrypt($encrypted, $contrasena='zs13yfpW53ncd', $adicional='!WkDUn*fAF3p34FhjBm%1-') 
	{   $key       = hash('SHA256', $contrasena.$adicional.$contrasena, true);
		
		//$iv        = base64_decode(substr($encrypted, 0, 22) . '==');
		$ivSize = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_CBC);
		$iv = mb_substr ($key, 0, $ivSize);
		
		$encrypted = substr($encrypted, 22);
		$decrypted = rtrim(mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, base64_decode($encrypted), MCRYPT_MODE_CBC, $iv), "\0\4");
		$hash      = substr($decrypted, -32);
		$decrypted = substr($decrypted, 0, -32);
		if(md5($decrypted) != $hash) return false;
		return $decrypted;
	}/**/
}
?>
